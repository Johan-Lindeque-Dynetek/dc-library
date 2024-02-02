report 50150 "Books By Author"
{
    Caption = 'Books By Author (WORD)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'BooksByAuthorWord.docx';


    dataset
    {
        dataitem(LibraryBooksDataItem; "Library Books")
        {
            DataItemTableView = sorting(Author);

            column(LibraryBooksAuthor; "Author")
            {

            }
            column(Title_LibraryBooksDataItem; Title)
            {
            }
            column(Grade_LibraryBooksDataItem; Grade)
            {
            }


            trigger OnPreDataItem();
            begin
                // LibraryBooksDataItem.SetCurrentKey(Author);
                // LibraryBooksDataItem.Ascending := true;

            end;

            trigger OnAfterGetRecord()
            var
                LibraryBooks: Record "Library Books";
            begin
                LibraryBooks.SetCurrentKey("Author");
                LibraryBooks.Ascending := true;


            end;
        }

    }
}