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
        field(50161; "IsUpdated"; boolean)
        {
            Caption = 'Is Updated';
            InitValue = false;
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
    trigger OnInsert();
    begin
        if  Rec."Transactions Type" = enum::"Transaction Type"::Rent  then
            exit;
        UpdateBookGrade(Rec);
        
    end;


    // Procedure to update the books Grade.
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


    // Calculate return date for  a book when rented
    procedure CalcReturnDate()
    var
        LibraryBooks: Record "Library Books";
        LibraryGeneralSetup: Record "Library General Setup";
        ReturnDate: Date;
        GetSetupRentPeriod: Integer;
    begin
        if Rec."Transactions Type" = Enum::"Transaction Type"::Rent then begin
            // Get max rent period from setup.
            LibraryGeneralSetup.GetRecordOnce();
            LibraryGeneralSetup.TestField("Rent Period");
            GetSetupRentPeriod := LibraryGeneralSetup."Rent Period";

            ReturnDate := Rec."Transactions Date" + GetSetupRentPeriod;
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