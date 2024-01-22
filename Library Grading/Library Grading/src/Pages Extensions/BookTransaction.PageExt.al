pageextension 50151 "Book Trans Grading Ext" extends "Book Transaction"
{
    layout
    {
        addafter(Author)
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
            field("Grade Description"; Rec."Grade Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grade Description field.';
            }
            
        }
    }

    // trigger OnInsertRecord();
    // var
    //     BooksTransactions: Record "Books Transactions";
    // begin
    //     if Rec."Transactions Type" = Enum::"Transaction Type"::Return then begin
    //         BooksTransactions.UpdateBookGrade(rec);
    //     end;
        
        
        
    // end;
    

    

  
}