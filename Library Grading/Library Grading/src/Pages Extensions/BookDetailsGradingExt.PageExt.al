pageextension 50153 "Book Details Grading Ext" extends "Book Details"
{
    layout
    {
        addafter("Series info")
        {
            group("Book Grade")
            {
                Caption = 'Book Grade:';

                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current Grade of the.';
                    Editable = false;

                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies why a book recieved a specific Grade.';
                    Editable = false;

                }

            }
        }
    }


    actions
    {
        addafter("Rent/Return")
        {
            action("GradeBook")
            {
                ApplicationArea = All;
                Caption = 'Update the grade of a book';
                ToolTip = 'Change or give a book a grading based on its condition. Options areA,B,C,D with A being the highest and D the lowest rating';
                Image = "1099Form";

                trigger OnAction()
                var
                    BookGrading: Page "Book Grading";
                begin
                    BookGrading.SetRecord(Rec);
                    BookGrading.Run();
                end;
            }
        }
    }
}