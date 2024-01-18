tableextension 50150 LibraryBooks extends "Library Books"
{
    fields
    {
        field(50150; "Return Date"; Date)
        {
            Caption = 'Return Date"';
            DataClassification = CustomerContent;
        }
        field(50160; "Grade"; Text[1])
        {
            Caption = 'Grade';
            DataClassification = CustomerContent;
        }
        field(50170; "Grade Description"; Text[200])
        {
            Caption = 'Grade Description';
            DataClassification = CustomerContent;
        }
        field(50180; "Weeded"; Boolean)
        {
            Caption = 'Weeded';
            DataClassification = CustomerContent;
        }
        
        
    }
    
}