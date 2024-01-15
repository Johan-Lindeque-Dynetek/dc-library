page 50106 "List Book Transactions"
{
    Caption = 'List of Book Transactions';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Books Transactions";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                repeater("List Transactions")
                {

                    field(TransactionID; Rec.TransactionID)
                    {
                        ToolTip = 'Specifies the value of the TransactionID field.';
                    }
                    field("Transactions Date"; Rec."Transactions Date")
                    {
                        ToolTip = 'Specifies the value of the Transactions Date field.';
                    }
                    field("Transactions Type"; Rec."Transactions Type")
                    {
                        ToolTip = 'Specifies the value of the Transactions Type field.';
                    }
                    field(BookID; Rec.BookID)
                    {
                        ToolTip = 'Specifies the value of the BookID field.';
                    }
                    field(Title; Rec.Title)
                    {
                        ToolTip = 'Specifies the value of the Title field.';
                    }
                    field(Author; Rec.Author)
                    {
                        ToolTip = 'Specifies the value of the Author field.';
                    }
                    field("Customer No."; Rec."Customer No.")
                    {
                        ToolTip = 'Specifies the value of the Customer No. field.';
                    }
                    field("Customer Name"; Rec."Customer Name")
                    {
                        ToolTip = 'Specifies the value of the Customer Name field.';
                    }
                }

            }
        }
    }


}