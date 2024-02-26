table 50250 "Library General API Setup"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';

        }
        field(2; "OL API Nos."; Code[20])
        {
            Caption = 'Open LibraryAPI Nos.';
            TableRelation = "No. Series";
        }
        field(3; "OL Base URL"; Text[250])
        {
            Caption = 'Open Library Base URL';
            
        }
        
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

     var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;
    
    
}