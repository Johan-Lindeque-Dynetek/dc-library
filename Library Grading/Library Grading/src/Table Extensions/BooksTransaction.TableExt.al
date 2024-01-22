tableextension  50151 "Books Transaction Grading Ext" extends "Books Transactions"
{
    fields
    {
        field(50150; "Return Date"; Date)
        {
            Caption = 'Return Date';
            DataClassification = CustomerContent;
        }
        field(50160; "Grade"; Enum "Book Grade")
        {
            Caption = 'Grade';
            DataClassification = CustomerContent;
                          
        }
        field(50170; "Grade Description"; Text[200])
        {
            Caption = 'Grade Description';
            DataClassification = CustomerContent;
        }
        

        
    }

    procedure UpdateBookGrade(BooksTransactions: Record "Books Transactions")
    var
        LibraryBooks: Record "Library Books";
    begin
        if LibraryBooks.BookID = Rec.BookID then begin
            LibraryBooks.Validate(Grade , rec.Grade);
            LibraryBooks.Validate("Grade Description", rec."Grade Description");
            LibraryBooks.Modify();
           
        end;
        
    end;

    
    
}