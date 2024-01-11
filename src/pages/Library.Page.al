page 50100 "Library"
{
    Caption = 'Library';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Books";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(GroupName)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}