page 50104 "Book Transaction"
{
    Caption = 'Book Transaction';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Books Transactions";
    
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