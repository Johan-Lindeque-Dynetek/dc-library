pageextension 50200 "O365 Activities Ext." extends "O365 Activities"
{
    layout
    {
        addbefore("Ongoing Sales")
        {
            cuegroup(Library)
            {
                Caption = 'Library';
                CuegroupLayout = Wide;

                field("Books Added this month"; Rec."Books this month")
                {
                    ApplicationArea = All;
                    Caption = 'Books Added this month';
                    DrillDownPageId = Library;
                    ToolTip = 'Specifies amount of new books added to library this past month up to today.';

                }
                
                
            }
        }

    }
    // trigger OnOpenPage();
    // var
    //     ActivitiesCue: Record "Activities Cue";
    //     FilterDate: Date;
    // begin
    //     // filterdate := CalcDate();
    //     // ActivitiesCue."Month filter" := ;
        
    // end;
}