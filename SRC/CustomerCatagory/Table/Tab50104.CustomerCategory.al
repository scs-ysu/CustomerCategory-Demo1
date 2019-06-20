table 50104 "Customer Category"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    caption = 'Customer Category';
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            //CaptionML = [ENU = No.;
            //               DEU = Nr. ];
            Caption = 'No.';
            trigger OnValidate();
            begin

            end;

        }
        field(10; Description; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(20; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(30; TotalCustomersForCatogory; Integer)
        {
            DataClassification = CustomerContent;
            // CalcFormula = count (Customer where ("Customer Category" = field("No.")));
            Caption = 'Total Customers for Category';
        }
        field(40; EnabledNewsLetters; Option)
        {
            OptionMembers = " ","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            Caption = 'Enabled Newsletter';
            DataClassification = CustomerContent;
        }
        field(50; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free gift Avaliable';
        }
    }

    keys
    {
        key(PK; "No.")
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