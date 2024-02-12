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
        field(2; "Author"; Text[50])
        {
            Caption = 'MyField';
            DataClassification = CustomerContent;
            Editable = true;
            TableRelation = "Library Books".Author;
            trigger OnValidate();
            begin
                "Author Filter" := Rec."Author"
            end;

        }
        field(3; "Genre"; Enum "Book Genre")
        {
            Caption = 'MyField';
            DataClassification = CustomerContent;
            Editable = true;
            trigger OnValidate();
            begin
                "Genre Filter" := Rec.Genre;
            end;

        }
        field(4; "Date by"; date)
        {
            Caption = 'MyField';
            Editable = true;
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                "Date Filter" := Rec."Date by";
            end;
        }

        // flow filters
        field(5; "Author Filter"; Text[50])
        {
            FieldClass = FlowFilter;
        }
        field(6; "Genre Filter"; enum "Book Genre")
        {
            FieldClass = FlowFilter;
        }
        field(7; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }

        // flow fields
        field(50210; "Total unique books"; Integer)
        {
            Caption = 'Total unique books';
            FieldClass = FlowField;
            CalcFormula = Count("Library Books"
                        where(Author = field("Author Filter"), 
                            Genre = field(Genre), 
                            "Date added" = field("Date Filter")
                            ));
        }
        field(50211; "Total new books"; integer)
        {
            Caption = 'Total new books';

            FieldClass = FlowField;
            CalcFormula = Count("Library Books"
                            where(Grade = const(A),
                            Author = field("Author Filter"), 
                            Genre = field(Genre), 
                            "Date added" = field("Date Filter")
                                ));
        }
        field(50212; "Total damaged books"; integer)
        {
            Caption = 'Total damaged books';
            FieldClass = FlowField;
            CalcFormula = Count("Library Books"
                            where(Grade = const(D),
                            Author = field("Author Filter"), 
                            Genre = field(Genre), 
                            "Date added" = field("Date Filter")
                                ));
        }
        field(50213; "Total rented books"; integer)
        {
            Caption = 'Total rented books';
            FieldClass = FlowField;
            CalcFormula = Count("Library Books"
                            where("Rent Status" = const('Rented'),
                            Author = field("Author Filter"), 
                            Genre = field(Genre), 
                            "Date added" = field("Date Filter")
                                ));
        }
        field(50214; "Total available books"; integer)
        {
            Caption = 'Total available books';
            FieldClass = FlowField;
            CalcFormula = Count("Library Books"
                            where("Rent Status" = const('Available'),
                            Author = field("Author Filter"), 
                            Genre = field(Genre), 
                            "Date added" = field("Date Filter")
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


    // procedure GetListOfAuthors()
    // begin

    // end;

}