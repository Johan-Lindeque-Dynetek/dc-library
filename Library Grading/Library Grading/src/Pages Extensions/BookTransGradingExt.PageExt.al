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
            field(Grade; CurrentGrade)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade field.';

            }
            field("Grade Description"; CurrentGradeDesc)
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
                CurrentGrade := LibraryBooks.Grade;
                CurrentGradeDesc := LibraryBooks."Grade Description";
            end;

        end;
        
    end;
    trigger OnClosePage();
    var 
        LibraryBooks: Record "Library Books";
    begin
        if LibraryBooks.Get(Rec.BookID) then begin
                LibraryBooks.Grade := CurrentGrade  ;
                LibraryBooks."Grade Description" := CurrentGradeDesc ;
            end;

    end;

    var
        CurrentGrade: Enum "Book Grade";
        CurrentGradeDesc: Text[200];

}