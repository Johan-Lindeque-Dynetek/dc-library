table 50103 "Authors"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Author ID"; code[20])
        {
            Caption = 'Author OL ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Author OL ID"; Text[15])
        {
            Caption = 'Author OL ID';
            DataClassification = ToBeClassified;
        }
        field(3; "Birth Date"; Text[30])
        {
            Caption = 'Birth Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Bio"; Text[200])
        {
            Caption = 'Bio';
            DataClassification = ToBeClassified;
        }
        field(5; "Author name"; Text[50])
        {
            Caption = 'Author name';
            DataClassification = ToBeClassified;
        }
        field(6; "Personal name"; Text[50])
        {
            Caption = 'Personal name';
            DataClassification = ToBeClassified;
        }
        field(7; "Work Count"; Integer)
        {
            Caption = 'Work Count';
            DataClassification = ToBeClassified;
        }
        field(8; "Top Work"; Text[100])
        {
            Caption = 'Top Work';
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }



    }

    keys
    {
        key(PK; "Author ID", "Author name")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if Rec."Author ID" = '' then
            Rec.AddNewNos();

    end;

    procedure AddNewNos()
    var
        LibraryGeneralSetup: Record "Library General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin

        LibraryGeneralSetup.GetRecordOnce();
        LibraryGeneralSetup.TestField("Authors Nos.");
        Rec."Author ID" := NoSeriesMgt.GetNextNo(LibraryGeneralSetup."Authors Nos.", WorkDate(), true);
    end;
}