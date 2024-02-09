table 50200 "Monitor Books"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Integer)
        {
            Caption = 'MyField';
            DataClassification = CustomerContent;
            Editable = true;

        }
        field(2; "Autor"; Text[50])
        {
            Caption = 'MyField';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(3; "Genre"; Enum "Book Genre")
        {
            Caption = 'MyField';
            DataClassification = CustomerContent;
            Editable = true;

        }
        field(4; "Date by"; date)
        {
            Caption = 'MyField';
            Editable = true;

            DataClassification = CustomerContent;
        }

        // flow filters
        field(5; "Author Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(6; "Genre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(7; "Date Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }

        // flow fields
        field(50210; "Total unique books"; Integer)
        {
            Caption = 'Total unique books';
            FieldClass = FlowField;
            CalcFormula = Count( "Library Books");
        }
        field(50211; "Total new books"; integer)
        {
            Caption = 'Total new books';
         
            FieldClass = FlowField;
            CalcFormula = Count( "Library Books"
                            where (Grade = const(A),
                            Author = field(Autor)
                                ));
        }
        field(50212; "Total damaged books"; integer)
        {
            Caption = 'Total damaged books';
            FieldClass = FlowField;
            CalcFormula = Count( "Library Books"
                            where (Grade = const(D)
                                ));
        }
        field(50213; "Total rented books"; integer)
        {
            Caption = 'Total rented books';
            FieldClass = FlowField;
            CalcFormula = Count( "Library Books"
                            where ("Rent Status" = const('Rented')
                                ));
        }
        field(50214; "Total available books"; integer)
        {
            Caption = 'Total available books';
            FieldClass = FlowField;
            CalcFormula = Count( "Library Books"
                            where ("Rent Status" = const('Available')
                                ));
        }

    }

    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

}