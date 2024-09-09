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




interface "IDoMath" extends "IWhichCodeunit"
{
    procedure DoMath(): Integer
}
enumextension 50000 "DoMath" implements IDoMath
{
    value(50000; Add) { Implementation = IDoMath = "Codeunit 3"; }
}
codeunit 50003 "Codeunit 3" implements IDoMath
// Must implement both WhichCodeunit and DoMath
{
    procedure WhichCodeunit(): Text
    begin
        exit('Codeunit 3');
    end;

    procedure DoMath(): Integer
    begin
        exit(2 + 2);
    end;
}
codeunit 50000 "Calling"
{
    procedure OnRun()
    var
        IDoMath: Interface "IDoMath";
        Codeunit3: Codeunit "Codeunit 3";
    begin
        IDoMath := Codeunit3;
        Message(IDoMath.WhichCodeunit());
        Message(Format(IDoMath.DoMath()));
    end;
}