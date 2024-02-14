permissionset 50100 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "Books Transactions"=RIMD,
        tabledata "Library Books"=RIMD,
        tabledata "Library General Setup"=RIMD,
        table "Books Transactions"=X,
        table "Library Books"=X,
        table "Library General Setup"=X,
        page "Add Sequel"=X,
        page "Book Details"=X,
        page "Book Transaction"=X,
        page Library=X,
        page "Library Customer"=X,
        page "Library General Setup"=X,
        page "List Book Transactions"=X,
        tabledata "Library Cues"=RIMD,
        tabledata "Monitor Books"=RIMD,
        table "Library Cues"=X,
        table "Monitor Books"=X,
        report "Book by Author Excel"=X,
        report "Book by Author RDLC"=X,
        report "Books By Author"=X,
        page "Book Grading"=X,
        page "Library Cues"=X,
        page "Monitor Books Dashboard"=X,
        page "Weeding Books"=X;
}