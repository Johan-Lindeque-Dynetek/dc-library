pageextension 50151 "Book Trans Grading Ext" extends "Book Transaction"
{
    layout
    {
        addafter(Author)
        {

            field("Return Date"; Rec."Return Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Return Date field.';
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

        }
    }

    trigger OnOpenPage();
    var 
        LibraryBooks: Record "Library Books";
    begin
        if Rec."Transactions Type" = Enum::"Transaction Type"::Rent then begin
            if LibraryBooks.Get(Rec.BookID) then begin
                Rec.Grade := LibraryBooks.Grade;
                Rec."Grade Description" := LibraryBooks."Grade Description";
            end;

        end;
        
    end;

}