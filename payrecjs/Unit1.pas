unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle, DB, OracleData, ComCtrls,StrUtils;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    StaticText1: TStaticText;
    Edit5: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Label5: TLabel;
     procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  year, month,day : word;
  empmax,empmin,pr_zap :integer;


implementation
uses unit2;
{$R *.dfm}



 procedure TForm1.FormCreate(Sender: TObject);

 var
  i_np, i_HS : Integer;
  prm, name, psw, HString : string;
begin
   //  prm := ParamStr(1);
       prm := ParamStr(1)+'/'+Paramstr(2)+'@'+paramstr(3);
  //    prm := ParamStr(1)+'/'+paramstr(2)+'@'+paramstr(3);
  i_np := Pos('/', prm);
  i_HS := Pos('@', prm);
   // ���� ���/������ �� ���. ������ ? (name/psw@HString)
  if Length(prm) > 2 then begin
    if (i_np = 0) or (i_HS = 0) then begin
     Application.MessageBox('������� �������� ��������� ����������� � ��.' ,
                            '������', MB_OK + MB_ICONERROR);
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


 DecodeDate(Date, Year, Month, Day);
 Edit1.Text := IntToStr(Year);
 Edit2.Text := IntToStr(Month);

 empmin:=1;
 empmax:=99999;
 Edit4.Text := IntToStr(empmin);
 Edit5.Text := IntToStr(empmax);



end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  year:=StrToInt(Edit1.Text);
  month:=StrToInt(Edit2.Text);
  empmin:=StrToInt(Edit4.Text);
  empmax:=StrToInt(Edit5.Text);
     pr_zap:=0;

  if(empmin=0) then empmin:=1;
  if(empmax=0) then empmax:=99999;




  DataModule2.raschet1;
  ProgressBar1.Max;
     if pr_zap=0
   then  ShowMessage('������ �������')
   else  showmessage('��� ������ �� �������.');


end;

end.