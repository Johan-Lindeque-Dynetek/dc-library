report 50152 "Book by Author Excel"
{
    Caption = 'Book by Author (Excel)';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout= Excel;
    ExcelLayout = 'BooksByAuthorEXCEL.xlsx';


    dataset
    {
        dataitem(LibraryBooksDataItem; "Library Books")
        {
            DataItemTableView = sorting(Author);

            column(LibraryBooksAuthor; "Author")
            {
                IncludeCaption = true;
                
            }
            column(Title_LibraryBooksDataItem; Title)
            {
                IncludeCaption = true;
            }
            column(Grade_LibraryBooksDataItem; Grade)
            {
                IncludeCaption = true;
            }


        }

    }

    
}