page 50250 "Search Open Library"
{
    Caption = 'Search Open Library';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Library Books";
    SourceTableTemporary = true;
    
    layout
    {
        area(Content)
        {
            group(Search)
            {
                // field("Author OL ID"; Rec."Author OL ID")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Author OL ID field.';
                // }
                field("Search ISBN"; SearchISBN)
                {
                    ApplicationArea = All;
                    Caption = 'Search ISBN';
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field("Search Title"; SearchTitle)
                {
                    ApplicationArea = All;
                    Caption = 'Search Title';
                    ToolTip = 'Specifies the value of the ISBN field.';
                }

            }
        
            group(Books)
            {
                repeater("Books Found")
                {

                    field("OL ID"; Rec."OL ID")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Open Library ID field.';
                    }
                    field(Author; Rec.Author)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Author field.';
                    }
                    field("Author OL ID"; Rec."Author OL ID")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Author OL ID field.';
                    }
                    field(Title; Rec.Title)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the MyField field.';
                    }
                    field(ISBN; Rec.ISBN)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the ISBN field.';
                    }
                    field(Pages; Rec.Pages)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Pages field.';
                    }
                    field("Publication Date"; Rec."Publication Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Publication Date field.';
                    }
                    field(Publisher; Rec.Publisher)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Publisher field.';
                    }
                    // field(Description; Rec.Description)
                    // {
                    //     ApplicationArea = All;
                    //     ToolTip = 'Specifies the value of the Description field.';
                    // }
                }
                
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(SearchISBN)
            {
                ApplicationArea = All;
                Caption = 'Search ISBN';
                Image = Find;
                
                trigger OnAction()
                var
                    OpenLibraryAPI: Codeunit "Open Library API";
                begin
                    OpenLibraryAPI.SearchISBN(Rec,SearchISBN);

                    
                end;
            }
            action(SearchTitle)
            {
                ApplicationArea = All;
                Caption = 'Search Title';
                Image = Find;
                
                trigger OnAction()
                var
                    OpenLibraryAPI: Codeunit "Open Library API";
                begin
                    OpenLibraryAPI.SearchTitle(Rec,SearchTitle);

                    
                end;
            }
            action(AddBook)
            {
                ApplicationArea = All;
                Caption = 'Add books to library';
                Image = Add;
                
                trigger OnAction()
                var
                    OpenLibraryAPI: Codeunit "Open Library API";
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    OpenLibraryAPI.AddSelectedToLibrary(Rec);

                    
                end;
            }
        }
    }
    var
        SearchISBN: Text[13];
        SearchTitle: Text[100];
}