tableextension  50151 "Books Transaction" extends "Books Transactions"
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
        
    }
    
}