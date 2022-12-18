program getPeriod;

uses
  Forms,
  GetPeriods in 'GetPeriods.pas' {GetPeriodForm},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
