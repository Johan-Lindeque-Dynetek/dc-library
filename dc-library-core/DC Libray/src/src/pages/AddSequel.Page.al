page 50102 "Add Sequel"
{
    Caption = 'Add Sequel';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = none;
    SourceTable = "Library Books";

    layout
    {
        area(Content)
        {
            
                
                
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the MyField field.';
                    ShowMandatory = true;

                   
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                    ShowMandatory = true;

                }
                field(Genre; Rec.Genre)
                {
                    ToolTip = 'Specifies the value of the Genre field.';
                    ShowMandatory = true;

                }
                field(Pages; Rec.Pages)
                {
                    ToolTip = 'Specifies the value of the Pages field.';
                    ShowMandatory = true;

                }
                field(Publisher; Rec.Publisher)
                {
                    ToolTip = 'Specifies the value of the Publisher field.';
                    ShowMandatory = true;

                }
                field("Publication Date"; Rec."Publication Date")
                {
                    ToolTip = 'Specifies the value of the Publication Date field.';
                    // ShowMandatory = true;

                }
                field("Book Price"; Rec."Book Price")
                {
                    ToolTip = 'Specifies the value of the Book Price field.';
                    ShowMandatory = true;

                }
                field(Series; Rec.Series)
                {
                    ToolTip = 'Specifies the value of the Series field.';
                    ShowMandatory = true;

                }
            
        }
    }

   
   
    
}