codeunit 50000 "Calling"
{
    procedure OnRun()
    var
        Codeunit1: Codeunit "Codeunit 1";
    begin
        Codeunit1:Run();
    end;
}

codeunit 50001 "Codeunit 1"
{
    procedure OnRun()
    begin
        Message('Codeunit 1');
    end;
}