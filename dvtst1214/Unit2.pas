{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}


unit Unit2;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData,Windows,Dialogs ,
  Messages,  Variants,  Controls, Forms,
  StdCtrls,  ComCtrls;


const
       ShortDateFormat='dd.mm.yyyy';

type
  TDataModule2 = class(TDataModule)
    OQins: TOracleQuery;
    OQdel: TOracleQuery;
    OracleLogon1: TOracleLogon;
    OracleSession1: TOracleSession;
    ODSdata: TOracleDataSet;
    ODSdataDATEMIN: TStringField;
    ODSdataDATEMAX: TStringField;
    ODSdvt: TOracleDataSet;
    ODSdvtDVT: TIntegerField;
    ODSemp12: TOracleDataSet;
    ODSemp12DVT: TIntegerField;
    ODSemp12EMP: TIntegerField;
    ODSemp12PHONEOFF1: TStringField;
    ODSemp12DVTMIN: TDateTimeField;
    ODSemp12DVTMAX: TDateTimeField;
    ODSemp14: TOracleDataSet;
    ODSemp14EMP: TIntegerField;
    ODSemp14PHONEOFF1: TStringField;
    ODSemp14DVTMIN: TDateTimeField;
    ODSemp14DVTMAX: TDateTimeField;
    ODSemp14d: TOracleDataSet;
    ODSemp14dEMP: TIntegerField;
    ODSemp14dPHONEOFF1: TStringField;
    ODSemp14dDVTMIN: TDateTimeField;
    ODSemp14dDVTMAX: TDateTimeField;
  private
//    procedure dvtdays;
    { Private declarations }
  public
   procedure raschet14;
   procedure raschet14d;
   procedure raschet12;

    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
  //dvtdays0:array[1..13,1..10] of integer;
  //year1:integer;


implementation
 uses unit1;
{$R *.dfm}


procedure TDataModule2.raschet12;
  var i,j,k: integer;
     DVTDATE1,DVTDATE2:TDateTime;
      empold,dvtold:integer;
      phoneOld:string;

    begin
    form1.ProgressBar1.Min;

    oqdel.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
    oqdel.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
    oqdel.SetVariable('dvt',12);

     with OQdel do
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
      datamodule2.OracleSession1.Commit;

  

  datamodule2.ODSemp12.Close;
  ODSemp12.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
  ODSemp12.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
  ODSemp12.SetVariable('datemin',trim(form1.datemin_.Text));
  ODSemp12.SetVariable('datemax',trim(form1.datemax_.Text));


  datamodule2.ODSemp12.Open;
  datamodule2.ODSemp12.First;
  if datamodule2.ODSemp12.RecordCount<>0
    then begin
         form1.ProgressBar1.max := ODSemp12.RecordCount;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:='/'+Inttostr(ODSemp12.RecordCount);
         Form1.StaticText3.Repaint;
         empOld:= datamodule2.ODSemp12EMP.AsInteger;
 //        dvtOld:= datamodule2.ODSemp12DVT.AsInteger;
          phoneOld:=trim(datamodule2.ODSemp12PHONEOFF1.AsString);
          dvtdate1:=strtodate(datamodule2.ODSemp12DVTMIN.AsString);
          dvtdate2:=strtodate(datamodule2.ODSemp12DVTMAX.AsString);
           datamodule2.ODSemp12.Next;
             for k:=2 to datamodule2.ODSemp12.RecordCount do
              begin

                  if (empOld<>datamodule2.ODSemp12EMP.AsInteger) or
                   (trim(phoneOld)<>trim(datamodule2.ODSemp12PHONEOFF1.AsString))
                  // or (dvtdate2+1<>strtodate(datamodule2.ODSemp12DVTMIN.AsString))
                    then
                         begin  //2

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',12);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp12EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp12PHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp12DVTMIN.AsString);
                           dvtdate2:=strtodate(datamodule2.ODSemp12DVTMAX.AsString);


                         end      //2

                    else   begin //3
                  if //(empOld=datamodule2.ODSemp12EMP.AsInteger) and
                   //(trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
                   (dvtdate2+1<>strtodate(datamodule2.ODSemp12DVTMIN.AsString))
                      then
                         begin  //21

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',12);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp12EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp12PHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp12DVTMIN.asstring);
                           dvtdate2:=strtodate(datamodule2.ODSemp12DVTMAX.asstring);


                        end      //21

                 else
//                 if (empOld=datamodule2.ODSemp12EMP.AsInteger) and
//                   (trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
//                    (dvtdate2+1=strtodate(datamodule2.ODSemp12DVTMIN.asstring))
//                      then
                        begin

                           empOld:= datamodule2.ODSemp12EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp12PHONEOFF1.AsString);
                           dvtdate1:=dvtdate1;
                           dvtdate2:=strtodate(datamodule2.ODSemp12DVTMAX.asstring);
                        end;

                               end; //3
                   datamodule2.ODSemp12.Next;
                   Form1.ProgressBar1.StepIt;
                   Form1.StaticText2.Caption:=Inttostr(k);
                   Form1.StaticText2.Repaint;
                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp12EMP.AsInteger);
                //  Form1.StaticText5.Caption:=Inttostr(datamodule2.ODSempDVT.AsInteger);
                   Form1.StaticText4.Repaint;




               end; //  for i:=2 to datamodule2.ODSemp.RecordCount do

                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp12EMP.AsInteger);

                   Form1.StaticText4.Repaint;


                                  //последн€€ запись

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',12);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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




                     datamodule2.OracleSession1.Commit;




         end;  //  if datamodule2.ODSemp.RecordCount<>0 then


                datamodule2.odsemp12.close;



end;


procedure TDataModule2.raschet14;
 var i,j,k: integer;
     DVTDATE1,DVTDATE2:TDateTime;
      empold,dvtold:integer;
      phoneOld:string;

    begin
    form1.ProgressBar1.Min;

    oqdel.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
    oqdel.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
    oqdel.SetVariable('dvt',14);

     with OQdel do
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
      datamodule2.OracleSession1.Commit;



  DecodeDate(strtodate(trim(form1.datemax_.Text)), Year, Month, Day);
  datamodule2.ODSemp14.Close;
  ODSemp14.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
  ODSemp14.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
  ODSemp14.SetVariable('datemin',trim(form1.datemin_.Text));
  ODSemp14.SetVariable('m',Month);


  datamodule2.ODSemp14.Open;
  datamodule2.ODSemp14.First;
  if datamodule2.ODSemp14.RecordCount<>0
    then begin
         form1.ProgressBar1.max := ODSemp14.RecordCount;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:='/'+Inttostr(ODSemp14.RecordCount);
         Form1.StaticText3.Repaint;
         empOld:= datamodule2.ODSemp14EMP.AsInteger;
 //        dvtOld:= datamodule2.ODSemp12DVT.AsInteger;
          phoneOld:=trim(datamodule2.ODSemp14PHONEOFF1.AsString);
          dvtdate1:=strtodate(datamodule2.ODSemp14DVTMIN.AsString);
          dvtdate2:=strtodate(datamodule2.ODSemp14DVTMAX.AsString);
           datamodule2.ODSemp14.Next;
             for k:=2 to datamodule2.ODSemp14.RecordCount do
              begin

                  if (empOld<>datamodule2.ODSemp14EMP.AsInteger) or
                   (trim(phoneOld)<>trim(datamodule2.ODSemp14PHONEOFF1.AsString))
                  // or (dvtdate2+1<>strtodate(datamodule2.ODSemp12DVTMIN.AsString))
                    then
                         begin  //2

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',14);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp14EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14PHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp14DVTMIN.AsString);
                           dvtdate2:=strtodate(datamodule2.ODSemp14DVTMAX.AsString);


                         end      //2

                    else   begin //3
                  if //(empOld=datamodule2.ODSemp12EMP.AsInteger) and
                   //(trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
                   (dvtdate2+1<>strtodate(datamodule2.ODSemp14DVTMIN.AsString))
                      then
                         begin  //21

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',14);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp14EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14PHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp14DVTMIN.asstring);
                           dvtdate2:=strtodate(datamodule2.ODSemp14DVTMAX.asstring);


                        end      //21

                 else
//                 if (empOld=datamodule2.ODSemp12EMP.AsInteger) and
//                   (trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
//                    (dvtdate2+1=strtodate(datamodule2.ODSemp12DVTMIN.asstring))
//                      then
                        begin

                           empOld:= datamodule2.ODSemp14EMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14PHONEOFF1.AsString);
                           dvtdate1:=dvtdate1;
                           dvtdate2:=strtodate(datamodule2.ODSemp14DVTMAX.asstring);
                        end;

                               end; //3
                   datamodule2.ODSemp14.Next;
                   Form1.ProgressBar1.StepIt;
                   Form1.StaticText2.Caption:=Inttostr(k);
                   Form1.StaticText2.Repaint;
                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp14EMP.AsInteger);
                //  Form1.StaticText5.Caption:=Inttostr(datamodule2.ODSempDVT.AsInteger);
                   Form1.StaticText4.Repaint;




               end; //  for i:=2 to datamodule2.ODSemp.RecordCount do

                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp14EMP.AsInteger);

                   Form1.StaticText4.Repaint;


                                  //последн€€ запись

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',14);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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




                     datamodule2.OracleSession1.Commit;




         end;  //  if datamodule2.ODSemp.RecordCount<>0 then


    datamodule2.odsemp14.close;


end;


///декретные

procedure TDataModule2.raschet14d;
 var i,j,k: integer;
     DVTDATE1,DVTDATE2:TDateTime;
      empold,dvtold:integer;
      phoneOld:string;

    begin
    form1.ProgressBar1.Min;

    oqdel.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
    oqdel.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
    oqdel.SetVariable('dvt',114);

     with OQdel do
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
      datamodule2.OracleSession1.Commit;



  DecodeDate(strtodate(trim(form1.datemax_.Text)), Year, Month, Day);
  datamodule2.ODSemp14d.Close;
  ODSemp14d.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
  ODSemp14d.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
  ODSemp14d.SetVariable('datemin',trim(form1.datemin_.Text));
  ODSemp14d.SetVariable('m',Month);


  datamodule2.ODSemp14d.Open;
  datamodule2.ODSemp14d.First;
  if datamodule2.ODSemp14d.RecordCount<>0
    then begin
         form1.ProgressBar1.max := ODSemp14d.RecordCount;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:='/'+Inttostr(ODSemp14d.RecordCount);
         Form1.StaticText3.Repaint;
         empOld:= datamodule2.ODSemp14dEMP.AsInteger;
 //        dvtOld:= datamodule2.ODSemp12DVT.AsInteger;
          phoneOld:=trim(datamodule2.ODSemp14dPHONEOFF1.AsString);
          dvtdate1:=strtodate(datamodule2.ODSemp14dDVTMIN.AsString);
          dvtdate2:=strtodate(datamodule2.ODSemp14DdVTMAX.AsString);
           datamodule2.ODSemp14d.Next;
             for k:=2 to datamodule2.ODSemp14d.RecordCount do
              begin

                  if (empOld<>datamodule2.ODSemp14dEMP.AsInteger) or
                   (trim(phoneOld)<>trim(datamodule2.ODSemp14dPHONEOFF1.AsString))
                  // or (dvtdate2+1<>strtodate(datamodule2.ODSemp12DVTMIN.AsString))
                    then
                         begin  //2

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',114);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp14dEMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14dPHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp14dDVTMIN.AsString);
                           dvtdate2:=strtodate(datamodule2.ODSemp14dDVTMAX.AsString);


                         end      //2

                    else   begin //3
                  if //(empOld=datamodule2.ODSemp12EMP.AsInteger) and
                   //(trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
                   (dvtdate2+1<>strtodate(datamodule2.ODSemp14dDVTMIN.AsString))
                      then
                         begin  //21

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',114);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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

                           empOld:= datamodule2.ODSemp14dEMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14dPHONEOFF1.AsString);
                           dvtdate1:=strtodate(datamodule2.ODSemp14dDVTMIN.asstring);
                           dvtdate2:=strtodate(datamodule2.ODSemp14dDVTMAX.asstring);


                        end      //21

                 else
//                 if (empOld=datamodule2.ODSemp12EMP.AsInteger) and
//                   (trim(phoneOld)=trim(datamodule2.ODSemp12PHONEOFF1.AsString)) and
//                    (dvtdate2+1=strtodate(datamodule2.ODSemp12DVTMIN.asstring))
//                      then
                        begin

                           empOld:= datamodule2.ODSemp14dEMP.AsInteger;
                           phoneOld:=trim(datamodule2.ODSemp14dPHONEOFF1.AsString);
                           dvtdate1:=dvtdate1;
                           dvtdate2:=strtodate(datamodule2.ODSemp14dDVTMAX.asstring);
                        end;

                               end; //3
                   datamodule2.ODSemp14d.Next;
                   Form1.ProgressBar1.StepIt;
                   Form1.StaticText2.Caption:=Inttostr(k);
                   Form1.StaticText2.Repaint;
                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp14dEMP.AsInteger);
                //  Form1.StaticText5.Caption:=Inttostr(datamodule2.ODSempDVT.AsInteger);
                   Form1.StaticText4.Repaint;




               end; //  for i:=2 to datamodule2.ODSemp.RecordCount do

                   Form1.StaticText4.Caption:=Inttostr(datamodule2.ODSemp14dEMP.AsInteger);

                   Form1.StaticText4.Repaint;


                                  //последн€€ запись

                         OQins.SetVariable('phoneoff',phoneOld);
                         OQins.SetVariable('emp',empOld);
                         OQins.SetVariable('dvt',114);
                         OQins.SetVariable('dvtdate1',datetostr(dvtdate1));
                         OQins.SetVariable('dvtdate2',datetostr(dvtdate2));

                       with OQins do
                      try
                          Form1.StaticText1.Caption := 'ins';
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




                     datamodule2.OracleSession1.Commit;




         end;  //  if datamodule2.ODSemp.RecordCount<>0 then


    datamodule2.odsemp14d.close;


end;


end.
