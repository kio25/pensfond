program DVTST1214;

uses
  Forms,
  unit1 in 'unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DVTST_12_14';
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  if not  DataModule2.OracleSession1.Connected then Application.Terminate
  else   Application.Run;
end.