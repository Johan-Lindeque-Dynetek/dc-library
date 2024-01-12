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
        }
        field(3; Author; Text[100])
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
    
}