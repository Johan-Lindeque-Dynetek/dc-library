page 50100 "Library"
{
    Caption = 'Library';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Library Books";
    CardPageId = "Book Details";

    layout
    {
        area(Content)
        {
            group("the Books")
            {
                repeater("Books")
                {


                    field(Title; Rec.Title)
                    {
                        ToolTip = 'Specifies the value of the MyField field.';
                    }
                    field(Author; Rec.Author)
                    {
                        ToolTip = 'Specifies the value of the Author field.';
                    }
                    field("Rent Status"; Rec."Rent Status")
                    {
                        ToolTip = 'Specifies the value of the Rent Status field.';
                    }
                    field(Genre; Rec.Genre)
                    {
                        ToolTip = 'Specifies the value of the Genre field.';
                    }
                    field(Publisher; Rec.Publisher)
                    {
                        ToolTip = 'Specifies the value of the Publisher field.';
                    }
                    // field("Publication Date"; Rec."Publication Date")
                    // {
                    //     ToolTip = 'Specifies the value of the Publication Date field.';
                    // }
                    // field(Pages; Rec.Pages)
                    // {
                    //     ToolTip = 'Specifies the value of the Pages field.';
                    // }
                    field(Series; Rec.Series)
                    {
                        ToolTip = 'Specifies the value of the Series field.';
                    }

                }

            }
        }
    }

    actions
    {

        area(Processing)
        {

            // This action displays the top 3 rented books.
            action("Top 3")
            {
                ApplicationArea = All;
                Caption = 'Top 3 books rented.';
                ToolTip = 'Shows the Top 3 books rented.';
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Books: Record "Library Books";
                    Top3Rented: Array[3] of Record "Library Books";
                    Count: Integer;
                    MessageText: Text;
                begin
                    MessageText := 'The top 3 most rented books are:' + '\';
                    Count := 1;

                    Books.SetCurrentKey("Rented Amount");
                    Books.Ascending(false);
                    // Store the top 3 books in the array
                    if Books.FindSet() then
                        repeat
                            Top3Rented[Count] := Books;
                            Count += 1;
                            if Count > 3 then
                                break;
                        until Books.Next() = 0;

                    // Show top 3 books in popup
                    Count := 0;
                    for Count := 1 to 3 do 
                        MessageText += 'Title: ' + Top3Rented[Count].Title + ' , Amount: ' + Format(Top3Rented[Count]."Rented Amount") + '\';

                    Message(MessageText);
                end;
            }

            // This action filters all the books and show only books publisheds in the last 2 years.
            action("Recently Published")
            {
                ApplicationArea = All;
                Caption = 'Recent books.';
                ToolTip = 'Filter to show the books bublished in the last 2 years.';
                Image = DueDate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Date2YearsBack: Date;
                    CurrentWorkDate: Date;
                begin
                    CurrentWorkDate := Today();
                    Date2YearsBack := CurrentWorkDate - 730;
                    Rec.SetRange("Publication Date", Date2YearsBack, CurrentWorkDate);
                end;
            }

            // This action is for creating a return/rent action for a book.
            action("Rent/Return")
            {
                ApplicationArea = All;
                Caption = 'Rent or Return a book';
                ToolTip = 'Action for renting or reurning the selected book.';
                Image = BOMRegisters;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    BooksTransactionsTable: Record "Books Transactions";
                begin
                    BooksTransactionsTable.NewBookTransaction(Rec);
                end;
            }
        }

    }
}