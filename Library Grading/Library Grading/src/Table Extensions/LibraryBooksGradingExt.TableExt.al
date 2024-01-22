tableextension 50150 "Library Books Grading Ext" extends "Library Books"
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

            trigger OnValidate();
            var

            begin
                if Rec.Grade = Enum::"Book Grade"::D then
                    Rec."Rent Status" := 'Need repair.';

            end;
        }
        field(50170; "Grade Description"; Text[200])
        {
            Caption = 'Grade Description';
            DataClassification = CustomerContent;
        }
        field(50180; "Weeded Status"; Enum WeedingBooks)
        {
            Caption = 'Weeded';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Rec.WeedingOutBooks();
            end;
        }
    }

    //  Procedure to filter all the books and show the books tha needs repair.
    procedure FilterBooksForRepair()
    begin
        Rec.SetRange("Rent Status", 'Need repair.');

    end;

    // Procedure weed out books and set "Rent Status" to Archived and cant be rented anymore.
    procedure WeedingOutBooks()
    begin
        case Rec."Weeded Status" of
            WeedingBooks::Archived:
                begin
                    Rec.Validate("Rent Status", 'Archived');
                    Message('The book ' + Rec.Title + ' was added to the Archive and can not be rented anymore.');
                end;
            WeedingBooks::Available:
                begin
                    Rec.Validate("Rent Status", 'Available');
                    Message('The book ' + Rec.Title + ' was made available to rent again.');
                end;
    
        end;
    end;


    



}