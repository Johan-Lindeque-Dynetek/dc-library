page 50251 "Library General API Setup"
{
    Caption = 'Library General API Setup';
    PageType = Card;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "Library General API Setup";

    layout
    {
        area(Content)
        {
            group("Open Library")
            {
                field("OL API Nos."; Rec."OL API Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Open LibraryAPI Nos. field.';
                }
                // field("OL Base URL"; Rec."OL Base URL")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Open Library Base URL field.';
                // }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;


    
}