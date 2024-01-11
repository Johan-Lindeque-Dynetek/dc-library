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
        }
        field(2; BookID; Integer)
        {
            Caption = 'BookID';
            DataClassification = CustomerContent;
            TableRelation = "Library Books".BookID;
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(4; "Transactions Type"; Text[50])
        {
            Caption = 'Transactions Type';
            DataClassification = CustomerContent;
        }
        field(5; "Transactions Date" ; DateTime)
        {
            Caption = 'Transactions Date';
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

}