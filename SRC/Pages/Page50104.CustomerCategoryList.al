page 50100 "Customer Category List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Category";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = ALL;
                }

                field(TotalCustomersForCatogoryCode; TotalCustomersForCatogoryCode)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Total Customers for Catgory Code';
                }
                field(FreeGiftsAvailable; FreeGiftsAvailable)
                {
                    ApplicationArea = ALL;
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
            action("Create Default Catgeory Code")
            {
                ApplicationArea = All;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Create Default Category Code';
                Caption = 'Create Default Category Code';

                trigger OnAction();
                var
                    CustManager: Codeunit "Customer Management";
                begin
                    // !Integration Event Raised
                    OnBeforeCreateDeafultCategoryAction(Rec);
                    CustManager.CreateDefaultCategory();
                    // !Integration Event Raised
                    OnAfterCreateDefaultCategoryCode(Rec);
                end;
            }
        }
    }

    [IntegrationEvent(true, true)]
    local procedure OnBeforeCreateDeafultCategoryAction(var CustCatgeory: Record "Customer Category")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterCreateDefaultCategoryCode(var CustCatgeory: Record "Customer Category")
    begin

    end;
}