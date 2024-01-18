page 50101 "Book Details"
{
    Caption = 'Book Details';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Library Books";

    layout
    {
        area(Content)
        {
            group("Book Details")
            {
                Caption = 'Book details:';

                field(BookID; Rec.BookID)
                {
                    ApplicationArea = All;
                    Caption = 'Book ID.';
                    ToolTip = 'Specifies the value of the BookID field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    Caption = 'Title.';
                    ToolTip = 'Specifies the value of the MyField field.';

                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    Caption = 'Author.';
                    ToolTip = 'Specifies the value of the Author field.';
                }

                field(Genre; Rec.Genre)
                {
                    ApplicationArea = All;
                    Caption = 'Genre.';
                    ToolTip = 'Specifies the value of the Genre field.';
                }
                field(Publisher; Rec.Publisher)
                {
                    ApplicationArea = All;
                    Caption = 'Publisher.';
                    ToolTip = 'Specifies the value of the Publisher field.';
                }
                field("Publication Date"; Rec."Publication Date")
                {
                    ApplicationArea = All;
                    Caption = 'Publication date.';
                    ToolTip = 'Specifies the value of the Publication Date field.';
                }

                field(Pages; Rec.Pages)
                {
                    ApplicationArea = All;
                    Caption = 'Number of pages.';
                    ToolTip = 'Specifies the value of the Pages field.';
                }
                field("Rent Status"; Rec."Rent Status")
                {
                    ApplicationArea = All;
                    Caption = 'Rent Status.';
                    ToolTip = 'Specifies the value of the Rent Status field.';
                }
                field("Rented Amount"; Rec."Rented Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Amount times rented.';
                    ToolTip = 'Specifies the value of the Rented Amount field.';
                }

                field("Book Price"; Rec."Book Price")
                {
                    ApplicationArea = All;
                    Caption = 'Book Purchase Price.';
                    ToolTip = 'Specifies the value of the Book Price field.';
                }


            }
            group("Series info")
            {
                Caption = 'Information of book series:';

                field(Series; Rec.Series)
                {
                    ApplicationArea = All;
                    Caption = 'Series apart of.';
                    ToolTip = 'Specifies the value of the Series field.';
                }

                field(Prequel; Rec.Prequel)
                {
                    ApplicationArea = All;
                    Caption = 'Prequel to Book.';
                    ToolTip = 'Specifies the value of the Prequel field.';
                }

                field(Sequel; Rec.Sequel)
                {
                    ApplicationArea = All;
                    Caption = 'Sequel to Book.';
                    ToolTip = 'Specifies the value of the Sequel field.';
                }
            }
        }
    }



    actions
    {
        area(Processing)
        {
            // This action is for creating a return/rent action for a book.
            action("Rent/Return")
            {
                ApplicationArea = All;
                Caption = 'Rent or Return a book';
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

            // This action is for creating a sequel too a book.
            action("Add Sequel")
            {
                ApplicationArea = All;
                Caption = 'Add a sequel to the selected book';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                
                trigger OnAction()
                var
                    LibraryBooks: Record "Library Books";
                begin
                    LibraryBooks.AddSequelBook(Rec);
                    
                end;
            }
        }
    }
}