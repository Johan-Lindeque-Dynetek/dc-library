tableextension 50201 "Activities Cue Ext." extends "Activities Cue"
{
    fields
    {
        field(50200; "Books this month"; integer)
        {
            
            Caption = 'Books this month';
            FieldClass = FlowField;
            CalcFormula = count("Library Books" 
                        where("Publication Date" = filter('>=CM - 1M')));
        }
        field(50210; "Month filter"; Date)
        {
            Caption = 'Month filter';
            Editable = false;
            
        }
        
    }

    
}