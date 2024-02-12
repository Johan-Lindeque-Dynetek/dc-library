page 50200 "Library Dashboard"
{
    Caption = 'Library Dashboard';
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Monitor Books";

    layout
    {
        area(Content)
        {

            group(inligting)
            {

                field(Author; Rec."Author")
                {
                    ApplicationArea = All;
                    Caption = 'Author';
                    ToolTip = 'Specifies the value of the Author field.';
                    Editable = true;

                }
                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                    Caption = 'Genre';
                    ToolTip = 'Specifies the value of the Genre field.';
                    Editable = true;

                }
                field("Date added"; Rec."Date by")
                {
                    ApplicationArea = All;
                    Caption = 'Date added';
                    ToolTip = 'Specifies the value of the Date added field.';
                    Editable = true;

                }

            }
            group("Total of Books:")
            {

                field("Total available books"; Rec."Total available books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total available books field.';
                }
                field("Total damaged books"; Rec."Total damaged books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total damaged books field.';
                }
                field("Total new books"; Rec."Total new books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total new books field.';
                }
                field("Total rented books"; Rec."Total rented books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total rented books field.';

                }
                field("Total unique books"; Rec."Total unique books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total unique books field.';
                }
            }
        }
    }


}