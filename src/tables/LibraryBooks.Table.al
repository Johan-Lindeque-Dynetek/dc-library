table 50100 "Library Books"
{
    Caption = 'Library Books';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"MyField"; Integer)
        {
            Caption = 'MyField';
            DataClassification = ToBeClassified;
        }
        
    }
    
    keys
    {
        key(PK; "MyField")
        {
            Clustered = true;
        }
    }
    
}