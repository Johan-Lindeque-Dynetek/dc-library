page 50200 "Monitor Books Dashboard"
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

            group(Filters)
            {
                Caption = 'Filters';
                field(Author; Rec."Author")
                {
                    ApplicationArea = All;
                    Caption = 'Filter by Author';
                    ToolTip = 'Specifies the value of the Author field.';
                    Editable = true;

                }
                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                    Caption = 'Filter by Genre';
                    ToolTip = 'Specifies the value of the Genre field.';
                    Editable = true;

                }
                field("Date added"; Rec."Date by")
                {
                    ApplicationArea = All;
                    Caption = 'Filter by Date added';
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
                    DrillDownPageId = Library;
                }
                field("Total damaged books"; Rec."Total damaged books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total damaged books field.';
                    DrillDownPageId = Library;
                }
                field("Total new books"; Rec."Total new books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total new books field.';
                    DrillDownPageId = Library;
                }
                field("Total rented books"; Rec."Total rented books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total rented books field.';
                    DrillDownPageId = Library;

                }
                field("Total unique books"; Rec."Total unique books")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total unique books field.';
                    DrillDownPageId = Library;
                }
            }

            
            

        }
        
    }
    
    actions
    {
        area(Promoted)
        {
            actionref("Clear Filters"; Clear)
            {

            }
        }
        area(Processing)
        {
            action(Clear)
            {
                ApplicationArea = All;
                Caption = 'Clear all the Filter inputs';
                ToolTip = 'Clear all the Filter inputs to default values';
                Image = ClearFilter;
                
                trigger OnAction()
                begin
                    Rec.Author := '';
                    Rec.Genre := Enum::"Book Genre"::" ";
                    Rec."Date by" := 0D;  
                end;
            }
        }
    }


}