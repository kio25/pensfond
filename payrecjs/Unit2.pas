{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData,Windows,Dialogs ,
  Messages,  Variants,  Controls, Math,
  StdCtrls,  ComCtrls;
 const razmas=60;
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
    OracleDataSet1SHOP: TIntegerField;
    OracleDataSet1PAY: TIntegerField;
    OracleDataSet1EXPEND: TIntegerField;
    OracleDataSet1EMP: TIntegerField;
    OracleDataSet1SUM: TFloatField;
    OracleDataSet1FLAGVO: TFloatField;
    OracleDataSet1PAYPRTY: TFloatField;
    OracleQueryinv: TOracleQuery;
    OracleDataSetinv: TOracleDataSet;
    OracleDataSetinvFLAGINV: TFloatField;


  private

    { Private declarations }
   procedure zap_baza;
   procedure zap_mas;
   procedure obnul_mas;
  public
   procedure raschet1;

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


  end;

var
  DataModule2: TDataModule2;
  empf,j,expendf: integer;
  summax,SumMaxU,sumpr,sumex:real;
//  EMP,empf, SHOP,PAY,EXPEND,PAYPRTY,j: integer;
//  sum,summax,SumMaxU:real;
    myFile : TextFile;
  date1: TDateTime;
  dTmp : array [1..razmas] of TEmp;
  pr_summax:integer;
//  i,flaginv,emp,pay: integer;
//  date1: TDateTime;
//  summax,sum1,sumt1,sgpd,szplmax,szpl,st_blfss :real;
//  sbol,sblfss,sbolm,sblfssm,st_zpl,st_gpd,st_bl :real;
 //  myFile : TextFile;


implementation
 uses unit1;

{$R *.dfm}




procedure TDataModule2.raschet1;

   var
      i: integer;
{      kf,summax,summin,KFzpl,KFzpli,KFgpd,KFbol,KFblfss:real;
      RUzpl, RUgpd, RUbol, RUblfss: real;
      date1: TDateTime;
      EMP, YEARz, MONTHz, SHOP, EXPEND, FLAGINV: integer;
      sum,SUM2,SUM3,SUM4,SUM5,SUM22,SUM33,SUM44,SUM55: real;
      }


    begin
 form1.ProgressBar1.Min;
//form1.ProgressBar1.StepIt;
     // ������� ������� ���� Test.txt ��� ������
  AssignFile(myFile, 'c:\payrecjs.lst');
  ReWrite(myFile);
  writeln(myFile,'year '+Form1.Edit1.Text+' month '+Form1.Edit2.Text+' empmin '+form1.Edit4.Text+' empmax '+form1.Edit5.Text  );
  obnul_mas; //��������� ������� ��� emp

  OracleDataSet1.Close;
  OracleDataSet1.SetVariable('month',month);
  OracleDataSet1.SetVariable('year',year);
  OracleDataSet1.SetVariable('empmin',empmin);
  OracleDataSet1.SetVariable('empmax',empmax);
  OracleDataSet1.Open;
  OracleDataSet1.First;


  if OracleDataSet1.RecordCount<>0
     then  begin
               form1.ProgressBar1.Max := OracleDataSet1.RecordCount;
               Form1.StaticText2.Caption:='0';
               Form1.StaticText2.Repaint;
               Form1.StaticText3.Caption:=Inttostr(OracleDataSet1.RecordCount);
               Form1.StaticText3.Repaint;


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
               Form1.StaticText1.Caption:='Del';

              // summax   kf=541
              date1:=StrToDate('01.'+IntToStr(month)+'.'+IntToStr(year));
              ODS2_koeff.Close;
              ODS2_koeff.SetVariable('date1',date1);
              ODS2_koeff.SetVariable('kf',541);
              ODS2_koeff.Open;
              summax:= ODS2_koeff.FieldByName('koef').Value;
              ODS2_koeff.Close;
              writeln(myFile, 'summmax=',FloatToStr(summax));

              //empf:=0;//������ ������
              empf:=OracleDataSet1Emp.AsInteger;
              j:=1;
              SumMaxU:=0;
              sumpr:=0;
              for i:=1 to OracleDataSet1.RecordCount do
               begin
                   if empf=OracleDataSet1Emp.AsInteger
                     then //����������� ������ �� emp
                          zap_mas
                     else begin//����� emp
                          zap_baza;// ������ � ����
                           obnul_mas;
                           empf:=OracleDataSet1Emp.AsInteger;

                           j:=1;
                           SumMaxU:=0;
                           sumpr:=0;

                           zap_mas;
                          end;

                  OracleDataSet1.Next;
                  form1.ProgressBar1.StepIt;
                  Form1.StaticText2.Caption:=Inttostr(i);
                  Form1.StaticText2.Repaint;

               end; // for i:=1 to OracleDataSet1.RecordCount do
                zap_baza; // ��������� ������

           end   //if OracleDataSet1.RecordCount<>0 then begin
     else     pr_zap:=1; //showmessage('��� ������ �� �������.');

    OracleDataSet1.Close;
    CloseFile(myFile);

    end;  //procedure TDataModule2.raschet1;

procedure TDataModule2.zap_mas;  //������ � ������ ��� emp

 begin
      dTmp[j].shop:= OracleDataSet1SHOP.AsInteger;
      dTmp[j].PAY:=OracleDataSet1PAY.AsInteger;
      dTmp[j].EXPEND:=OracleDataSet1EXPEND.AsInteger;
      dTmp[j].flagvo:=OracleDataSet1FLAGVO.AsInteger;
      dTmp[j].SUM1:=OracleDataSet1SUM.AsFloat;
      sumpr:=sumpr+dTmp[j].SUM1;
      summaxU:=summax-sumpr;
      if summaxU>=0
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
       j:=j+1;
       form1.StaticText1.Caption:='R '+IntToStr(empf)
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
   end   ;
   pr_summax:=0; //������� ���������� summax
 end;


procedure  TDataModule2.zap_baza;     //������ � ���� ��� emp
  var k,k1:integer;
//      SHOP, EXPEND,
     flaginv,flagcorr: integer;
//      SUM2,SUM3,SUM4,SUM5,SUM22,SUM33,SUM44,SUM55: real;

begin
            {       OracleQueryinv.SetVariable('emp',empf);
                   with OracleQueryinv do
                      try
                          Form1.StaticText1.Caption := 'inv '+IntToStr(empf);
                       try
                          Execute;
                   except
                       on E:EOracleError do begin
                       ShowMessage(E.Message);
                       exit;
                       end;
                       end;
                       flaginv:=Field(0);
                   except
                       on E:EOracleError do ShowMessage(E.Message);
                   end;
               }
               OracleDataSetinv.Close;
               OracleDataSetinv.SetVariable('emp',empf);
               OracleDataSetinv.Open;
               if OracleDataSetinv.RecordCount<>0
                   then begin  OracleDataSetinv.First;
                               flaginv:=OracleDataSetinvFLAGINV.AsInteger;
                        end
                   else flaginv:=0;



               Form1.StaticText1.Caption:='inv '+IntToStr(empf);

 for k1:=1 to j do
 begin
  for k:=1 to j do
          if ((dTmp[k1].shop=dTmp[k].SHOP)
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
                write(myFile, 'ins emp ',IntToStr(empf));
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

                 // ������ � ����
                   OracleQuery1ins.SetVariable('emp',empf);
                   OracleQuery1ins.SetVariable('shop',dTmp[k].shop);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
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


               {//-----------------------------------------------
    SHOP:=dTmp[1].SHOP; EXPEND:=dTmp[1].EXPEND; flagcorr:=0;
    SUM2:=0; SUM3:=0; SUM4:=0; SUM5:=0;
    SUM22:=0; SUM33:=0; SUM44:=0; SUM55:=0;

  for k:=1 to j do
    begin
      if ((shop=dTmp[k].SHOP) and (EXPEND=dTmp[k].EXPEND))
          then  begin
                 SUM2:=SUM2+dTmp[k].SUM2; SUM3:=SUM3+dTmp[k].SUM3;
                 SUM4:=SUM4+dTmp[k].SUM4; SUM5:=SUM5+dTmp[k].SUM5;
                 SUM22:=SUM22+dTmp[k].SUM22; SUM33:=SUM33+dTmp[k].SUM33;
                 SUM44:=SUM44+dTmp[k].SUM44; SUM55:=SUM55+dTmp[k].SUM55;
                 flagcorr:=flagcorr+1;
                end //then
           else  begin

                if flagcorr>1 then flagcorr:=1 else flagcorr:=0;
                write(myFile, '������� emp ',IntToStr(empf));
                write(myFile, ' shop ',IntToStr(shop));
                write(myFile, ' expend ',IntToStr(expend));
                write(myFile, ' flagcorr ',IntToStr(flagcorr));
                write(myFile, ' flaginv ',IntToStr(flaginv));
                write(myFile, ' sum2 ',FloatToStr(sum2));
                write(myFile, ' sum22 ',FloatToStr(sum22));
                write(myFile, ' sum3 ',FloatToStr(sum3));
                write(myFile, ' sum33 ',FloatToStr(sum33));
                write(myFile, ' sum4 ',FloatToStr(sum4));
                write(myFile, ' sum44 ',FloatToStr(sum44));
                write(myFile, ' sum5 ',FloatToStr(sum5));
                writeln(myFile, ' sum55 ',FloatToStr(sum55));

                 // ������ � ����
                   OracleQuery1ins.SetVariable('emp',empf);
                   OracleQuery1ins.SetVariable('shop',shop);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('month',month);
                   OracleQuery1ins.SetVariable('year',year);
                   OracleQuery1ins.SetVariable('expend',expend);
                   OracleQuery1ins.SetVariable('sum2',sum2);
                   OracleQuery1ins.SetVariable('sum22',sum22);
                   OracleQuery1ins.SetVariable('flaginv',flaginv);
                   OracleQuery1ins.SetVariable('flagcorr',flagcorr);
                   OracleQuery1ins.SetVariable('sum3',sum3);
                   OracleQuery1ins.SetVariable('sum33',sum33);
                   OracleQuery1ins.SetVariable('sum4',sum4);
                   OracleQuery1ins.SetVariable('sum44',sum44);
                   OracleQuery1ins.SetVariable('sum5',sum5);
                   OracleQuery1ins.SetVariable('sum55',sum55);
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

                //���������� ���� ��� ����� �������� SHOP � EXPEND
                SHOP:=dTmp[k].SHOP; EXPEND:=dTmp[k].EXPEND; flagcorr:=1;
                SUM2:=dTmp[k].SUM2; SUM3:=dTmp[k].SUM3; SUM4:=dTmp[k].SUM4; SUM5:=dTmp[k].SUM5;
                SUM22:=dTmp[k].SUM22; SUM33:=dTmp[k].SUM33; SUM44:=dTmp[k].SUM44; SUM55:=dTmp[k].SUM55;


                 end; //else

    end;  //   for k:=1 to j do
    -------------------------------------------}
                          OracleSession1.Commit;
 end; //procedure  TDataModule2.zap_baza;

 end.
