page 50104 "Book Transaction"
{
    Caption = 'Book Transaction';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Books Transactions";
    
    layout
    {
        area(Content)
        {
            group("GroupName")
            {
                
               
                field(TransactionID; Rec.TransactionID)
                {
                    ToolTip = 'Specifies the value of the TransactionID field.';
                }
                field(BookID; Rec.BookID)
                {
                    ToolTip = 'Specifies the value of the BookID field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Transactions Type"; Rec."Transactions Type")
                {
                    ToolTip = 'Specifies the value of the Transactions Type field.';
                }
                field("Transactions Date"; Rec."Transactions Date")
                {
                    ToolTip = 'Specifies the value of the Transactions Date field.';
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