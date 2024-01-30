pageextension 50154 "Library Gen. Set. Grading Ext." extends "Library General Setup"
{
    layout
    {
        addafter("No. series")
        {
            group("Rent/return of books")
            {
                Caption = 'Setup the MAX rent period a book can be rented.';
                field("Rent Period"; Rec."Rent Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rent Period field.';
                }
            }

        }        
    }
}