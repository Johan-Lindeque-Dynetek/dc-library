page 50151 "Book Grading"
{
    Caption = 'Book Grading';
    PageType = ConfirmationDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Books";
    
    layout
    {
        area(Content)
        {
            group("Book detail")
            {
                Caption = 'Book detail';
                
                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BookID field.';
                    Editable = false;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MyField field.';
                    Editable = false;

                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author field.';
                    Editable = false;

                }
                field("Grade"; currBookGrade)
                {
                    ApplicationArea = All;
                    Caption = 'Previous Grade';
                    ToolTip = 'Specifies the value of the Grade field.';
                    Editable = false;

                }
                field("Grade Description"; currBookGradeDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Previous Grade description';

                    ToolTip = 'Specifies the value of the Grade Description field.';
                    Editable = false;
                    
                }
            }
            group("New Grading")
            {
                Caption = 'New Grading';
                field("New Grade"; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                    ShowMandatory = true;
                }
                field("New Grade Description"; Rec."Grade Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Description field.';
                    ShowMandatory = true;

                }
                
            }
        }
    }
    trigger OnOpenPage();
    begin
        currBookGrade := Rec.Grade;
        currBookGradeDesc := Rec."Grade Description"; 
        
    end;

    var
        currBookGrade: Enum "Book Grade" ;
        currBookGradeDesc: Text[200];
    
   
}