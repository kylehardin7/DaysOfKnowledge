codeunit 50000 "Calling"
{
    procedure OnRun()
    var
        Codeunit2: Codeunit "Codeunit 2";
    begin
        Codeunit2:Run();
    end;
}

codeunit 50002 "Codeunit 2"
{
    procedure OnRun()
    begin
        Message('Codeunit 2');
    end;
}