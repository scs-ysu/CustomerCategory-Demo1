tableextension 50100 "CustomerTableExtensions" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Customer Category Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Category";
            Caption = 'Customer Catgeory Code';
        }
    }

    var
        myInt: Integer;
}