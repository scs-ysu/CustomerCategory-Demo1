pageextension 50104 MyNewBCHeadline extends "Headline RC Business Manager"
{
    layout
    {
        // Add changes to page layout here
        addafter(Control4)
        {
            field(newHeadLineText; newHeadLineText)
            {
                ApplicationArea = All;
                trigger OnDrillDown()
                var
                    Customer: Record Customer;
                    CustomerList: Page "Customer List";
                Begin
                    Customer.SetRange("Customer Category Code", '');
                    CustomerList.SetTableView(Customer);
                    CustomerList.Run();
                End;
            }
        }
    }

    actions
    {
        // Add changes to page actions here

    }

    var
        myInt: Integer;
        newHeadLineText: Text;

    trigger OnOpenPage()
    var
        HeadLineMgt: Codeunit "Headline Management";
        CustomerMgt: Codeunit "Customer Management";
    Begin
        newHeadLineText := 'Number of Customers without assigned Customer catagory:' + HeadLineMgt.Emphasize(Format(CustomerMgt.GetTotalCustomersWithoutCatgory()));
    End;
}