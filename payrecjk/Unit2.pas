unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData,Windows,Dialogs ,
  Messages,  Variants,  Controls, Math,  Forms,
  StdCtrls,  ComCtrls;


 // Graphics,  Forms,
 // Dialogs, StdCtrls, Oracle, DB, OracleData, ComCtrls,StrUtils;


 const razmas=100;
      factmonr11=201301; // ������� ���� � ������� ���������� ��������� �� ����������� ���������� �� ������ 2012
type
  TDataModule2 = class(TDataModule)
    ODS2_koeff: TOracleDataSet;
    OracleLogon1: TOracleLogon;
    OracleSession1: TOracleSession;
    ODS2_koeffKOEF: TFloatField;
    ODS2_koeffINDATE: TDateTimeField;
    OracleDataSet1: TOracleDataSet;
    OracleQuery1del: TOracleQuery;
    OracleQuery1ins: TOracleQuery;
    OracleQueryinv: TOracleQuery;
    OracleDataSet1EMP: TIntegerField;
    OracleDataSet1FACTMON: TIntegerField;
    OracleDataSet2_old: TOracleDataSet;
    OracleDataSet2_oldPAYPRTY: TFloatField;
    OracleDataSet2_oldSHOP: TFloatField;
    OracleDataSet2_oldPAY: TFloatField;
    OracleDataSet2_oldEXPEND: TFloatField;
    OracleDataSet2_oldSUM: TFloatField;
    OracleDataSet2_oldFLAGVO: TFloatField;
    OracleQuery2ins0: TOracleQuery;
    OracleDataSet3inv: TOracleDataSet;
    OracleDataSet3invFLAGINV: TFloatField;
    OracleDataSet3_old2012: TOracleDataSet;
    OracleDataSet3_old2012PAYPRTY: TFloatField;
    OracleDataSet3_old2012SHOP: TIntegerField;
    OracleDataSet3_old2012PAY: TIntegerField;
    OracleDataSet3_old2012EXPEND: TIntegerField;
    OracleDataSet3_old2012SUM: TFloatField;
    OracleDataSet3_old2012FLAGVO: TFloatField;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2PAYPRTY: TFloatField;
    OracleDataSet2SHOP: TFloatField;
    OracleDataSet2PAY: TFloatField;
    OracleDataSet2EXPEND: TFloatField;
    OracleDataSet2SUM: TFloatField;
    OracleDataSet2FLAGVO: TFloatField;
    ODSsum1: TOracleDataSet;
    ODSsum1PAYPRTY: TFloatField;
    ODSsum1SHOPOLD: TIntegerField;
    ODSsum1PAY: TIntegerField;
    ODSsum1EXPEND: TIntegerField;
    ODSsum1SUM: TFloatField;
    ODSsum1FLAGVO: TFloatField;
    OQ2sumzpf: TOracleQuery;
    OQ2sumblf: TOracleQuery;
    ODSsum2: TOracleDataSet;
    ODSsum2PAYPRTY: TFloatField;
    ODSsum2SHOPOLD: TIntegerField;
    ODSsum2PAY: TIntegerField;
    ODSsum2EXPEND: TIntegerField;
    ODSsum2EMP: TIntegerField;
    ODSsum2SUM: TFloatField;
    ODSsum2FLAGVO: TFloatField;
    ODSsumzpf3: TOracleDataSet;
    ODSsumzpf3FACTMON: TIntegerField;
    ODSsumzpf3SUMZPF3: TFloatField;
    ODSbol: TOracleDataSet;
    ODSbolPAYPRTY: TFloatField;
    ODSbolSHOPOLD: TIntegerField;
    ODSbolPAY: TIntegerField;
    ODSbolEXPEND: TIntegerField;
    ODSbolEMP: TIntegerField;
    ODSbolSUM: TFloatField;
    ODSbolFLAGVO: TFloatField;
    OQinstmp2: TOracleQuery;
    OQdeltmp: TOracleQuery;
    ODStmp4: TOracleDataSet;
    ODStmp4EMP: TIntegerField;
    ODStmp4FACTMON: TIntegerField;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet3PAYPRTY: TIntegerField;
    OracleDataSet3SHOP: TIntegerField;
    OracleDataSet3PAY: TIntegerField;
    OracleDataSet3EXPEND: TIntegerField;
    OracleDataSet3SUM: TFloatField;
    OracleDataSet3FLAGVO: TIntegerField;
    ODSsum1YEAR: TIntegerField;
    ODSsum1MONTH: TIntegerField;
    ODSsum2YEAR: TIntegerField;
    ODSsum2MONTH: TIntegerField;
    ODSbolYEAR: TIntegerField;
    ODSbolMONTH: TIntegerField;
    OracleDataSet3MONTHYEAR: TFloatField;


  private

    { Private declarations }
   procedure zap_baza;
   procedure zap_mas;
   procedure obnul_mas;
   procedure sozd_mas(var ind:integer);

  public
   procedure raschet1;
   PROCEDURE SOZD;
 //  procedure raschet2;
    { Public declarations }
     end;
  type TEmp=record
      SHOP :integer;    //��� ����
      PAY :integer;     //��� ���� �����, ���p�.
      EXPEND:integer;   //���p �p�������������� ���p�� (���)
      flagvo:integer;   // ���� ����� 1-4
      flagcor:integer;  // ���� ������������� 0- ����� ������������� 1- ����� ���������� �� ������ EXPEND
      flagcor1:integer;  // ���� �������������  0- 1 ������ N - ��������� ������� �� ������ EXPEND
      SUM1:real;        //����� ����������
      SUM2:real;        //����� ���������� �� ���.�����
      SUM3:real;        //����� ������.�� ���������� ����� �� ���� ����-� � �����.������
      SUM4:real;        //����� ������.�� ���������� ����� �� ���� ���
      SUM5:real;        //����� ������.�������������� �� ����.����.���������
      SUM22:real;       //����� ���.�����>SumMax ���.,� ���.�� ������� ���� ���������
      SUM33:real;       //����� � �����.���.�� ���� ��>SumMax,� ���.�� ������� ���� ���������
      SUM44:real;       //����� � �����.���.�� ���� ���>SumMax ,� ���.�� ������� ���� ���������
      SUM55:real;       //����� ���.�� ���>SumMax ,� ���.�� ������� ���� ��������� ��� SumMax - ������� ������� ��� ��������� �� �/��.
      monthyear:Integer;

  end;

   type TEmp1=record
      payprty:integer;
      SHOP :integer;    //��� ����
      PAY :integer;     //��� ���� �����, ���p�.
      EXPEND:integer;   //���p �p�������������� ���p�� (���)
      flagvo:integer;   // ���� ����� 1-4
   //   flagcor:integer;  // ���� ������������� 0- ����� ������������� 1- ����� ���������� �� ������ EXPEND
   //   flagcor1:integer;  // ���� �������������  0- 1 ������ N - ��������� ������� �� ������ EXPEND
      SUM:real;        //����� ����������
       monthyear:Integer;

  end;


var
  DataModule2: TDataModule2;
  empf,j,pr_summax:integer;
  factmonf,yearf,monthf: real;
  summax,SumMaxU,sumpr:real;
  myFile : TextFile;
  date1: TDateTime;
  dTmp : array [1..razmas] of TEmp;
  dTmp1 : array [1..razmas] of TEmp1;


implementation
 uses unit1;

{$R *.dfm}


PROCEDURE TDataModule2.SOZD;
   var i,m,k1:integer;
 BEGIN
   // ������� ���� �������
     OQdeltmp.SetVariable('empmin',empmin);
     OQdeltmp.SetVariable('empmax',empmax);
    // OQdeltmp.setVariable('month',month);
    // OQdeltmp.SetVariable('year',year);
                   with OQdeltmp do
                      try
                          Form1.StaticText1.Caption := 'OQdeltmp';
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

         // ������� ������� ���� Test.txt ��� ������

         
      ChDir('c:\report\');

    if not(DirectoryExists('Pensfond'))
      then  createdir('Pensfond');



  AssignFile(myFile, 'c:\report\Pensfond\payrecjk.lst');
  ReWrite(myFile);
  writeln(myFile,'year '+Form1.Edit1.Text+' month '+Form1.Edit2.Text+' empmin '+form1.Edit4.Text+' empmax '+form1.Edit5.Text  );

  OracleDataSet1.Close;
  OracleDataSet1.SetVariable('month',month);
  OracleDataSet1.SetVariable('year',year);
  OracleDataSet1.SetVariable('empmin',empmin);
  OracleDataSet1.SetVariable('empmax',empmax);
  OracleDataSet1.Open;
  OracleDataSet1.First;


  if OracleDataSet1.RecordCount<>0
     then  begin
         form1.ProgressBar1.Max := OracleDataSet1.RecordCount*2;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:=Inttostr(OracleDataSet1.RecordCount);
         Form1.StaticText3.Repaint;
         Form1.StaticText4.Caption:='(1)';
         Form1.StaticText4.Repaint;


         for i:=1 to OracleDataSet1.RecordCount do
             begin
                 empf:=OracleDataSet1Emp.AsInteger;
                 factmonf:=OracleDataSet1FACTMON.AsInteger;
                 yearf:=int(factmonf/100);
                 monthf:=factmonf-yearf*100;
                 sozd_mas(k1); //�������� �������    dTmp1 ��� ����������� ��������� ��� ����������� empf, factmonf

                for m:=1 to k1 do
                    begin

                   OQinstmp2.SetVariable('emp',empf);
                   OQinstmp2.SetVariable('year',year);
                   OQinstmp2.SetVariable('month',month);
                   OQinstmp2.SetVariable('pay',dTmp1[m].pay);
                   OQinstmp2.SetVariable('factmon',factmonf);
                   OQinstmp2.SetVariable('sum',dTmp1[m].sum);
                   OQinstmp2.SetVariable('SHOPOLD',dTmp1[m].shop);
                   OQinstmp2.SetVariable('expend',dTmp1[m].expend);
                   OQinstmp2.SetVariable('flagvo',dTmp1[m].flagvo);
                   OQinstmp2.SetVariable('PAYPRTY',dTmp1[m].payprty);
                   OQinstmp2.SetVariable('monthyear',dTmp1[m].monthyear);
                     with OQinstmp2 do
                      try
                          Form1.StaticText1.Caption := 'instmp '+IntToStr(empf);
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
                  end;    //                for m:=1 to k1 do
                 datamodule2.OracleSession1.Commit;
                OracleDataSet1.Next;
                  Form1.StaticText2.Caption:=Inttostr(i);
                  Form1.StaticText2.Repaint;
                  Form1.ProgressBar1.StepIt;
     end; // for i:=1 to OracleDataSet1.RecordCount do
     end;
       OracleDataSet1.Close;
 END;


procedure TDataModule2.raschet1;

   var
      i,i1,emp_old: integer;
       factmon_old:real;
       year_my,month_my:Integer;

    begin
 form1.ProgressBar1.Min;
 form1.ProgressBar1.StepIt;
     // ������� ������� ���� Test.txt ��� ������
{  AssignFile(myFile, 'c:\payrecjk.lst');
  ReWrite(myFile);
     writeln(myFile,'year '+Form1.Edit1.Text+' month '+Form1.Edit2.Text+' empmin '+form1.Edit4.Text+' empmax '+form1.Edit5.Text  );
 // obnul_mas; //��������� ������� ��� emp
 }
  ODStmp4.Close;
  ODStmp4.SetVariable('month',month);
  ODStmp4.SetVariable('year',year);
  ODStmp4.SetVariable('empmin',empmin);
  ODStmp4.SetVariable('empmax',empmax);
  ODStmp4.Open;
  ODStmp4.First;


  if ODStmp4.RecordCount<>0
     then  begin
       //  form1.ProgressBar1.Max := ODStmp4.RecordCount;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:=Inttostr(ODStmp4.RecordCount);
         Form1.StaticText3.Repaint;
         Form1.StaticText4.Caption:='(2)';
         Form1.StaticText4.Repaint;

         emp_old:=0;
         factmon_old:=0;

         for i:=1 to ODStmp4.RecordCount do

           begin
          empf:=ODStmp4Emp.AsInteger;
          factmonf:=ODStmp4FACTMON.AsInteger;
          yearf:=int(factmonf/100);
          monthf:=factmonf-yearf*100;


     {
     //01.2012    if yearf=year  //���� �������� ��� �� ��������� � �����  factmonf, �� ��������� �� ���� ������
        if yearf<2012
            then  begin

         // �������� ������� �� ��������� empf factmon
              OracleQuery1del.SetVariable('empf',empf);
                   OracleQuery1del.setVariable('monthf',monthf);
                   OracleQuery1del.SetVariable('yearf',yearf);
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
               Form1.StaticText1.Caption:='Del'+inttostr(empf);
         //---------------

             // summax   kf=541
              date1:=StrToDate('01.'+FloatToStrF(monthf,ffGeneral,2,0)+'.'+FloatToStrF(yearf,ffGeneral,4,0));

              ODS2_koeff.Close;
              ODS2_koeff.SetVariable('date1',date1);
              ODS2_koeff.SetVariable('kf',541);
              ODS2_koeff.Open;
              summax:= ODS2_koeff.FieldByName('koef').Value;
              ODS2_koeff.Close;
              writeln(myFile,'empf ',inttostr(empf),' summmax=',FloatToStr(summax),' factmon ',floattostr(factmonf));


               OracleDataSet2.Close;
               OracleDataSet2.SetVariable('monthf',monthf);
               OracleDataSet2.SetVariable('yearf',yearf);
               OracleDataSet2.SetVariable('emp',empf);
               OracleDataSet2.Open;
               OracleDataSet2.First;
               if OracleDataSet2.RecordCount<>0
                 then begin
                      empf:=OracleDataSet1Emp.AsInteger;
                      j:=1;
                      SumMaxU:=0;
                      sumpr:=0;
                      obnul_mas;
                  for i1:=1 to OracleDataSet2.RecordCount do
                       begin
                           zap_mas; //����������� ������
                           OracleDataSet2.Next;
                       end;  //   for i1:=1 to OracleDataSet2.RecordCount do

                       zap_baza; // ������ � ����

                       end;  //    if OracleDataSet2.RecordCount<>0 then

                     // ���������� ������ ����� � ������� � ���������� �������� �������
                   OracleQuery2ins0.SetVariable('emp',empf);
                   OracleQuery2ins0.SetVariable('monthf',monthf);
                   OracleQuery2ins0.SetVariable('yearf',yearf);
                     with OracleQuery2ins0 do
                      try
                          Form1.StaticText1.Caption := 'ins0 '+IntToStr(empf);
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
                    OracleSession1.Commit;

            end;// yearf<2012       if yearf=yearr

      }
        if yearf>2011
            then  begin

         // �������� ������� �� ��������� empf factmon
              OracleQuery1del.SetVariable('empf',empf);
                   OracleQuery1del.setVariable('monthf',monthf);
                   OracleQuery1del.SetVariable('yearf',yearf);
                 //  OracleQuery1del.SetVariable('monthyear',DataModule2.ODStmp4MONTHyEAR.AsInteger);
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
               Form1.StaticText1.Caption:='Del'+inttostr(empf);
         //---------------

             // summax   kf=541
              date1:=StrToDate('01.'+FloatToStrF(monthf,ffGeneral,2,0)+'.'+FloatToStrF(yearf,ffGeneral,4,0));

              ODS2_koeff.Close;
              ODS2_koeff.SetVariable('date1',date1);
              ODS2_koeff.SetVariable('kf',541);
              ODS2_koeff.Open;
              summax:= ODS2_koeff.FieldByName('koef').Value;
              ODS2_koeff.Close;
              writeln(myFile,'empf ',inttostr(empf),' summmax=',FloatToStr(summax),' factmon ',floattostr(factmonf));



               OracleDataSet3.Close;
               OracleDataSet3.SetVariable('monthf',monthf);
               OracleDataSet3.SetVariable('yearf',yearf);
               OracleDataSet3.SetVariable('emp',empf);
               OracleDataSet3.Open;
               OracleDataSet3.First;
               if OracleDataSet3.RecordCount<>0
                 then begin
                      empf:=ODStmp4Emp.AsInteger;
                      j:=1;
                      SumMaxU:=0;
                      sumpr:=0;
                      obnul_mas;
                  for i1:=1 to OracleDataSet3.RecordCount do
                       begin
                           zap_mas; //����������� ������
                           OracleDataSet3.Next;
                       end;  //   for i1:=1 to OracleDataSet3.RecordCount do

                       zap_baza; // ������ � ����

                       end;  //    if OracleDataSet3.RecordCount<>0 then

                    // ���������� ������ ����� � ������� � ���������� �������� �������
                   OracleQuery2ins0.SetVariable('emp',empf);
                   OracleQuery2ins0.SetVariable('monthf',monthf);
                   OracleQuery2ins0.SetVariable('yearf',yearf);
                     with OracleQuery2ins0 do
                      try
                          Form1.StaticText1.Caption := 'ins0 '+IntToStr(empf);
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
                    OracleSession1.Commit;

            end;// yearf>2011       if yearf=yearr








                   Application.ProcessMessages;

                  ODStmp4.Next;
                  Form1.StaticText2.Caption:=Inttostr(i);
                  Form1.StaticText2.Repaint;
                  Form1.ProgressBar1.StepIt;
            end; // for i:=1 to OracleDataSet1.RecordCount do




           end   //if OracleDataSet1.RecordCount<>0 then begin
     else   pr_zap:=1; //showmessage('��� ������ �� �������.');

    ODStmp4.Close;
    CloseFile(myFile);

    end;  //procedure TDataModule2.raschet1;

procedure TDataModule2.zap_mas;  //������ � ������ ��� emp

 begin

    if yearf<2012
            then  begin
      dTmp[j].shop:= OracleDataSet2SHOP.AsInteger;
      dTmp[j].PAY:=OracleDataSet2PAY.AsInteger;
      dTmp[j].EXPEND:=OracleDataSet2EXPEND.AsInteger;
      dTmp[j].flagvo:=OracleDataSet2FLAGVO.AsInteger;
      dTmp[j].SUM1:=OracleDataSet2SUM.AsFloat;
                   END;

       if yearf>2011
            then  begin
      dTmp[j].shop:= OracleDataSet3SHOP.AsInteger;
      dTmp[j].PAY:=OracleDataSet3PAY.AsInteger;
      dTmp[j].EXPEND:=OracleDataSet3EXPEND.AsInteger;
      dTmp[j].flagvo:=OracleDataSet3FLAGVO.AsInteger;
      dTmp[j].SUM1:=OracleDataSet3SUM.AsFloat;
      dTmp[j].monthyear:=OracleDataSet3MONTHYEAR.AsInteger;
                   END;

      sumpr:=sumpr+dTmp[j].SUM1;
      summaxU:=summax-sumpr;

///
        if summaxU>=0
        then
         if pr_summax=0     //�� ���� � ����������
               then   begin

               case dTmp[j].flagvo of
                 1: dTmp[j].SUM2:=dtmp[j].SUM1;
                 2: dTmp[j].SUM3:=dtmp[j].SUM1;
                 3: dTmp[j].SUM4:=dtmp[j].SUM1;
                 4: dTmp[j].SUM5:=dtmp[j].SUM1;
                end
             end

               else   //���� � ���������� ������ �������������  �����  ���� � ����������
                       begin

                      case dTmp[j].flagvo of
                           1: begin dTmp[j].SUM22:=dtmp[j].SUM1+Roundto(summaxu,-2); dTmp[j].SUM2:=0-Roundto(summaxu,-2);end;
                           2: begin dTmp[j].SUM33:=dtmp[j].SUM1+Roundto(summaxu,-2); dTmp[j].SUM3:=0-Roundto(summaxu,-2);end;
                           3: begin dTmp[j].SUM44:=dtmp[j].SUM1+Roundto(summaxu,-2); dTmp[j].SUM4:=0-Roundto(summaxu,-2);end;
                           4: begin dTmp[j].SUM55:=dtmp[j].SUM1+Roundto(summaxu,-2); dTmp[j].SUM5:=0-Roundto(summaxu,-2);end;
                end;
                          pr_summax:=0;

                       end   // if pr_summax=0
         else
         if pr_summax=0
              then
                   begin

                case dTmp[j].flagvo of
                 1: begin dTmp[j].SUM22:=Roundto(abs(summaxu),-2); dTmp[j].SUM2:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 2: begin dTmp[j].SUM33:=Roundto(abs(summaxu),-2); dTmp[j].SUM3:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 3: begin dTmp[j].SUM44:=Roundto(abs(summaxu),-2); dTmp[j].SUM4:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 4: begin dTmp[j].SUM55:=Roundto(abs(summaxu),-2); dTmp[j].SUM5:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                    end;
                   pr_summax:=1;
                   end

              else
                case dTmp[j].flagvo of
                     1: dTmp[j].SUM22:=dtmp[j].SUM1;
                     2: dTmp[j].SUM33:=dtmp[j].SUM1;
                     3: dTmp[j].SUM44:=dtmp[j].SUM1;
                     4: dTmp[j].SUM55:=dtmp[j].SUM1;



         end;

///
  {    if summaxU>=0
        then
               case dTmp[j].flagvo of
                 1: dTmp[j].SUM2:=dtmp[j].SUM1;
                 2: dTmp[j].SUM3:=dtmp[j].SUM1;
                 3: dTmp[j].SUM4:=dtmp[j].SUM1;
                 4: dTmp[j].SUM5:=dtmp[j].SUM1;
                end

         else
         if pr_summax=0
              then
                   begin

                case dTmp[j].flagvo of
                 1: begin dTmp[j].SUM22:=Roundto(abs(summaxu),-2); dTmp[j].SUM2:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 2: begin dTmp[j].SUM33:=Roundto(abs(summaxu),-2); dTmp[j].SUM3:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 3: begin dTmp[j].SUM44:=Roundto(abs(summaxu),-2); dTmp[j].SUM4:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                 4: begin dTmp[j].SUM55:=Roundto(abs(summaxu),-2); dTmp[j].SUM5:=Roundto((dtmp[j].SUM1+summaxu),-2) ; end;
                    end;
                   pr_summax:=1;
                   end

              else
                case dTmp[j].flagvo of
                     1: dTmp[j].SUM22:=dtmp[j].SUM1;
                     2: dTmp[j].SUM33:=dtmp[j].SUM1;
                     3: dTmp[j].SUM44:=dtmp[j].SUM1;
                     4: dTmp[j].SUM55:=dtmp[j].SUM1;



         end;

   }

       write(myFile, 'j ',IntToStr(j));
       write(myFile, ' emp ',IntToStr(empf));
       write(myFile, ' shop ',IntToStr(dTmp[j].shop));
       write(myFile, ' pay ',IntToStr(dTmp[j].pay));
       write(myFile, ' expend ',IntToStr(dTmp[j].expend));
       write(myFile, ' flagvo ',IntToStr(dTmp[j].flagvo));
       write(myFile, ' sum1 ',FloatToStr(dTmp[j].sum1));
       write(myFile, ' sum2 ',FloatToStr(dTmp[j].sum2));
       write(myFile, ' sum22 ',FloatToStr(dTmp[j].sum22));
       write(myFile, ' sum3 ',FloatToStr(dTmp[j].sum3));
       write(myFile, ' sum33 ',FloatToStr(dTmp[j].sum33));
       write(myFile, ' sum4 ',FloatToStr(dTmp[j].sum4));
       write(myFile, ' sum44 ',FloatToStr(dTmp[j].sum44));
       write(myFile, ' sum5 ',FloatToStr(dTmp[j].sum5));
       writeln(myFile, ' sum55 ',FloatToStr(dTmp[j].sum55));
        writeln(myFile, ' monthyear ',intToStr(dTmp[j].monthyear));
       j:=j+1;
     form1.StaticText1.Caption:='R '+IntToStr(empf);

 end  ;    //procedure TDataModule2.zap_mas;

procedure  TDataModule2.obnul_mas; //��������� ������� ��� emp
var k:integer;
begin
  for k:=1 to razmas do
   begin dTmp[k].SHOP:=0;
         dTmp[k].PAY:=0;
         dTmp[k].EXPEND:=0;
         dTmp[k].flagvo:=0;
         dTmp[k].flagcor:=0;
         dTmp[k].flagcor1:=0;
         dTmp[k].SUM1:=0;
         dTmp[k].SUM2:=0;
         dTmp[k].SUM3:=0;
         dTmp[k].SUM4:=0;
         dTmp[k].SUM5:=0;
         dTmp[k].SUM22:=0;
         dTmp[k].SUM33:=0;
         dTmp[k].SUM44:=0;
         dTmp[k].SUM55:=0;
         dTmp[k].monthyear:=0;
   end   ;
   pr_summax:=0;
 end;


procedure  TDataModule2.zap_baza;     //������ � ���� ��� emp
  var k,k1:integer;

      //SHOP, EXPEND,
      flaginv,flagcorr: integer;
      //SUM2,SUM3,SUM4,SUM5,SUM22,SUM33,SUM44,SUM55: real;

begin
               {    OracleQueryinv.SetVariable('emp',empf);
                   OracleQueryinv.SetVariable('yearf',yearf);
                   OracleQueryinv.SetVariable('monthf',monthf);
                   with OracleQueryinv do
                      try
                          Form1.StaticText1.Caption := 'inv '+IntToStr(empf);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage('inv');
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;
                       flaginv:=Field(0);
                   except
                       on E:EOracleError do  ShowMessage(E.Message);
                   end;
                 }
               OracleDataSet3inv.Close;
               OracleDataSet3inv.SetVariable('monthf',monthf);
               OracleDataSet3inv.SetVariable('yearf',yearf);
               OracleDataSet3inv.SetVariable('emp',empf);
               OracleDataSet3inv.Open;
               if OracleDataSet3inv.RecordCount<>0
                   then begin  OracleDataSet3inv.First;
                               flaginv:=OracleDataSet3invFLAGINV.AsInteger;
                        end
                   else flaginv:=0;


for k1:=1 to j do
 begin
  for k:=1 to j do
          if ((dTmp[k1].shop=dTmp[k].SHOP) and (dTmp[k1].monthyear=dTmp[k].monthyear)
               and (dTmp[k1].EXPEND=dTmp[k].EXPEND)
               and (dTmp[k1].flagcor=0) AND (k<>k1))
          then  begin

                 dTmp[k1].SUM2:=dTmp[k1].SUM2+dTmp[k].SUM2; dTmp[k1].SUM3:=dTmp[k1].SUM3+dTmp[k].SUM3;
                 dTmp[k1].SUM4:=dTmp[k1].SUM4+dTmp[k].SUM4; dTmp[k1].SUM5:=dTmp[k1].SUM5+dTmp[k].SUM5;
                 dTmp[k1].SUM22:=dTmp[k1].SUM22+dTmp[k].SUM22; dTmp[k1].SUM33:=dTmp[k1].SUM33+dTmp[k].SUM33;
                 dTmp[k1].SUM44:=dTmp[k1].SUM44+dTmp[k].SUM44; dTmp[k1].SUM55:=dTmp[k1].SUM55+dTmp[k].SUM55;

                 dTmp[k].SUM2:=0; dTmp[k].SUM3:=0;
                 dTmp[k].SUM4:=0; dTmp[k].SUM5:=0;
                 dTmp[k].SUM22:=0; dTmp[k].SUM33:=0;
                 dTmp[k].SUM44:=0; dTmp[k].SUM55:=0;
                 dTmp[k].flagcor:=1;
                 dTmp[k1].flagcor1:=dTmp[k1].flagcor1+1;
                end;
   end;

   for k:=1 to j do
      // if dTmp[k].flagcor>1 then
               begin
             if dTmp[k].sum2+dTmp[k].sum22+dTmp[k].sum3+dTmp[k].sum33+dTmp[k].sum4+dTmp[k].sum44+dTmp[k].sum5+dTmp[k].sum55<>0
                 then begin
                if dTmp[k].flagcor1<>0 then flagcorr:=1 else flagcorr:=0;
                write(myFile, 'ins emp ',IntToStr(empf), 'K ',IntToStr(K));
                write(myFile, ' shop ',IntToStr(dTmp[k].shop));
                write(myFile, ' expend ',IntToStr(dTmp[k].expend));
                write(myFile, ' flagcorr ',IntToStr(flagcorr));
//                write(myFile, ' flagcorr1 ',IntToStr(dTmp[k].flagcor1));
                write(myFile, ' flaginv ',IntToStr(flaginv));
                write(myFile, ' sum2 ',FloatToStr(dTmp[k].sum2));
                write(myFile, ' sum22 ',FloatToStr(dTmp[k].sum22));
                write(myFile, ' sum3 ',FloatToStr(dTmp[k].sum3));
                write(myFile, ' sum33 ',FloatToStr(dTmp[k].sum33));
                write(myFile, ' sum4 ',FloatToStr(dTmp[k].sum4));
                write(myFile, ' sum44 ',FloatToStr(dTmp[k].sum44));
                write(myFile, ' sum5 ',FloatToStr(dTmp[k].sum5));
                writeln(myFile, ' sum55 ',FloatToStr(dTmp[k].sum55));
                 writeln(myFile, ' monthyear ',FloatToStr(dTmp[k].monthyear));

                 // ������ � ����
                   OracleQuery1ins.SetVariable('emp',empf);
                   OracleQuery1ins.SetVariable('shop',dTmp[k].shop);
                   OracleQuery1ins.SetVariable('yearf',yearf);
                   OracleQuery1ins.SetVariable('monthf',monthf);
                   OracleQuery1ins.SetVariable('expend',dTmp[k].expend);
                   OracleQuery1ins.SetVariable('sum2',dTmp[k].sum2);
                   OracleQuery1ins.SetVariable('sum22',dTmp[k].sum22);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('flagcorr',flagcorr);
                   OracleQuery1ins.SetVariable('sum3',dTmp[k].sum3);
                   OracleQuery1ins.SetVariable('sum33',dTmp[k].sum33);
                   OracleQuery1ins.SetVariable('sum4',dTmp[k].sum4);
                   OracleQuery1ins.SetVariable('sum44',dTmp[k].sum44);
                   OracleQuery1ins.SetVariable('sum5',dTmp[k].sum5);
                   OracleQuery1ins.SetVariable('sum55',dTmp[k].sum55);
                   OracleQuery1ins.SetVariable('monthyear',dTmp[k].monthyear);
                     with OracleQuery1ins do
                      try
                          Form1.StaticText1.Caption := 'ins '+IntToStr(empf);
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


   end; //    if dTmp[k].sum2+dTmp[k].sum22+dTmp[k].sum3+dTmp[k].sum33+dTmp[k].sum4+dTmp[k].sum44+dTmp[k].sum5+dTmp[k].sum55<>0

    end;

 end; //procedure  TDataModule2.zap_baza;


procedure  TDataModule2.sozd_mas(var ind:integer);
 var k,k1,m,k2,p:integer;
     sumzpf,sumblf,sumzpf3,sumblf3,p1: real;
 begin
   for k:=1 to razmas do
     begin dTmp1[k].payprty:=0;
           dTmp1[k].SHOP :=0;
           dTmp1[k].PAY :=0;
           dTmp1[k].EXPEND:=0;
           dTmp1[k].flagvo:=0;
           dTmp1[k].SUM:=0;
           dTmp1[k].monthyear:=0;
     end;
       Application.ProcessMessages;
     Form1.StaticText1.Caption:='���� '+inttostr(empf);
      Form1.StaticText1.Refresh;

       ODSsum1.Close;
       ODSsum1.SetVariable('monthf',monthf);
       ODSsum1.SetVariable('yearf',yearf);
       ODSsum1.SetVariable('emp',empf);
       ODSsum1.SetVariable('factmonf',factmonf);
       ODSsum1.SetVariable('FACTMONR11',FACTMONR11);
       ODSsum1.Open;
       ODSsum1.First;
       if ODSsum1.RecordCount<>0
            then  for k:=1 to ODSsum1.RecordCount do
                          begin dTmp1[k].payprty:=datamodule2.ODSsum1PAYPRTY.AsInteger;
                                dTmp1[k].SHOP :=datamodule2.ODSsum1SHOPOLD.AsInteger;
                                dTmp1[k].PAY :=datamodule2.ODSsum1PAY.AsInteger;
                                dTmp1[k].EXPEND:=datamodule2.ODSsum1EXPEND.AsInteger;
                                dTmp1[k].flagvo:=datamodule2.ODSsum1FLAGVO.AsInteger;
                                dTmp1[k].SUM:=datamodule2.ODSsum1SUM.AsFloat;
                                dTmp1[k].monthyear:=DataModule2.ODSsum1YEAR.AsInteger*100+DataModule2.ODSsum1month.AsInteger;
                                odssum1.Next;
                           end;
        k1:=ODSsum1.RecordCount;
        ODSsum1.Close;

    ////  sum2
         for m:=FACTMONR11 to year*100+month do
                 begin
                    sumzpf:=0; sumblf:=0;

                    if (m<>factmonf) and (strtoint(copy(inttostr(m),5,2))<13)
                       then begin
                   OQ2sumzpf.SetVariable('empf',empf);
                   OQ2sumzpf.SetVariable('month_t',(strtoint(copy(inttostr(m),5,2))));
                   OQ2sumzpf.SetVariable('year_t',(strtoint(copy(inttostr(m),1,4))));
                   OQ2sumzpf.SetVariable('factmonf',factmonf);
                     with OQ2sumzpf do
                      try
                          Form1.StaticText1.Caption := 'Query2sumzpf';
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;
                   sumzpf:=Field(0);
                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;

                   OQ2sumblf.SetVariable('empf',empf);
                   OQ2sumblf.SetVariable('month_t',(strtoint(copy(inttostr(m),5,2))));
                   OQ2sumblf.SetVariable('year_t',(strtoint(copy(inttostr(m),1,4))));
                   OQ2sumblf.SetVariable('factmonf',factmonf);
                     with OQ2sumblf do
                            try
                          Form1.StaticText1.Caption := 'Query2sumblf';
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;
                   sumblf:=Field(0);
                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;
                   if  (sumzpf=0) or (sumblf=0) then sumzpf:=0;

                   if  (sumzpf<>0) and (sumblf<>0) then
                        if ((sumzpf>0) and (sumblf>0)) or ((sumzpf<0) and (sumblf<0))
                                then  sumzpf:=0;

                  if  sumzpf<>0
                   then begin
                         ODSsum2.Close;
                         ODSsum2.SetVariable('month_t',(strtoint(copy(inttostr(m),5,2))));
                         ODSsum2.SetVariable('year_t',(strtoint(copy(inttostr(m),1,4))));
                         ODSsum2.SetVariable('empf',empf);
                         ODSsum2.SetVariable('factmonf',factmonf);
                         ODSsum2.Open;
                         ODSsum2.First;
                        if ODSsum2.RecordCount<>0
                            then  for k:=1 to ODSsum2.RecordCount do
                                      begin dTmp1[k1+k].payprty:=datamodule2.ODSsum2PAYPRTY.AsInteger;
                                            dTmp1[k1+k].SHOP :=datamodule2.ODSsum2SHOPOLD.AsInteger;
                                            dTmp1[k1+k].PAY :=datamodule2.ODSsum2PAY.AsInteger;
                                            dTmp1[k1+k].EXPEND:=datamodule2.ODSsum2EXPEND.AsInteger;
                                            dTmp1[k1+k].flagvo:=datamodule2.ODSsum2FLAGVO.AsInteger;
                                            dTmp1[k1+k].SUM:=datamodule2.ODSsum2SUM.AsFloat;
                                            dTmp1[k1+k].monthyear:=DataModule2.ODSsum2YEAR.AsInteger*100+DataModule2.ODSsum2month.AsInteger;
                                            odssum2.Next;
                                      end;
                        k1:=k1+ODSsum2.RecordCount;
                        ODSsum2.Close;
                         end; //     if  sumzpf<>0
                      end;  //  if (j<>factmonr) and (strtoint(copy(inttostr(j),5,2))<13)
                       end;      //            for j:=201211 to year*100+month do

                   ////     sumzp2



                  ////     sumzp3
                      if factmonf>=FACTMONR11
                        then begin
                         ODSsumzpf3.Close;
                         ODSsumzpf3.SetVariable('monthf',monthf);
                         ODSsumzpf3.SetVariable('yearf',yearf);
                         ODSsumzpf3.SetVariable('empf',empf);
                         ODSsumzpf3.SetVariable('factmonf',factmonf);
                         ODSsumzpf3.Open;
                         ODSsumzpf3.First;
                         sumzpf3:=0;
                        if ODSsumzpf3.RecordCount<>0
                            then  for k:=1 to ODSsumzpf3.RecordCount do
                                    begin
                                  sumzpf3:=datamodule2.ODSsumzpf3SUMZPF3.AsFloat;

                     sumblf3:=0;
                    OQ2sumblf.SetVariable('empf',empf);
                    OQ2sumblf.SetVariable('month_t',monthf);
                    OQ2sumblf.SetVariable('year_t',yearf);
                    OQ2sumblf.SetVariable('factmonf',datamodule2.ODSsumzpf3FACTMON.AsInteger);
                     with OQ2sumblf do
                      try
                          Form1.StaticText1.Caption := 'Querysumblf';
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;
                   sumblf3:=Field(0);
                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;

                   if (sumblf3=0) or (sumzpf3=0)
                     then //sumzp3:=0;//
                        sumzpf3:=sumzpf3;

                  if (sumblf3<>0) and (sumzpf3<>0)
                     then if ((sumblf3<0) and (sumzpf3<0))
                              or ((sumblf3>0) and (sumzpf3>0))
                              then sumzpf3:=sumzpf3
                              else sumzpf3:=0;

                  if sumzpf3<>0
                    then begin
                         ODSsum2.Close;
                         ODSsum2.SetVariable('month_t',monthf);
                         ODSsum2.SetVariable('year_t',yearf);
                         ODSsum2.SetVariable('empf',empf);
                         ODSsum2.SetVariable('factmonf',datamodule2.ODSsumzpf3FACTMON.AsInteger);
                         ODSsum2.Open;
                         ODSsum2.First;
                        if ODSsum2.RecordCount<>0
                            then  for m:=1 to ODSsum2.RecordCount do
                                      begin dTmp1[k1+m].payprty:=datamodule2.ODSsum2PAYPRTY.AsInteger;
                                            dTmp1[k1+m].SHOP :=datamodule2.ODSsum2SHOPOLD.AsInteger;
                                            dTmp1[k1+m].PAY :=datamodule2.ODSsum2PAY.AsInteger;
                                            dTmp1[k1+m].EXPEND:=datamodule2.ODSsum2EXPEND.AsInteger;
                                            dTmp1[k1+m].flagvo:=datamodule2.ODSsum2FLAGVO.AsInteger;
                                            dTmp1[k1+m].SUM:=datamodule2.ODSsum2SUM.AsFloat;
                                            dTmp1[k1+m].monthyear:=DataModule2.ODSsum2YEAR.AsInteger*100+DataModule2.ODSsum2month.AsInteger;
                                            odssum2.Next;
                                      end;
                        k1:=k1+ODSsum2.RecordCount;
                        ODSsum2.Close;
                        end; //     if  sumzpf<>0
                         ODSsumzpf3.next;
                          end;  //for j:=1 to odsszpl2.RecordCount do
              ODSsumzpf3.Close;
                             end; // if factmonf>=201211
                 ////     sumzp3

                 /// ����������
                         ODSbol.Close;
                         ODSbol.SetVariable('empf',empf);
                         ODSbol.SetVariable('factmonf',factmonf);
                         ODSbol.Open;
                         ODSbol.First;
                        if ODSbol.RecordCount<>0
                            then  for m:=1 to ODSbol.RecordCount do
                                      begin dTmp1[k1+m].payprty:=datamodule2.ODSbolPAYPRTY.AsInteger;
                                            dTmp1[k1+m].SHOP :=datamodule2.ODSbolSHOPOLD.AsInteger;
                                            dTmp1[k1+m].PAY :=datamodule2.ODSbolPAY.AsInteger;
                                            dTmp1[k1+m].EXPEND:=datamodule2.ODSbolEXPEND.AsInteger;
                                            dTmp1[k1+m].flagvo:=datamodule2.ODSbolFLAGVO.AsInteger;
                                            dTmp1[k1+m].SUM:=datamodule2.ODSbolSUM.AsFloat;
                                            dTmp1[k1+m].monthyear:=DataModule2.ODSbolYEAR.AsInteger*100+DataModule2.ODSbolmonth.AsInteger;
                                            odsbol.Next;
                                      end;
                        k1:=k1+ODSbol.RecordCount;
                        ODSbol.Close;

                 /// ����������

             {     for k:=1 to k1 do
                    begin
                       write(myFile, 'emp ',IntToStr(empf) );
                       write(myFile, ' factmon ',floatToStr(factmonf) );
                       write(myFile, ' flagvo ',IntToStr(dTmp1[k].flagvo));
                write(myFile, ' payprty ',IntToStr(dTmp1[k].payprty));
                write(myFile, ' expend ',IntToStr(dTmp1[k].expend));
                write(myFile, ' pay ',IntToStr(dTmp1[k].pay));
                write(myFile, ' shop ',IntToStr(dTmp1[k].shop));
                write(myFile, ' sum ',FloatToStr(dTmp1[k].sum));
                   writeln (myFile, ' ');
                    end;
                    }
                ind:=k1;

end; //procedure  TDataModule2.sozd_mas;

 end.
