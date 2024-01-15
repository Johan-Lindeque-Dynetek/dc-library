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

            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
              
                if Cust.Get("Customer No.") then begin
                    "Customer Name" := Cust.Name;
                    "Customer Email" := Cust."E-Mail";

                end;

                    
            end;
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            
        }
        field(7; "Transactions Type"; Enum "Transaction Type")
        {
            Caption = 'Transactions Type';
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                LibraryBooks: Record "Library Books";
               TransactionTypeText: Text[20];
            begin
                TransactionTypeText := Format("Transactions Type");
                LibraryBooks.UpdateBookStatus(BookID, TransactionTypeText);
            end;
        }
        field(8; "Transactions Date" ; DateTime)
        {
            Caption = 'Transactions Date';
            DataClassification = CustomerContent;
        }
        field(9; "Customer Email"; Text[80])
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
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

    // Procedure to get record that was selected.
     procedure GetSelectedBookRec(LibraryBooks: Record "Library Books")  
    begin
        
        GetBookDetailsForTransaction(LibraryBooks);
    end;


    procedure GetBookDetailsForTransaction(LibraryBooks: Record "Library Books")
     var 
        BookTransaction: record  "Books Transactions";
        BookTransactionPage: Page "Book Transaction";
        
    begin
        TheBookID := LibraryBooks.BookID;
        TheBookTitle := LibraryBooks.Title;
        TheBookAuthor := LibraryBooks.Author;
        BookTransaction.Init();
        BookTransaction.BookID := TheBookID;
        BookTransaction.Title := TheBookTitle;
        BookTransaction.Author := TheBookAuthor;



        BookTransaction.Insert();
        BookTransactionPage.SetRecord(BookTransaction);
        BookTransactionPage.Run();

        // DisplayBookAndCustomerDetails();
        
        
    end;

    procedure CreateTransaction() 
    var
        
        BookTransaction: Record "Books Transactions";
    begin
        //  Initialize new record in Book Transaction table.
        BookTransaction.Init();
        BookTransaction.BookID := TheBookID;
        BookTransaction.Title := TheBookTitle;
        BookTransaction.Author := TheBookAuthor;



        BookTransaction.Insert();
        
       
    end;
    
    
    
    var
        // Store the book information
        TheBookID: Integer;
        TheBookTitle: Text[100];
        TheBookAuthor: Text[50];

        // Store the customer information
        TheCustNO: Integer;
        TheCustName: Text[50];



}