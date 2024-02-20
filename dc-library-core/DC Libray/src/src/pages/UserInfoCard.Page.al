page 50107 "User information Card"
{
    Caption = 'User information Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(UserID; UserID)
                {
                    ApplicationArea = All;

                }
                field(UserName; UserName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UserEmail; UserEmail)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UserPhone; UserPhone)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UserCompanyName; UserCompanyName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetUser)
            {
                ApplicationArea = All;
                Caption = 'Get User from API';
                Image = GetBinContent;

                trigger OnAction()
                begin
                    GetUserInfo();
                end;
            }
        }
    }

    var
        UserID: Integer;
        UserName: Text;
        UserEmail: Text;
        UserPhone: Text;
        UserCompanyName: Text;

    procedure GetUserInfo()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        Token: JsonToken;
        Object: JsonObject;
        JsonText: Text;
        Url: Text;
    begin
        Url := 'https://jsonplaceholder.typicode.com/users/' + Format(UserID);
        if not Client.Get(Url, ResponseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode then
            Error('The web service returned an error message:\\' +
                'Status code: %1\' +
                'Description: %2',
                ResponseMessage.HttpStatusCode,
                ResponseMessage.ReasonPhrase);
        ResponseMessage.Content.ReadAs(JsonText);

        if not Object.ReadFrom(JsonText) then
            Error('Invalid response, expected a JSON object');
        Object.Get('name', Token);
        UserName := Token.AsValue().AsText();
        Object.Get('phone', Token);
        UserPhone := Token.AsValue().AsText();
        Object.Get('email', Token);
        UserEmail := Token.AsValue().AsText();
        Object.Get('company', Token);
        Token.AsObject().Get('name', Token);
        UserCompanyName := Token.AsValue().AsText();



    end;
}