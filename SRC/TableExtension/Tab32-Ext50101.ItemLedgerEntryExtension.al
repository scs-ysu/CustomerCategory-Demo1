tableextension 50101 ItemLedgerEntryExtension extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Customer Category"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Category";
            Caption = 'Customer catagory code';
        }
        modify("Document No.")
        {
            Caption = 'Document number';
        }
    }

    var
        myInt: Integer;
}