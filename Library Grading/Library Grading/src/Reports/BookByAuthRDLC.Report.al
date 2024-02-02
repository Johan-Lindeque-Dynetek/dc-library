report 50151 "Book by Author RDLC"
{
    Caption = 'Books By Author (RDLC)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'BooksByAuthorRDLC.rdl';
    
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
    labels
    {
        TitleLabel = 'My Title';
    }
    var
        TitleLbl: Label 'Thre authors';
    

}