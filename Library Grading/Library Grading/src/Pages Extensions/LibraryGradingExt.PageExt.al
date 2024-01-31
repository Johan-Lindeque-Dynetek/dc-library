pageextension 50150 "Library Grading Ext" extends Library
{
    layout
    {
        addafter(Series)
        {

            field("Return Date"; Rec."Return Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Return Date" field.';
                Editable = false;

            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade field.';
                Editable = false;

            }
            field(Weeded; Rec."Weeded Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Weeded field.';
                Editable = false;
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
                Caption = 'Update grade of book';
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

            action("WeedingBooks")
            {
                ApplicationArea = All;
                Caption = 'Weeding books..';
                ToolTip = 'Filter out books that is archved during weeding process. These books cant be rented out.';
                Image = FiledPosted;

                trigger OnAction()
                var
                    WeedingBooks: Page "Weeding Books";
                begin
                    WeedingBooks.SetRecord(Rec);
                    WeedingBooks.RunModal();

                end;
            }
        }

        addafter("Recently Published")
        {
            action("BooksForRepair")
            {
                ApplicationArea = All;
                Caption = 'Books for Repair.';
                ToolTip = 'FIlter and show all the books that currently needs repaired. These books cant be rented out.';
                Image = ServicePriceAdjustment;



                trigger OnAction()
                begin
                    Rec.FilterBooksForRepair();
                end;
            }
            action(CheckOverdue)
            {
                ApplicationArea = All;
                Caption = 'Books Overdue.';
                ToolTip = 'FIlter and show all the books that currently are overdue for return.';
                Image = BlanketOrder;

                trigger OnAction()
                var
                    LibraryBooks: Record "Library Books";
                begin
                    LibraryBooks.CheckOverdueBooks();

                end;
            }
        }
    }


}