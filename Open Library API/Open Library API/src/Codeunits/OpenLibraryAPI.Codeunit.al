codeunit 50250 "Open Library API"
{
    // procedure SearchByISBN(var TmpLibraryBooks: Record "Library Books"; SearchISBN: Text[13])
    // var
    //     AATAPI: Record "AAT API";
    //     AATRestHelper: Codeunit "AAT REST Helper";
    //     // LibraryGeneralAPISetup: Record "Library General API Setup";
    //     AATJSONHelper: Codeunit "AAT JSON Helper";
    //     SearchOpenLibrary: Page "Search Open Library";

    //     Client: HttpClient;
    //     ResponseMessage: HttpResponseMessage;
    //     Token: JsonToken;
    //     RetrieveToken: JsonToken;
    //     ArrayToken: JsonToken;
    //     Object: JsonObject;
    //     JsonText: Text;
    //     Url: Text;
    // // TempLibraryBooks: Record "Library Books" temporary;

    // begin
    //     AATAPI.SetFilter(Description, 'Open Library');
    //     if not AATAPI.FindFirst() then
    //         exit;

    //     Url := AATAPI."Dev. Base Endpoint" + '/search.json?isbn=' + SearchISBN;

    //     if not Client.Get(Url, ResponseMessage) then
    //         Error('The call to the web service failed.');
    //     if not ResponseMessage.IsSuccessStatusCode then
    //         Error('The web service returned an error message:\\' +
    //             'Status code: %1\' +
    //             'Description: %2',
    //             ResponseMessage.HttpStatusCode,
    //             ResponseMessage.ReasonPhrase);
    //     ResponseMessage.Content.ReadAs(JsonText);

    //     if not Object.ReadFrom(JsonText) then
    //         Error('Invalid response, expected a JSON object');

    //     if not Object.Get('docs', Token) then
    //         Error('No docs array found in the JSON object');

    //     if not Token.AsArray().Get(0, Token) then
    //         Error('No first object found in the docs array');

    //     Token.AsObject().Get('title', RetrieveToken);
    //     TmpLibraryBooks.Title := RetrieveToken.AsValue().AsText();

    // if not Object.Get('publish_date', ArrayToken) then
    //     Error('No publish_date array found in the first object of the docs array');
    // if ArrayToken.AsArray().Count() < 2 then
    //     Error('Less than two publish_date values found');
    //     // TmpLibraryBooks."Publication Date" := ArrayToken.AsArray().Get().AsValue().AsText();

    //     Token.AsObject().Get('number_of_pages_median', RetrieveToken);
    //     TmpLibraryBooks.Pages := RetrieveToken.AsValue().AsInteger();

    //     TmpLibraryBooks.ISBN := SearchISBN;

    // end;


    procedure SearchISBN(var TmpLibraryBooks: Record "Library Books"; SearchISBN: Text[13])
    var
        LibraryGeneralAPISetup: Record "Library General API Setup";
        AATRESTHelper: Codeunit "AAT REST Helper";

        FailedRequesrErr: Label 'Failed to send Request. Check URL and try again.';

    begin
        //  Initialize  request.
        LibraryGeneralAPISetup.GetRecordOnce();
        LibraryGeneralAPISetup.TestField("OL API Nos.");
        AATRESTHelper.LoadAPIConfig('API-0001');
        AATRESTHelper.Initialize('GET', AATRESTHelper.GetAPIConfigBaseEndpoint() + '/search.json?isbn=' + SearchISBN);
        AATRESTHelper.AddBasicAuthHeader();

        if not AATRESTHelper.Send() then begin
            if AATRESTHelper.IsTransmitIssue() then
                Error(FailedRequesrErr);
            DisplayAPIFailureMessage(AATRESTHelper);
        end;

        DisplayAPISuccessMessage(AATRESTHelper);
        //  Initialize the JSON object from the response content.
        CreateTempBook(TmpLibraryBooks, AATRESTHelper);

    end;

    procedure SearchTitle(var TmpLibraryBooks: Record "Library Books"; SearchTitle: Text[100])
    var
        LibraryGeneralAPISetup: Record "Library General API Setup";
        AATRESTHelper: Codeunit "AAT REST Helper";

        FailedRequesrErr: Label 'Failed to send Request. Check URL and try again.';

    begin
        //  Initialize  request.
        LibraryGeneralAPISetup.GetRecordOnce();
        LibraryGeneralAPISetup.TestField("OL API Nos.");
        AATRESTHelper.LoadAPIConfig('API-0001');
        AATRESTHelper.Initialize('GET', AATRESTHelper.GetAPIConfigBaseEndpoint() + '/search.json?q=' + SearchTitle + '&page=1');
        AATRESTHelper.AddBasicAuthHeader();

        if not AATRESTHelper.Send() then begin
            if AATRESTHelper.IsTransmitIssue() then
                Error(FailedRequesrErr);
            DisplayAPIFailureMessage(AATRESTHelper);
        end;

        DisplayAPISuccessMessage(AATRESTHelper);
        //  Initialize the JSON object from the response content.
        CreateTempBook(TmpLibraryBooks, AATRESTHelper);

    end;



    local procedure DisplayAPIFailureMessage(var AATRestHelper: Codeunit "AAT REST Helper")
    var
        ErrorBreakDownLbl: Label 'ERROR       Code: %1\Message: %2\Reason: %3', Comment = '%1=Error Code, %2 = Err Message %3 = Err. Reason';
    begin
        message(
         StrSubstNo(
         ErrorBreakDownLbl,
         AATRestHelper.GetHttpStatusCode(),
         AATRestHelper.GetResponseContentAsText(),
         AATRestHelper.GetResponseReasonPhrase()
         )
        );
    end;


    local procedure DisplayAPISuccessMessage(var AATRestHelper: Codeunit "AAT REST Helper")
    var
        ErrorBreakDownLbl: Label 'SUCCESS       Code: %1\Message: %2\Reason: %3', Comment = '%1=Error Code, %2 = Err Message %3 = Err. Reason';
    begin
        message(
         StrSubstNo(
         ErrorBreakDownLbl,
         AATRestHelper.GetHttpStatusCode(),
         AATRestHelper.GetResponseContentAsText(),
         AATRestHelper.GetResponseReasonPhrase()
         )
        );
    end;

    local procedure CreateTempBook(var TmpLibraryBooks: Record "Library Books"; var AATRESTHelper: Codeunit "AAT REST Helper")
    var
        AATJSONHelper: Codeunit "AAT JSON Helper";
        ResultObject: JsonObject;
        BookObject: JsonObject;
        Token: JsonToken;
        RetrieveToken: JsonToken;
        PublisherArray: JsonArray;
        PublishDateArray: JsonArray;
        AuthorArray: JsonArray;
        DocsArray: JsonArray;
        ISBNArray: JsonArray;

        JsonText: Text;
        PublishDate: Date;
        PublishDateText: Text;
        OpenLibID: Text[20];
        i: Integer;
    begin
        AATJSONHelper.InitializeJsonObjectFromText(AATRESTHelper.GetResponseContentAsText());
        ResultObject := AATJSONHelper.GetJsonObject();
        JsonText := AATRestHelper.GetResponseContentAsText();

        if not ResultObject.ReadFrom(JsonText) then
            Error('Invalid response, expected a JSON object');

        if not ResultObject.Get('docs', Token) then
            Error('No docs array found in the JSON object');
        if Token.IsArray() then
            DocsArray := Token.AsArray()
        else
            Error('Expected an array for docs, but found a different type');
        TmpLibraryBooks.Init();
        for i := 0 to DocsArray.Count - 1 do begin
            DocsArray.Get(i, RetrieveToken);
            BookObject := RetrieveToken.AsObject();



            TmpLibraryBooks.AddNewNos();
            // Get book OL id.
            if BookObject.Get('key', RetrieveToken) then begin
                OpenLibID := CopyStr(RetrieveToken.AsValue().AsText(), StrPos(RetrieveToken.AsValue().AsText(), '/works') + 7);
                TmpLibraryBooks."OL ID" := OpenLibID;
            end;
            // Get book title.
            if BookObject.Get('title', RetrieveToken) then
                TmpLibraryBooks.Title := RetrieveToken.AsValue().AsText();
            // Get book author & author OL id.
            if BookObject.Get('author_name', RetrieveToken) then begin
                AuthorArray := RetrieveToken.AsArray();
                if AuthorArray.Get(0, RetrieveToken) then
                    TmpLibraryBooks.Author := RetrieveToken.AsValue().AsText();
            end;
            if BookObject.Get('author_key', RetrieveToken) then begin
                AuthorArray := RetrieveToken.AsArray();
                if AuthorArray.Get(0, RetrieveToken) then
                    TmpLibraryBooks."Author OL ID" := RetrieveToken.AsValue().AsText();
            end;
            // Set rent status.
            TmpLibraryBooks."Rent Status" := 'Available';
            // Get number of pages in book.
            if BookObject.Get('number_of_pages_median', RetrieveToken) then
                TmpLibraryBooks.Pages := RetrieveToken.AsValue().AsInteger();
            // Set ISBN number of book.
            if BookObject.Get('isbn', RetrieveToken) then begin
                ISBNArray := RetrieveToken.AsArray();
                if ISBNArray.Get(0, RetrieveToken) then
                    TmpLibraryBooks.ISBN := RetrieveToken.AsValue().AsText();
            end;
            // Get the 'publisher' array from the first object in the 'docs' array.
            if BookObject.Get('publisher', RetrieveToken) then begin
                PublisherArray := RetrieveToken.AsArray();
                // Get the first publisher
                if PublisherArray.Get(0, RetrieveToken) then
                    TmpLibraryBooks.Publisher := RetrieveToken.AsValue().AsText();
            end;
            // Get the 'publish_date' array from the first object in the 'docs' array.
            if BookObject.Get('publish_date', RetrieveToken) then begin
                PublishDateArray := RetrieveToken.AsArray();
                // Get the first publish date
                if PublishDateArray.Get(1, RetrieveToken) then
                    PublishDateText := RetrieveToken.AsValue().AsText();
                if Evaluate(PublishDate, PublishDateText) then
                    TmpLibraryBooks."Publication Date" := PublishDate;
            end;

            TmpLibraryBooks.Insert();
        end;
    end;

    procedure AddSelectedToLibrary(TempLibraryBooks: Record "Library Books" temporary)
    var
        LibraryBooks: Record "Library Books";
    begin


        repeat
            LibraryBooks.SetFilter("OL ID", TempLibraryBooks."OL ID");
            if not LibraryBooks.FindSet() then begin

            end;


        until TempLibraryBooks.Next() = 0;

    end;

}