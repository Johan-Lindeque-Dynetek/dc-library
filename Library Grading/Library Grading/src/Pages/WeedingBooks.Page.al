page 50152 "Weeding Books"
{
    Caption = 'Weeding Books.';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Library Books";
    
    layout
    {
        area(Content)
        {
            group("Weed books:")
            {
                
                
                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BookID field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MyField field.';
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Description field.';
                }
                field("Rent Status"; Rec."Rent Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rent Status field.';
                }
                field(Weeded; rec."Weeded Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weeded field.';
                }
            }
        }
    }
    
    
}