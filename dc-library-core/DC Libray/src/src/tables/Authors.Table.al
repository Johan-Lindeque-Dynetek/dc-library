table 50103 "Authors"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Author OL ID"; Integer)
        {
            Caption = 'Author OL ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Birth Date"; Text[30])
        {
            Caption = 'Birth Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Bio"; Text[200])
        {
            Caption = 'Bio';
            DataClassification = ToBeClassified;
        }
        field(4; "Author name"; Text[50])
        {
            Caption = 'Author name';
            DataClassification = ToBeClassified;
        }
        field(5; "Personal name"; Text[50])
        {
            Caption = 'Personal name';
            DataClassification = ToBeClassified;
        }
        field(6; "Work Count"; Integer)
        {
            Caption = 'Work Count';
            DataClassification = ToBeClassified;
        }
        field(7; "Top Work"; Text[100])
        {
            Caption = 'Top Work';
            DataClassification = ToBeClassified;
        }
        
        
        
    }
    
    keys
    {
        key(PK; "Author OL ID")
        {
            Clustered = true;
        }
    }
    
}