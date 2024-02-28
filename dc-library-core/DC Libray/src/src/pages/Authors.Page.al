page 50107 "Authors"
{
    Caption = 'Authors list';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Authors;
     
    layout
    {
        area(Content)
        {
            group(Authors)
            {
                repeater("Authors List")
                {
                    field("Author ID"; Rec."Author ID")
                    {
                        ToolTip = 'Specifies the value of the Author OL ID field.';
                    }
                    
                    field("Author OL ID"; Rec."Author OL ID")
                    {
                        ToolTip = 'Specifies the value of the Author OL ID field.';
                    }
                    field("Author name"; Rec."Author name")
                    {
                        ToolTip = 'Specifies the value of the Author name field.';
                    }
                    field("Personal name"; Rec."Personal name")
                    {
                        ToolTip = 'Specifies the value of the Personal name field.';
                    }
                    field(Bio; Rec.Bio)
                    {
                        ToolTip = 'Specifies the value of the Bio field.';
                    }
                    field("Birth Date"; Rec."Birth Date")
                    {
                        ToolTip = 'Specifies the value of the Birth Date field.';
                    }
                    field("Top Work"; Rec."Top Work")
                    {
                        ToolTip = 'Specifies the value of the Top Work field.';
                    }
                    field("Work Count"; Rec."Work Count")
                    {
                        ToolTip = 'Specifies the value of the Work Count field.';
                    }
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
}