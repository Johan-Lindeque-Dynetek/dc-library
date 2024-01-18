table 50100 "Library Books"
{
    Caption = 'Library Books';
    TableType = Normal;
    DataClassification = CustomerContent;

    fields
    {
        field(1; BookID; Integer)
        {
            Caption = 'BookID';
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
            
            // Update "Sequel" field for the book for which the add sequle action was run.
            trigger OnValidate();
            var
                LibraryBooks: Record "Library Books";
            begin

                LibraryBooks.SetRange(Title,rec.Prequel);
                if  LibraryBooks.FindFirst() then begin
                    LibraryBooks.Validate(Sequel, rec.Title);
                    LibraryBooks.Modify();
                end;
                
            end;

        }
        field(3; Author; Text[50])
        {
            Caption = 'Author';
            DataClassification = CustomerContent;
        }
        field(4; "Rent Status"; Text[20])
        {
            Caption = 'Rent Status';
            DataClassification = CustomerContent;

        }
        field(5; Genre; Text[50])
        {
            Caption = 'Genre';
            DataClassification = CustomerContent;
        }
        field(6; Publisher; Text[50])
        {
            Caption = 'Publisher';
            DataClassification = CustomerContent;
        }
        field(7; "Book Price"; Decimal)
        {
            Caption = 'Book Price';
            DataClassification = CustomerContent;
        }
        field(8; "Publication Date"; Date)
        {
            Caption = 'Publication Date';
            DataClassification = CustomerContent;
        }
        field(9; Pages; Integer)
        {
            Caption = 'Pages';
            DataClassification = CustomerContent;
        }
        field(10; Series; Text[100])
        {
            Caption = 'Series';
            DataClassification = CustomerContent;

        }
        field(11; Prequel; Text[100])
        {
            Caption = 'Prequel';
            DataClassification = CustomerContent;

        }
        field(12; Sequel; Text[100])
        {
            Caption = 'Sequel';
            DataClassification = CustomerContent;
        }
        field(13; "Rented Amount"; Integer)
        {
            Caption = 'Rented Amount';
            DataClassification = CustomerContent;

        }

    }

    keys
    {
        key(PK; BookID)
        {
            Clustered = true;
        }
    }


    // Procedure to update a books "Rent Status" depending on if it was rent/returned.
    procedure UpdateBookStatus(BookID: Integer; NewStatus: Text[20])
    var
        LibraryBooks: Record "Library Books";
    begin

        if LibraryBooks.Get(BookID) then
            case NewStatus of
                'Rent':
                    begin
                        LibraryBooks.Validate("Rent Status", 'Rented');
                        LibraryBooks.Validate("Rented Amount", LibraryBooks."Rented Amount" + 1);
                        LibraryBooks.Modify();
                    end;
                'Return':
                    begin
                        LibraryBooks.Validate("Rent Status", 'Available');
                        LibraryBooks.Modify();
                    end;
            end;// Case

    end;

  
    // Procedure to add a sequel to the book selected.
    procedure AddSequelBook(LibraryBooks: Record "Library Books")
    var
        LibraryBookSequel: Record "Library Books";
        AddSequel: Page "Add Sequel";
    begin
        LibraryBookSequel.Init();

        LibraryBookSequel.Validate(BookID);
        LibraryBookSequel.Validate(Prequel, LibraryBooks.Title);
        LibraryBookSequel.Validate(Series, LibraryBooks.Series);
        LibraryBookSequel.Validate(Author, LibraryBooks.Author);
        LibraryBookSequel.Validate(Genre, LibraryBooks.Genre);
        LibraryBookSequel.Validate("Rented Amount", 0);
        LibraryBookSequel.Validate("Rent Status", 'Available');
        LibraryBookSequel.Validate("Rented Amount", 0);
        LibraryBookSequel.Validate(Publisher, LibraryBooks.Publisher);
        // LibraryBookSequel.Validate("Publication Date",Today());


        LibraryBookSequel.Insert();
        AddSequel.SetRecord(LibraryBookSequel);
        AddSequel.Run();

    end;

}