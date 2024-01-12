table 50101 "Books Transactions"
{
    Caption = 'Books Transactions';
    DataClassification = CustomerContent;

    fields
    {
        field(1; TransactionID; Integer)
        {
            Caption = 'TransactionID';
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Editable = false;
        }
        field(2; BookID; Integer)
        {
            Caption = 'BookID';
            DataClassification = CustomerContent;
            TableRelation = "Library Books".BookID;
        }
        field(3; Title; Text[100])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
            TableRelation = "Library Books".Title;
        }
        field(4; Author; Text[50])
        {
            Caption = 'Author';
            DataClassification = CustomerContent;
            TableRelation = "Library Books".Author;
        }
        field(5; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(6; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
        }
        field(7; "Transactions Type"; Text[50])
        {
            Caption = 'Transactions Type';
            DataClassification = CustomerContent;
        }
        field(8; "Transactions Date" ; DateTime)
        {
            Caption = 'Transactions Date';
            DataClassification = CustomerContent;
        }
        
        
        

    }

    keys
    {
        key(PK; TransactionID)
        {
            Clustered = true;
        }
        key(FK_Books; BookID)
        {
            Clustered = false;
        }
        key(FK_Customers; "Customer No.")
        {
            Clustered = false;
        }
    }

     procedure RentOutBook(LibraryBooks: Record "Library Books")
     var
     BookTransaction: Page "Book Transaction";
        book: Text[100];
        
    begin
        
        BookTransaction.MyProcedure(LibraryBooks);
    end;


    var


}