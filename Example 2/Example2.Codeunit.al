interface "IWhichCodeunit"
{
    procedure WhichCodeunit(): Text
}
enum 50000 WhichCodeunit implements IWhichCodeunit
{
    value(1; Codeunit1) { Implementation = IWhichCodeunit = "Codeunit 1"; }
    value(2; Codeunit2) { Implementation = IWhichCodeunit = "Codeunit 2"; }
}
codeunit 50001 "Codeunit 1" implements IWhichCodeunit
{
    procedure WhichCodeunit(): Text
    begin
        exit('Codeunit 1');
    end;
}
codeunit 50002 "Codeunit 2" implements IWhichCodeunit
{
    procedure WhichCodeunit(): Text
    begin
        exit('Codeunit 2');
    end;
}
codeunit 50000 "Calling"
{
    procedure OnRun()
    var
        IWhichCodeunit: Interface "IWhichCodeunit";
    begin
        IWhichCodeunit := WhichCodeunit::Codeunit1; // This should not be hardcoded
        Message(IWhichCodeunit.WhichCodeunit());
    end;
}