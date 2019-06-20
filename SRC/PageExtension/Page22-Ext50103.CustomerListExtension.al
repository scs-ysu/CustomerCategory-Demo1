pageextension 50103 "CustomerListExtension" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
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
                    CustomerMgt.AssignDefaultCatgory();
                end;

            }
        }
    }

    var
        myInt: Integer;
}


