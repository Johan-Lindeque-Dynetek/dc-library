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

            // Show count for grades of each author
            column(Grade_A_count; CountGradeA)
            {

            }
            column(Grade_B_count; CountGradeB)
            {

            }
            column(Grade_C_count; CountGradeC)
            {

            }
            column(Grade_D_count; CountGradeD)
            {

            }


            trigger OnPreDataItem();
            begin


            end;

            trigger OnAfterGetRecord()
            var
                LibraryBooks: Record "Library Books";
            begin
                LibraryBooks.SetCurrentKey("Author");
                LibraryBooks.Ascending := true;

                // New author reset counters.
                if LibraryBooksDataItem.Author <> TheCurrAuth then begin
                    TheCurrAuth := LibraryBooksDataItem.Author;
                    CountGradeA := 0;
                    CountGradeB := 0;
                    CountGradeC := 0;
                    CountGradeD := 0;
                end;

                case Grade of
                    Enum::"Book Grade"::A:
                        CountGradeA += 1;
                    Enum::"Book Grade"::B:
                        CountGradeB += 1;
                    Enum::"Book Grade"::C:
                        CountGradeC += 1;
                    Enum::"Book Grade"::D:
                        CountGradeD += 1;
                end;


            end;
        }

    }
    // rendering
    // {
    //     layout
    //     {
    //         Type = Excel
    //     }
    // }
    var
       
        TheCurrAuth: Text[50];
        CountGradeA: Integer;
        CountGradeB: Integer;
        CountGradeC: Integer;
        CountGradeD: Integer;
}