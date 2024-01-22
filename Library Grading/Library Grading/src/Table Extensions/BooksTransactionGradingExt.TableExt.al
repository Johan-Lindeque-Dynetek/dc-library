tableextension 50151 "Books Transaction Grading Ext" extends "Books Transactions"
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


        modify("Transactions Type")
        {
            trigger OnAfterValidate();
            begin
                Rec.CalcReturnDate();
            end;
        }


    }

    /// <summary>
    /// Procedure to update the books Grade.
    /// </summary>
    /// <param name="BooksTransactions"></param>
    procedure UpdateBookGrade(BooksTransactions: Record "Books Transactions")
    var
        LibraryBooks: Record "Library Books";
    begin
        if LibraryBooks.BookID = Rec.BookID then begin
            LibraryBooks.Validate(Grade, rec.Grade);
            LibraryBooks.Validate("Grade Description", rec."Grade Description");
            LibraryBooks.Modify();

        end;

    end;

    /// <summary>
    /// Calculate return date for  a book when rented
    /// </summary>
    procedure CalcReturnDate()
    var
        LibraryBooks: Record "Library Books";
        ReturnDate: Date;
    begin
        if Rec."Transactions Type" = Enum::"Transaction Type"::Rent then begin
            ReturnDate := Rec."Transactions Date" + 5;
            Rec.Validate("Return Date", ReturnDate);

            if LibraryBooks.Get(Rec.BookID) then begin
                LibraryBooks.Validate("Return Date", Rec."Return Date");
                LibraryBooks.Modify();
            end;
        end;
        if (Rec."Transactions Type" = Enum::"Transaction Type"::Return) or (Rec."Transactions Type" = Enum::"Transaction Type"::Overdue) then begin
            
            Rec.Validate("Return Date", Today());

            if LibraryBooks.Get(Rec.BookID) then begin
                LibraryBooks.Validate("Return Date", Rec."Return Date");
                LibraryBooks.Modify();
            end;
        end;


    end;



}