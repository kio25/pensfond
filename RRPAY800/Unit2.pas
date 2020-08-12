
unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData,Windows,Dialogs , Forms,
  Messages,  Variants,  Controls, Math,
  StdCtrls,  ComCtrls;
type
  TDataModule2 = class(TDataModule)
    ODS2_koeff: TOracleDataSet;
    OracleLogon1: TOracleLogon;
    OracleSession1: TOracleSession;
    ODS2_koeffKOEF: TFloatField;
    ODS2_koeffINDATE: TDateTimeField;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1EMP: TIntegerField;
    OracleDataSet1YEAR: TIntegerField;
    OracleDataSet1MONTH: TIntegerField;
    OracleDataSet1SHOP: TIntegerField;
    OracleDataSet1EXPEND: TIntegerField;
    OracleDataSet1SUM2: TFloatField;
    OracleDataSet1SUM3: TFloatField;
    OracleDataSet1SUM4: TFloatField;
    OracleDataSet1SUM5: TFloatField;
    OracleDataSet1FLAGINV: TIntegerField;
    OracleDataSet1SUM22: TFloatField;
    OracleDataSet1SUM33: TFloatField;
    OracleDataSet1SUM44: TFloatField;
    OracleDataSet1SUM55: TFloatField;
    OracleQuery1del: TOracleQuery;
    OracleQuery1ins: TOracleQuery;
    OracleDataSet1MONTHYEAR: TFloatField;
  private
    { Private declarations }
  public
   procedure raschet1;
 //  procedure raschet2;
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
  i,flaginv,emp,pay: integer;
  date1: TDateTime;
  summax,sum1,sumt1,sgpd,szplmax,szpl,st_blfss :real;
  sbol,sblfss,sbolm,sblfssm,st_zpl,st_gpd,st_bl :real;
 //  myFile : TextFile;


implementation
 uses unit1;
{$R *.dfm}




procedure TDataModule2.raschet1;

   var i,koef: integer;
      kf,summax,summin,KFzpl,KFzpli,KFgpd,KFbol,KFblfss,KFboli,KFblfssi:real;
      RUzpl, RUgpd, RUbol, RUblfss: real;
      date1: TDateTime;
      EMP, YEARz, MONTHz, SHOP, EXPEND, FLAGINV: integer;
      sum,SUM2,SUM3,SUM4,SUM5,SUM22,SUM33,SUM44,SUM55: real;


    begin
    form1.ProgressBar1.Min;
 //form1.ProgressBar1.StepIt;
     // ѕопытка открыть файл Test.txt дл€ записи
       ChDir('c:\report\');

    if not(DirectoryExists('Pensfond'))
      then  createdir('Pensfond');


  AssignFile(myFile, 'c:\report\Pensfond\rrpay800.lst');
  ReWrite(myFile);
  Writeln(myFile, 'year '+Form1.Edit1.Text+' month '+Form1.Edit2.Text+' empmin '+Form1.Edit3.Text+' empmax '+Form1.Edit4.Text);

    // ѕопытка открыть файл Test.txt дл€ записи
 { AssignFile(myFile, 'c:\report.lst');
  ReWrite(myFile);
  Write(myFile, ' emp  year mn fl  ');
  Writeln(myFile, '  sumt1     szpl     szplmax     sgpd      sbol      sblfss    st_zpl    st_gpd     st_bl   st_blfss    sbolm    sblfssm');
 }
 //summax
date1:=StrToDate('01.'+IntToStr(month)+'.'+IntToStr(year));

ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',541);
ODS2_koeff.Open;
ODS2_koeff.First;
summax:= ODS2_koeff.FieldByName('koef').Value;

ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',540);
ODS2_koeff.Open;
ODS2_koeff.First;
summin:= ODS2_koeff.FieldByName('koef').Value;

 //KFzpl=sysindex(401,ldatemin);
ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',401);
ODS2_koeff.Open;
ODS2_koeff.First;
KFzpl:= ODS2_koeff.FieldByName('koef').Value;

// KFzpli=sysindex(405,ldatemin);
ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',405);
ODS2_koeff.Open;
ODS2_koeff.First;
KFzpli:= ODS2_koeff.FieldByName('koef').Value;

 //KFgpd=sysindex(434,ldatemin);
ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',434);
ODS2_koeff.Open;
ODS2_koeff.First;
KFgpd:= ODS2_koeff.FieldByName('koef').Value;

// KFbol=sysindex(430,ldatemin);
ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',430);
ODS2_koeff.Open;
ODS2_koeff.First;
KFbol:= ODS2_koeff.FieldByName('koef').Value;
KFblfss:= kfbol;

//KFboli=sysindex(435,ldatemin);
ODS2_koeff.Close;
ODS2_koeff.SetVariable('date1',date1);
ODS2_koeff.SetVariable('kf',435);
ODS2_koeff.Open;
ODS2_koeff.First;
KFboli:= ODS2_koeff.FieldByName('koef').Value;
KFblfssi:= kfboli;
ODS2_koeff.Close;


 Write(myFile, 'summax '+FloattoStr(summax)+' summin '+ FloattoStr(summin)+' KFzpl '+FloattoStr(KFzpl)+' KFzpli '+FloattoStr(KFzpli));
 Writeln(myFile, 'KFgpd '+FloattoStr(KFgpd)+' KFbol '+FloattoStr(KFbol)+' KFboli '+FloattoStr(KFboli)+' KFblfss '+FloattoStr(KFblfss)+' KFblfssi '+FloattoStr(KFblfssi));
 RUzpl:= 0;
 RUgpd:= 0;
 RUbol:= 0;
 RUblfss:= 0;

 if pr=0  //если указатель пустой то пишем в базу
  then  begin

                   OracleQuery1del.SetVariable('empmin',empmin);
                   OracleQuery1del.SetVariable('empmax',empmax);
                   OracleQuery1del.setVariable('month',month);
                   OracleQuery1del.SetVariable('year',year);

                   with OracleQuery1del do
                      try
                          Form1.StaticText1.Caption := 'del';
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;

                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;
             end;

  OracleDataSet1.Close;
  OracleDataSet1.SetVariable('month',month);
  OracleDataSet1.SetVariable('year',year);
  OracleDataSet1.SetVariable('empmin',empmin);
  OracleDataSet1.SetVariable('empmax',empmax);
  OracleDataSet1.Open;
  OracleDataSet1.First;


  if OracleDataSet1.RecordCount<>0
       then begin
               form1.ProgressBar1.Max := OracleDataSet1.RecordCount;
               Form1.StaticText2.Caption:='0';
               Form1.StaticText2.Repaint;
               Form1.StaticText3.Caption:=Inttostr(OracleDataSet1.RecordCount);
               Form1.StaticText3.Repaint;

        for i:=1 to OracleDataSet1.RecordCount do
             begin
             sum2:=0; sum3:=0; sum4:=0; sum5:=0;
             sum22:=0; sum33:=0; sum44:=0; sum55:=0;
             emp:= 0;
             shop:= 0;
             expend:= 0;
             flaginv:= 0;
             monthz:=0;
             yearz:=0;

              emp:=OracleDataSet1Emp.AsInteger;
              YEARz:=OracleDataSet1YEAR.AsInteger;
              MONTHz:=OracleDataSet1MONTH.AsInteger;
              SHOP:=OracleDataSet1Shop.AsInteger;
              EXPEND:=OracleDataSet1EXPEND.AsInteger;
              SUM2:=OracleDataSet1SUM2.AsFloat;
              SUM3:=OracleDataSet1SUM3.AsFloat;
              SUM4:=OracleDataSet1SUM4.AsFloat;
              sum5:=OracleDataSet1SUM5.AsFloat;
              FLAGINV:=OracleDataSet1FLAGINV.AsInteger;
              SUM22:=OracleDataSet1SUM22.AsFloat;
              SUM33:=OracleDataSet1SUM33.AsFloat;
              SUM44:=OracleDataSet1SUM44.AsFloat;
              sum55:=OracleDataSet1SUM55.AsFloat;

              form1.StaticText1.Caption:=IntToStr(emp);
          //    form1.ProgressBar1.StepIt;

              if (flaginv=1) then RUzpl:=RoundTo(sum2*KFzpli,-2)
                      else RUzpl:=RoundTo(sum2*KFzpl,-2);

              if (flaginv=1) then  RUbol:=RoundTo(sum3*KFboli,-2)
                             else  RUbol:=RoundTo(sum3*KFbol,-2);;


              if (flaginv=1) then  RUblfss:=RoundTo(sum4*KFblfssi,-2)
                             else  RUblfss:=RoundTo(sum4*KFblfss,-2);

      RUgpd:=RoundTo(sum5*KFgpd,-2);
      Write(myFile, 'EMP '+InttoStr(emp)+ ' YEAR '+InttoStr(yearz)+' MONTH '+InttoStr(monthz));
      Write(myFile, ' FLAGINV '+InttoStr(flaginv)+' SUM2 '+Floattostr(sum2)+' RUzpl '+Floattostr(RUzpl));
      Write(myFile, ' SUM3 '+floattostr(sum3)+' RUbol '+floattostr(RUbol)+' SUM4 '+Floattostr(sum4));
      Writeln(myFile, ' RUblfss '+floattostr(RUblfss)+' SUM5 '+floattostr(sum5)+' RUgpd '+floattostr(rugpd));

       if pr=0  //если указатель пустой то пишем в базу
         then begin
             if  ((RUzpl<>0) or (sum22<>0))  //pay=800
               then   begin
                   OracleQuery1ins.SetVariable('emp',emp);
                   OracleQuery1ins.SetVariable('pay',800);
                   OracleQuery1ins.SetVariable('yearz',yearz);
                   OracleQuery1ins.SetVariable('monthz',monthz);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
                   OracleQuery1ins.SetVariable('expend',expend);
                   OracleQuery1ins.SetVariable('sum',ruzpl);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('shop',shop);
                  // OracleQuery1ins.SetVariable('monthyear',DataModule2.OracleDataSet1MONTHYEAR.AsInteger);
                     with OracleQuery1ins do
                      try
                          Form1.StaticText1.Caption := 'ins '+IntToStr(emp);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;

                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;
                   end;

  if ((RUbol<>0) or (sum33<>0)) //pay=806
                 then   begin
                   OracleQuery1ins.SetVariable('emp',emp);
                   OracleQuery1ins.SetVariable('pay',806);
                   OracleQuery1ins.SetVariable('yearz',yearz);
                   OracleQuery1ins.SetVariable('monthz',monthz);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
                   OracleQuery1ins.SetVariable('expend',expend);
                   OracleQuery1ins.SetVariable('sum',rubol);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('shop',shop);
                  // OracleQuery1ins.SetVariable('monthyear',DataModule2.OracleDataSet1MONTHYEAR.AsInteger);
                     with OracleQuery1ins do
                      try
                          Form1.StaticText1.Caption := 'ins '+IntToStr(emp);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;

                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;
                   end;

  if ((RUblfss<>0) or (sum44<>0)) // pay=808
                 then   begin
                   OracleQuery1ins.SetVariable('emp',emp);
                   OracleQuery1ins.SetVariable('pay',808);
                   OracleQuery1ins.SetVariable('yearz',yearz);
                   OracleQuery1ins.SetVariable('monthz',monthz);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
                   OracleQuery1ins.SetVariable('expend',expend);
                   OracleQuery1ins.SetVariable('sum',RUblfss);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('shop',shop);
                  // OracleQuery1ins.SetVariable('monthyear',DataModule2.OracleDataSet1MONTHYEAR.AsInteger);
                     with OracleQuery1ins do
                      try
                          Form1.StaticText1.Caption := 'ins '+IntToStr(emp);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;

                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end; end;

  if ((RUgpd<>0) or (sum55<>0)) // pay=804
                 then   begin
                   OracleQuery1ins.SetVariable('emp',emp);
                   OracleQuery1ins.SetVariable('pay',804);
                   OracleQuery1ins.SetVariable('yearz',yearz);
                   OracleQuery1ins.SetVariable('monthz',monthz);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
                   OracleQuery1ins.SetVariable('expend',expend);
                   OracleQuery1ins.SetVariable('sum',RUgpd);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('shop',shop);
                  // OracleQuery1ins.SetVariable('monthyear',DataModule2.OracleDataSet1MONTHYEAR.AsInteger);
                     with OracleQuery1ins do
                      try
                          Form1.StaticText1.Caption := 'ins '+IntToStr(emp);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;

                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end; end;


                   OracleSession1.Commit;
                   //    end;

              end;   // if  pr=0  //если указатель пустой то пишем в базу

              
                   Application.ProcessMessages;
              OracleDataSet1.Next;
              form1.ProgressBar1.StepIt;
              Form1.StaticText2.Caption:=Inttostr(i);
               Form1.StaticText2.Repaint;

             end; // for i:=1 to OracleDataSet1.RecordCount do

            end //OracleDataSet1.RecordCount<>0
        else pr_zap:=1; //   showmessage('Ќет данных по запросу.');
    OracleDataSet1.Close;
    CloseFile(myFile);
end;


end.
