unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle, DB, OracleData, ComCtrls,StrUtils, Mask;

type
  TForm1 = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    datemax_: TEdit;
    datemin_: TEdit;
    Button1: TButton;
    StaticText1: TStaticText;
    ProgressBar1: TProgressBar;
    StaticText2: TStaticText;
    Label5: TLabel;
    StaticText3: TStaticText;
    Label6: TLabel;
    StaticText4: TStaticText;
    Label7: TLabel;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    sdvt: TComboBox;
    empmin_: TMaskEdit;
    empmax_: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  datemin,datemax:string;
 // year, month,day : word;
 // empmax,empmin,
 pr_zap :integer;
 // myFile : TextFile;

implementation
uses unit2;
{$R *.dfm}


 procedure TForm1.FormCreate(Sender: TObject);

 var
  i_np, i_HS,i : Integer;
  prm, name, psw, HString : string;
begin

      prm := ParamStr(1)+'/'+paramstr(2)+'@'+paramstr(3);   //для подключения к оболочке
  //   prm := ParamStr(1);
  i_np := Pos('/', prm);
  i_HS := Pos('@', prm);
   // есть имя/пароль из ком. строки ? (name/psw@HString)
  if Length(prm) > 2 then begin
    if (i_np = 0) or (i_HS = 0) then begin
     Application.MessageBox('Неверно переданы параметры подключения к БД.' ,
                            'Ошибка', MB_OK + MB_ICONERROR);
     Halt;
    end;
    name :=    LeftStr(prm, i_np - 1);
    psw  :=    MidStr(prm,  i_np + 1, i_HS - i_np - 1);
    HString := RightStr(prm, Length(prm) - i_HS );
    DataModule2.OracleSession1.LogonDatabase := HString;
    DataModule2.OracleSession1.LogonPassword  := psw;
    DataModule2.OracleSession1.LogonUsername:= name;
    DataModule2.OracleSession1.Connected := true;

    if not DataModule2.OracleSession1.Connected then Halt;
    end
   else begin
         DataModule2.OracleLogon1.Execute;
         if not DataModule2.OracleSession1.Connected  then Halt;
   end;

 label7.Caption:='База '+DataModule2.OracleSession1.LogonDatabase;
// DecodeDate(Date, Year, Month, Day);
 datamodule2.ODSdata.Close;
 datamodule2.ODSdata.Open;
 datamodule2.ODSdata.First;
 if datamodule2.ODSdata.RecordCount<>0
   then   begin
             datemin:=datamodule2.ODSdataDATEMIN.AsString;
             datemax:=datamodule2.ODSdataDATEMAX.AsString;

             datemin_.Text := datemin;
             datemax_.Text := datemax;


          end
    else begin
              showmessage('Ошибка пpи работе с 0-й записью таблицы RRTEMPIN.');
              Halt;
         end;
   datamodule2.ODSdata.Close;
    empmin_.Text:='1';
    empmax_.Text:='99999';
form1.sdvt.Clear;
form1.sdvt.Items.Add('*');
datamodule2.odsdvt.Close;
datamodule2.odsdvt.Open;
if datamodule2.odsdvt.RecordCount<>0
   then for i:=1 to datamodule2.odsdvt.RecordCount do
            begin
                 form1.sdvt.Items.Add(datamodule2.ODSdvtDVT.AsString);
                 datamodule2.odsdvt.Next;
            end;
datamodule2.odsdvt.Close;


end;

procedure TForm1.Button1Click(Sender: TObject);

begin

  if length(trim(form1.sdvt.Text))=0
    then begin showmessage('Введите тип неявки или * для всех'); exit; end;

  if (length(trim(form1.empmin_.Text))=0) or (length(trim(form1.empmax_.Text))=0)
    then begin showmessage('Введите табельный номер'); exit; end;



  pr_zap:=0;
  DataModule2.raschet1;

  ProgressBar1.Position:=100;
     if pr_zap=0
   then  ShowMessage('Расчет окончен')
   else  showmessage('Нет данных по запросу.');


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
       form1.Close ;
end;

end.
