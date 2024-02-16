table 50201 "Library Cues"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No"; Integer)
        {
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        
        field(2; "Books this month"; integer)
        {
            
            Caption = 'Books this month';
            FieldClass = FlowField;
            CalcFormula = count("Library Books" 
                        where("Publication Date" = field("Month filter")));
        }
        field(3; "Month filter"; Date)
        {
            Caption = 'Month filter';
            Editable = false;
            
        }
        
    }
    
    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExist()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        
    end;
    
}