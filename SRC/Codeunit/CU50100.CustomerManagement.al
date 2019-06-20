codeunit 50100 "Customer Management"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure AssignDefaultCatgory(Var CustNum: Code[20])
    var
        Customer: Record Customer;
        CustCategory: Record "Customer Category";
    begin
        Customer.get(CustNum);
        CustCategory.SetRange(Default, true);
        if CustCategory.FindFirst() then begin
            Customer."Customer Category Code" := CustCategory."No.";
            Customer.Modify();
        end;
    end;

    procedure AssignDefaultCatgory()
    var
        Customer: Record Customer;
        CustCategory: Record "Customer Category";
    begin

        CustCategory.SetRange(Default, true);
        if CustCategory.FindFirst() then begin
            if Customer.FindSet() then
                repeat
                    Customer."Customer Category Code" := CustCategory."No.";
                    Customer.Modify();
                until Customer.Next() = 0;

        end;
    end;

    procedure CreateDefaultCategory()
    var
        CustCatgeory: Record "Customer Category";
    begin
        CustCatgeory."No." := 'DEFAULT';
        CustCatgeory.Description := 'Default Customer Category';
        CustCatgeory.Default := true;
        if CustCatgeory.Insert Then;
    end;

    procedure GetTotalCustomersWithoutCatgory(): Integer
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("Customer Category Code", '');
        exit(Customer.Count());
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    Var
        FreeGift: Record Freegifts;
        Customer: Record Customer;
        SalesLine: Record "Sales Line";
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer."Customer Category Code", Rec."No.") and (Rec.Quantity > FreeGift.MinimumOrderQty) then begin
                OnBeforeFreeGiftSalesLineAdded(Rec);
                SalesLine.Init();
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                OnAfterFreeGiftSalesLineAdded(Rec);

            end;
        end;
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        customer: Record Customer;
    begin
        if rec."Entry Type" = rec."Entry Type"::Sale then begin
            if customer.get(rec."Source No.") then begin
                Rec."Customer Category" := customer."Customer Category Code";
                rec.Modify();
            end;

        end;
    end;
}