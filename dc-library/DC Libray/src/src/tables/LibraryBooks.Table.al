table 50100 "Library Books"
{
    Caption = 'Library Books';
    TableType = Normal;
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;BookID; Integer)
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
            // trigger OnValidate()
            // var
            //     LibraryBooks: Record "Library Books";
            // begin
            //     if Rec.Prequel <> '' then begin
            //         LibraryBooks.UpdateBookSequel(rec.Prequel,rec.Title);
            //     end;
                
            // end;
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


    procedure UpdateBookStatus(BookID : Integer; NewStatus: Text[20]) 
    var
        LibraryBooks: Record "Library Books";
    begin
        if LibraryBooks.Get(BookID) then begin
            if NewStatus = 'Rent' then begin
            LibraryBooks."Rent Status" := 'Rented';
            LibraryBooks."Rented Amount" := LibraryBooks."Rented Amount" +1;
            LibraryBooks.Modify();
                
            end;
            if NewStatus = 'Return' then begin
            LibraryBooks."Rent Status" := 'Available';
            LibraryBooks.Modify();
                
            end;
        
        end;
        
    end;

    procedure AddSequelBook(LibraryBooks: Record "Library Books")
    var
        LibraryBookSequel: Record "Library Books";
        AddSequel: Page "Add Sequel";
    begin
        

        LibraryBookSequel.Init();

        LibraryBookSequel.Validate(BookID);
        LibraryBookSequel.Validate(Prequel,LibraryBooks.Title);
        LibraryBookSequel.Validate(Series,LibraryBooks.Series);
        LibraryBookSequel.Validate(Author,LibraryBooks.Author);
        LibraryBookSequel.Validate(Genre,LibraryBooks.Genre);
        LibraryBookSequel.Validate("Rented Amount",0);
        LibraryBookSequel.Validate("Rent Status",'Available');
        LibraryBookSequel.Validate("Rented Amount",0);
        LibraryBookSequel.Validate(Publisher,LibraryBooks.Publisher);
        // LibraryBookSequel.Validate("Publication Date",Today());

        LibraryBookSequel.Insert();
        AddSequel.SetRecord(LibraryBookSequel);
        AddSequel.Run();

        LibraryBooks.Validate(Sequel,LibraryBookSequel.Title);

        

    end;

    procedure UpdateBookSequel(FindTitle: Text[100]; SequelBook: Text[100]) 
    var
        LibraryBooks: Record "Library Books";
    begin
        LibraryBooks.SetRange(Title,FindTitle);
        if LibraryBooks.Get(FindTitle) then begin
            LibraryBooks.Validate(Sequel,SequelBook);
            LibraryBooks.Modify();
                
        end;
        
       
        
    end;
    
}