enum 50100 "Transaction Type"
{

    // Enum to set the transaction type when a book is rented or returned.
    Extensible = true;
    
    value(0; " ")
    {
    }
    value(1; "Rent")
    {
        Caption = 'Rent';
    }
    value(2; "Return")
    {
        Caption = 'Return';
    }
}