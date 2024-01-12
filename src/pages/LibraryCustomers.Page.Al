page 50103 "Library Customer"
{
    Caption = 'Library Customer';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                
               repeater("Library Customers")
               {
                     field("No."; Rec."No.")
                    {
                        ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                    }
                    field(Name; Rec.Name)
                    {
                        ToolTip = 'Specifies the customer''s name.';
                    }
                    field(Surname; Rec.Surname)
                    {
                        ToolTip = 'Specifies the value of the Surname field.';
                    }
                    field(Email; Rec.Email)
                    {
                        ToolTip = 'Specifies the value of the Email field.';
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ToolTip = 'Specifies the customer''s telephone number.';
                    }
                    field(Address; Rec.Address)
                    {
                        ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                    }   
                
               } 
               
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}