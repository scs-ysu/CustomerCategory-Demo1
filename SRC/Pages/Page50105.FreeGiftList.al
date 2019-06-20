page 50101 "Free Gift List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Freegifts;
    Caption = 'Free Gift Setup';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;


                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                }
                Field(MinimumOrderQty; MinimumOrderQty)
                {
                    ApplicationArea = All;
                }
                field(GiftQuantity; GiftQuantity)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}