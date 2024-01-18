tableextension 50100 Customer extends Customer
{
    fields
    {
        field(50100; Surname;  Text[50])
        {
            Caption = 'Surname';
            DataClassification = CustomerContent;
        }
        field(50110; Email;  Text[50])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        // field(50120; "Phone No."; code[10])
        // {
        //     Caption = 'Phone No.';
        //     DataClassification = CustomerContent;
        // }
        // field(50130; Address; Blob)
        // {
        //     Caption = 'Address';
        //     DataClassification = ToBeClassified;
        // }
        
        
        

        
        
    }
    
}