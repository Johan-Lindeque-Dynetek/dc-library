page 50105 "Library General Setup"
{

    PageType = Card;
    SourceTable = "Library General Setup";
    Caption = 'General Library Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group("No. series")
            {
                Caption = 'Setup No. series:';
                field("Library Books Nos."; Rec."Library Books Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Library Books Nos. field.';
                }
                field("Book Transaction Nos."; Rec."Book Transaction Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book Transaction Nos. field.';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
