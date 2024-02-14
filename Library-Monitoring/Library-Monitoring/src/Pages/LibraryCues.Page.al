page 50201 "Library Cues"
{
    Caption = 'Library';
    PageType = CardPart;
    SourceTable = "Library Cues";
    RefreshOnActivate = true;
    
    layout
    {
        area(Content)
        {
            cuegroup("Monitor")
            {
                field("Books this month"; Rec."Books this month")
                {
                    ApplicationArea = All;
                    DrillDownPageId = Library;
                }
                
            }
        }
    }
    
    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;
                
    //             trigger OnAction()
    //             begin
                    
    //             end;
    //         }
    //     }
    // }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExist();
        Rec."Month filter" := Today - 30;
        // Rec.SETRANGE("Month filter", Rec."Month filter", Today);

    end;
}