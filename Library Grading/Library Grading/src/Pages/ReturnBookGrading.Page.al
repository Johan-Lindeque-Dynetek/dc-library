page 50150 "Return Book Grading"
{
    Caption = 'Book grade on return.';
    PageType = ConfirmationDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Books Transactions";
    
    layout
    {
        area(Content)
        {
             
                
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