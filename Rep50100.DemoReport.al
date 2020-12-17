report 50100 "Demo Report"
{
    RDLCLayout = '.\DemoReport.rdl';

    dataset
    {
        dataitem(IntegerDataitem; Integer)
        {
            column(SomeGlobalVariableA; SomeGlobalVariableA)
            {
            }

            column(SomeGlobalVariableB; ReportInstanceGuid)
            {
            }

            trigger OnPreDataItem()
            begin
                IntegerDataitem.SetRange(Number, 1);
            end;

        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                // field(ReportInstanceGuid; ReportInstanceGuid)
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                // }
                group(GroupName)
                {
                    field(SomeGlobalVariableA; SomeGlobalVariableA)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            Logger.LogTrigger(ReportInstanceGuid, 'RequestPage-OnOpenPage');
            SomeGlobalVariableA := 'DefaultValue, set onOpenPage!'

        end;

        trigger OnInit()
        begin
            Logger.LogTrigger(ReportInstanceGuid, 'RequestPage-OnInit');
        end;

    }

    trigger OnInitReport()
    begin
        ReportInstanceGuid := CreateGuid();
        Logger.LogTrigger(ReportInstanceGuid, 'Report-OnInitReport');
    end;

    trigger OnPreReport()
    begin
        Logger.LogTrigger(ReportInstanceGuid, 'Report-OnPreReport');
    end;

    trigger OnPostReport()
    begin
        Logger.LogTrigger(ReportInstanceGuid, 'Report-OnPostReport');

    end;

    var
        Logger: Codeunit Logger;
        ReportInstanceGuid: Guid;
        SomeGlobalVariableA: Text;
}
