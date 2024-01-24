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

            // Get the Customer info for the Customer No. selected.
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

            // Calls Procedure to update a books "Rent Status" .
            trigger OnValidate();
            var
                LibraryBooks: Record "Library Books";
                TransactionTypeText: Text[20];
            begin
                TransactionTypeText := Format("Transactions Type");
                LibraryBooks.UpdateBookStatus(BookID, TransactionTypeText);
            end;
        }
        field(8; "Transactions Date"; Date)
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
        
    }

    // Procedure to get the LibraryBooks record that was selected then init a new record in the BookTransaction table.
    procedure NewBookTransaction(LibraryBooks: Record "Library Books")
    var
        BookTransaction: record "Books Transactions";
        PreviousBookTransaction: record "Books Transactions";
        BookTransactionPage: Page "Book Transaction";

    begin

        BookTransaction.Init();
        // BookTransaction.BookID := LibraryBooks.BookID;
        BookTransaction.Validate(BookID, LibraryBooks.BookID);
        BookTransaction.Validate(Title, LibraryBooks.Title);
        BookTransaction.Validate(Author, LibraryBooks.Author);
        BookTransaction.Validate("Transactions Date", Today());

        case LibraryBooks."Rent Status" of
            'Rented':
                begin
                    BookTransaction.Validate("Transactions Type", "Transactions Type"::Return);

                    PreviousBookTransaction.SetRange(BookID, LibraryBooks.BookID);
                    if PreviousBookTransaction.FindLast() then begin
                        BookTransaction.Validate("Customer No.", PreviousBookTransaction."Customer No.");
                        BookTransaction.Validate("Customer Name", PreviousBookTransaction."Customer Name");
                    end;
                end;
            'Available':
                    BookTransaction.Validate("Transactions Type", "Transactions Type"::Rent);
            'OVERDUE':
                begin
                    BookTransaction.Validate("Transactions Type", "Transactions Type"::Return);

                    PreviousBookTransaction.SetRange(BookID, LibraryBooks.BookID);
                    if PreviousBookTransaction.FindLast() then begin
                        BookTransaction.Validate("Customer No.", PreviousBookTransaction."Customer No.");
                        BookTransaction.Validate("Customer Name", PreviousBookTransaction."Customer Name");
                    end;
                end;
        end;

        BookTransaction.Insert();
        BookTransactionPage.SetRecord(BookTransaction);
        BookTransactionPage.Run();

    end;





}