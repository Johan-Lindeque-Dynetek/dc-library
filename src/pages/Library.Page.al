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
            group(GroupName)
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
                    field("Publication Date"; Rec."Publication Date")
                    {
                        ToolTip = 'Specifies the value of the Publication Date field.';
                    }
                    field(Pages; Rec.Pages)
                    {
                        ToolTip = 'Specifies the value of the Pages field.';
                    }
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
            action(Top3rented)
            {
                ApplicationArea = All;
                Caption = 'Top 3 books rented.';
                ToolTip = 'Shows the Top 3 books rented.';
                Image = GeneralLedger;
                // PromotedCategory = Category4;
                // Promoted = true;
                // PromotedIsBig = true;

                trigger OnAction()
                var
                    Books: Record "Library Books";
                    Top3Rented: Array[3] of Record "Library Books";
                    Count: Integer;

                    MessageText: Text;

                begin
                    MessageText := 'The top 3 most rented books are:' + '\';
                    Count := 1;

                    Books.SetRange("Rented Amount");
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
                    for Count := 1 to 3 do begin
                        MessageText += 'Title' + Top3Rented[Count].Title + ' , Amount: ' + Format(Top3Rented[Count]."Rented Amount") + '\';

                    end;
                    Message(MessageText);
                end;
            }

            // This action filters all the books and show only books publisheds in the last 2 years.
            action(FilterRecentBooks)
            {
                ApplicationArea = All;
                Caption = 'Recent books.';
                ToolTip = 'Shows the books from the last 2 years.';
                Image = GeneralLedger;

                trigger OnAction()
                var
                    // Books: Record "Library Books";
                    Date2YearsBack: Date;
                    CurrentWorkDate: Date;
                begin
                    CurrentWorkDate := WorkDate();
                    Date2YearsBack := CurrentWorkDate - 730;

                    Rec.SetRange("Publication Date", Date2YearsBack, CurrentWorkDate);

                    // books.SetRange("Publication Date", Date2YearsBack, CurrentWorkDate);
                    // CurrPage.SetRecord(Books);
                    // CurrPage.Update(false);

                end;
            }
        }

    }
}