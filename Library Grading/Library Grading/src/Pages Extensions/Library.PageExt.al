pageextension 50150 Library extends Library
{
    layout
    {
        addafter(Series)
        {
            
            field("Return Date"; Rec."Return Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Return Date" field.';
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade field.';
            }
            field("Grade Description"; Rec."Grade Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade Description field.';
            }
            field(Weeded; Rec.Weeded)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Weeded field.';
            }
        }
        
    }
}