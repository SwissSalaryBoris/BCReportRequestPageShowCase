page 50100 Demo
{

    Caption = 'Report Request Page Showcase';
    PageType = Card;
    SourceTable = "General Ledger Setup";
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(RunReport)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = report "Demo Report";
            }
            action(ShowLog)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Logger: Codeunit Logger;
                begin
                    Logger.ShowLog();
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        Logger: Codeunit Logger;
    begin
        Logger.InitializeLog();
    end;
}
