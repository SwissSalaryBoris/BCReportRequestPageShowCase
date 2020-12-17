codeunit 50100 Logger
{
    SingleInstance = true;

    var
        ErrorMessage: Record "Error Message" temporary;

    trigger OnRun()
    begin
        ShowLog();
    end;

    procedure LogTrigger(ReportInstanceGuid: Guid; TriggerToLog: Text);
    begin
        ErrorMessage.LogSimpleMessage(ErrorMessage."Message Type"::Information, StrSubstNo('%1;%2', Format(ReportInstanceGuid), TriggerToLog));
    end;

    procedure ShowLog()
    begin
        ErrorMessage.ShowErrorMessages(false);
    end;

    procedure InitializeLog()
    begin
        ErrorMessage.DeleteAll(false);
    end;
}
