report 50100 CustomerCategoryList
{
    RDLCLayout = 'Layout\CustomerCategoryListRDLC.rdl';
    WordLayout = 'Layout\CustomerCategoryListWord.docx';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(CustomerCategory; "Customer Category")
        {
            column(No; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Default; Default)
            {

            }
            column(TotalCustomersForCatogoryCode; TotalCustomersForCatogoryCode)
            {

            }
            column(FreeGiftsAvailable; FreeGiftsAvailable)
            {

            }

            trigger OnAfterGetRecord()
            var

            Begin
                CalcFields(TotalCustomersForCatogoryCode);
            End;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;

}