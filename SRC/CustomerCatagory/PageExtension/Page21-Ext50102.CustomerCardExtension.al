pageextension 50102 "CustomerCardExtension" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Customer Category Code"; "Customer Category Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action("Assign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category';

                trigger OnAction();
                var
                    CustomerMgt: Codeunit "Customer Management";
                begin
                    CustomerMgt.AssignDefaultCatgory(Rec."No.");
                end;

            }
        }
    }

    var
        myInt: Integer;
}