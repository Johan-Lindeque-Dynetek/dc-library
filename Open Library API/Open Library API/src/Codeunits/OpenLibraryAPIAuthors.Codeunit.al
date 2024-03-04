codeunit 50251 "Open Library Authors API"
{
    Description = 'Get the Author from Open Library API and populate "Authors" table.';

    procedure CheckAuthorDetails(SearchAuthorID: Text)
    var
        Authors: Record Authors;
    begin
        Authors.SetCurrentKey("Author OL ID");
        Authors.SetFilter("Author OL ID", SearchAuthorID);
        if Authors.FindFirst() then
            exit
        else
            GetAuthorPayload(SearchAuthorID);


    end;

    //  Search for Author by Open Library ID and retrieve Author data.
    local procedure GetAuthorPayload(SearchAuthorID: Text)
    var
        LibraryGeneralAPISetup: Record "Library General API Setup";
        AATRESTHelper: Codeunit "AAT REST Helper";
        FailedRequesrErr: Label 'Failed to send Request. Check URL and try again.';
        Authors: Record Authors;

    begin
        Authors.SetFilter("Author OL ID", SearchAuthorID);
        if Authors.IsEmpty then begin
            //  Initialize  request.
            LibraryGeneralAPISetup.GetRecordOnce();
            LibraryGeneralAPISetup.TestField("OL API Nos.");
            AATRESTHelper.LoadAPIConfig('API-0001');
            // https://openlibrary.org/authors/OL7115219A.json
            AATRESTHelper.Initialize('GET', AATRESTHelper.GetAPIConfigBaseEndpoint() + '/authors/' + SearchAuthorID + '.json');
            AATRESTHelper.AddBasicAuthHeader();

            if not AATRESTHelper.Send() then begin
                if AATRESTHelper.IsTransmitIssue() then
                    Error(FailedRequesrErr);
                DisplayAPIFailureMessage(AATRESTHelper);
            end;

            // DisplayAPISuccessMessage(AATRESTHelper);

            //  Get reponse as text.
            DeconstructPayload(AATRESTHelper.GetResponseContentAsText());
        end

        else
            exit;

    end;

    local procedure DeconstructPayload(Payload: Text)
    var
        AATJSONHelper: Codeunit "AAT JSON Helper";
    begin
        AATJSONHelper.InitializeJsonObjectFromText(Payload);
        GetAuthorDetails(AATJSONHelper);


    end;

    //  Check if Author retrieved from Open Library API already exist or not in "Author" table.
    local procedure GetAuthorDetails(var AATJSONHelper: Codeunit "AAT JSON Helper")
    var
        Authors: Record Authors;
        AuthBio: Text[250];
    begin


        //  Save Author details retrieved from Open Library API in to "Author" table.
        Authors.Init();
        Authors.AddNewNos();
        Authors."Author OL ID" := (CopyStr(AATJSONHelper.SelectJsonValueAsText('$.key', false), StrPos(AATJSONHelper.SelectJsonValueAsText('$.key', false), '/authors/') + 9));
        // TmpLibraryBooks."Author OL ID" := CopyStr(RetrieveToken.AsValue().AsText(), 1, MaxStrLen(TmpLibraryBooks."Author OL ID"));

        Authors."Author name" := CopyStr(AATJSONHelper.SelectJsonValueAsText('$.name', false), 1, MaxStrLen(Authors."Author name"));
        Authors."Personal name" := CopyStr(AATJSONHelper.SelectJsonValueAsText('$.personal_name', false), 1, MaxStrLen(Authors."Personal name"));
        Authors.Bio := CopyStr(AATJSONHelper.SelectJsonValueAsText('$.bio', false), 1, MaxStrLen(Authors.Bio));
        Authors."Birth Date" := CopyStr(AATJSONHelper.SelectJsonValueAsText('$.birth_date', false), 1, MaxStrLen(Authors."Birth Date"));
        Authors.Insert();


    end;

    // Display a detailed message when request Failed.
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

    // Display a detailed message when request is a Success.
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




}