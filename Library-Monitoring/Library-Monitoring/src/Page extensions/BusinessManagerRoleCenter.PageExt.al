pageextension 50201 "Bus. Manager Role Cen. Ext." extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part(Library; "Library Cues")
            {
                ApplicationArea = Suite;
                
            }
        }
        
    }
}