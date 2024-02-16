pageextension 50200 "Library Ext." extends Library
{
    layout
    {
        // field("Date added"; Rec."Date added")
        // {
        //     ApplicationArea = All;
        // }

    }
    actions
    {
        addlast("Navigate Library")
        {
            actionref("Dashboard Page"; "DashboardPage")
            {

            }
        }

        addafter(BooksForRepair)
        {
            action(DashboardPage)
            {
                ApplicationArea = All;
                Caption = 'Dashboard Page';
                ToolTip = 'Opens the Library Dashboard page.';
                Image = Allocate;

                trigger OnAction()
                var
                    MonitorBooksDashboard: Page "Monitor Books Dashboard";
                begin
                    MonitorBooksDashboard.Run();

                end;
            }
        }
    }
}