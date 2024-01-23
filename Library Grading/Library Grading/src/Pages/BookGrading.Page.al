page 50151 "Book Grading"
{
    Caption = 'Book Grading';
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Library Books";

    layout
    {
        area(Content)
        {
            group("Grade book")
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
                field("Rent Status"; Rec."Rent Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rent Status field.';
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


                group("New Grading")
                {
                    Caption = 'New Grading';
                    field("New Grade"; Rec.Grade)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Grade field.';
                        Editable = true;
                    }
                    field("New Grade Description"; Rec."Grade Description")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Grade Description field.';
                        Editable = true;


                    }

                }
            }

        }
    }
    trigger OnOpenPage();
    begin
        currBookGrade := Rec.Grade;
        currBookGradeDesc := Rec."Grade Description";

    end;

    trigger OnClosePage();
    begin
        Rec.WeedingOutBooks();
        
    end;

    var
        currBookGrade: Enum "Book Grade";
        currBookGradeDesc: Text[200];


}