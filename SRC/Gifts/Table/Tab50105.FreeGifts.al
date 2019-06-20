table 50105 Freegifts
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Free Gift List";
    LookupPageId = "Free Gift List";
    Caption = 'Free gifts';

    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Category Code';
            TableRelation = "Customer Category";
        }
        field(10; ItemNo; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';

        }
        field(20; MinimumOrderQty; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum order quantity';
        }
        field(30; GiftQuantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gift Qunatity';
        }
    }

    keys
    {
        key(PK; CustomerCategoryCode, ItemNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}