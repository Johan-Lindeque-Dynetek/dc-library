table 50102 "Library General Setup"
{
    Caption = 'General Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';

        }
        field(2; "Library Books Nos."; Code[20])
        {
            Caption = 'Library Books Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Book Transaction Nos."; Code[20])
        {
            Caption = 'Book Transaction Nos.';
            TableRelation = "No. Series";
        }
        field(4; "Max Rent Period"; Code[20])
        {
            Caption = 'Max Rent Period for books';
            
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