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
        page "List Book Transactions"=X;
}