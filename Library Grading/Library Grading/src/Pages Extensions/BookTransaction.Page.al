pageextension 50151 "Book Transaction" extends "Book Transaction"
{
    layout
    {
        addafter("Customer Name")
        {
            
            field("Return Date"; Rec."Return Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Return Date field.';
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade field.';
            }
        }
        
    }
}