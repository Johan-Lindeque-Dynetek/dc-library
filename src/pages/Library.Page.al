page 50100 "Library"
{
    Caption = 'Library';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Books";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                repeater("Books")
                {
                    field(BookID; Rec.BookID)
                    {
                        ToolTip = 'Specifies the value of the BookID field.';
                    }
                    
                    field(Title; Rec.Title)
                    {
                        ToolTip = 'Specifies the value of the MyField field.';
                    }
                    field(Author; Rec.Author)
                    {
                        ToolTip = 'Specifies the value of the Author field.';
                    }
                    field("Rent Status"; Rec."Rent Status")
                    {
                        ToolTip = 'Specifies the value of the Rent Status field.';
                    }
                    field(Genre; Rec.Genre)
                    {
                        ToolTip = 'Specifies the value of the Genre field.';
                    }
                    field(Publisher; Rec.Publisher)
                    {
                        ToolTip = 'Specifies the value of the Publisher field.';
                    }
                    field("Book Price"; Rec."Book Price")
                    {
                        ToolTip = 'Specifies the value of the Book Price field.';
                    }
                    field("Publication Date"; Rec."Publication Date")
                    {
                        ToolTip = 'Specifies the value of the Publication Date field.';
                    }
                    field(Pages; Rec.Pages)
                    {
                        ToolTip = 'Specifies the value of the Pages field.';
                    }
                    field(Series; Rec.Series)
                    {
                        ToolTip = 'Specifies the value of the Series field.';
                    }
                    field(Prequel; Rec.Prequel)
                    {
                        ToolTip = 'Specifies the value of the Prequel field.';
                    }
                    field(Sequel; Rec.Sequel)
                    {
                        ToolTip = 'Specifies the value of the Sequel field.';
                    }
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