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
    ODSemp: TOracleDataSet;
    ODSdvt: TOracleDataSet;
    ODSdvtDVT: TIntegerField;
    ODSempPHONEOFF1: TStringField;
    ODSempEMP: TIntegerField;
    ODSempDVT: TIntegerField;
    ODSempDVTDATE1: TDateTimeField;
    ODSempDVTDATE2: TDateTimeField;
  private
    procedure dvtdays;
    { Private declarations }
  public
   procedure raschet1;

    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
  dvtdays0:array[1..13,1..10] of integer;
  year1:integer;


implementation
 uses unit1;
{$R *.dfm}

procedure TDataModule2.dvtdays;
    var i,j,k: integer;
     // begdate,enddate,
     pdate :TDateTime;
      year_e, month_e,day_e,year_b,month_b,day_b, monthe1,dayb1,dayb2, monthb1,daye1,daye2,year_p, month_p : word;


 begin

            DecodeDate(strtodate(datamodule2.ODSempDVTDATE1.AsString),year_b,month_b,day_b);
            DecodeDate(strtodate(datamodule2.ODSempDVTDATE2.AsString),year_e,month_e,day_e);

            k:=0;
            for j:=1 to 10 do
             if dvtdays0[13,j]<>0
                 then  begin
                      if dvtdays0[13,j]=year_b
                          then k:=j
                          else k:=k+1;
                        end;
          //  if k=1 then dvtdays0[13,k]:=year_b; // первая запись по таб и неявке

  // заполнение массива dvtdays0
                 //     showmessage('1');

            for j:=year_b to year_e do
              begin
                   // k:=j-year_b+1;
                   if  dvtdays0[13,k]<>j
                      then begin k:=k+1;
                          dvtdays0[13,k]:=j; // присвоение года
                          end;
                    if j=year_b
                        then begin
                                 monthb1:=month_b;
                                 dayb1:=day_b;
                             end
                         else begin
                                 monthb1:=1;
                                 dayb1:=1;
                              end;
                    if j=year_e
                        then begin
                                 monthe1:=month_e;
                                 daye1:=day_e;
                             end
                         else begin
                                 monthe1:=12;
                                 daye1:=31;
                              end;
                    for i:=monthb1 to monthe1 do
                       begin
                            if i=monthb1
                              then dayb2:=dayb1
                              else dayb2:=1;
                            if i=monthe1
                              then daye2:=daye1
                              else begin
                                   pdate:=EncodeDate(j,i+1,1);
                                   DecodeDate(pdate-1, Year_p, Month_p, Daye2);
                                   end;
                              dvtdays0[i,k]:=dvtdays0[i,k]+daye2-dayb2+1;
                       end; //for i:=monthb1 to monthe1 do



              end;  //            for j:=1 year_b to year_e do

                       {       DecodeDate(begdate, Year_b, Month_b, Day_b);
                              year1:=year_b;
                              DecodeDate(enddate, Year_e, Month_e, Day_e);
                              if month_e=month_b
                                then  dvtdays0[month_e]:=dvtdays0[month_e]+day_e-day_b+1
                                else  begin //1
                                      dvtdays0[month_e]:=dvtdays0[month_e]+day_e;     // кол-во дней в последний месяц
                                 for j:=month_b to month_e-1 do
                                          begin
                                            pdate:=EncodeDate(Year_b,j,1);
                                            DecodeDate(IncMonth(pdate,1)-1, Year_p, Month_p, Day_p);
                                            if month_b=month_p
                                               then dvtdays0[month_p]:=dvtdays0[month_p]+day_p-day_b+1
                                               else dvtdays0[month_p]:=dvtdays0[month_p]+day_p;
                                          end;
                                        end //1



                  }

 end;



procedure TDataModule2.raschet1;
  var i,j,k: integer;

      empold,dvtold:integer;
      phoneOld:string;

    begin
    form1.ProgressBar1.Min;

    oqdel.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
    oqdel.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
    if form1.sdvt.Text='*'
       then oqdel.SetVariable('dvt',0)
       else oqdel.SetVariable('dvt',strtoint(trim(form1.sdvt.Text)));
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

  for i:=1 to 13 do
   for j:=1 to 10 do dvtdays0[i,j]:=0;

  datamodule2.ODSemp.Close;
  ODSemp.SetVariable('empmin',strtoint(trim(form1.empmin_.Text)));
  ODSemp.SetVariable('empmax',strtoint(trim(form1.empmax_.Text)));
   if form1.sdvt.Text='*'
       then ODSemp.SetVariable('dvt',0)
       else ODSemp.SetVariable('dvt',strtoint(trim(form1.sdvt.Text)));
  datamodule2.ODSemp.Open;
  datamodule2.ODSemp.First;
  if datamodule2.ODSemp.RecordCount<>0
    then begin
         form1.ProgressBar1.max := ODSemp.RecordCount;
         Form1.StaticText2.Caption:='0';
         Form1.StaticText2.Repaint;
         Form1.StaticText3.Caption:='/'+Inttostr(ODSemp.RecordCount);
         Form1.StaticText3.Repaint;
             empOld:= datamodule2.ODSempEMP.AsInteger;
             dvtOld:= datamodule2.ODSempDVT.AsInteger;
             phoneOld:=trim(datamodule2.ODSempPHONEOFF1.AsString);
             for k:=1 to datamodule2.ODSemp.RecordCount do
              begin

                  if (empOld<>datamodule2.ODSempEMP.AsInteger) or
                   (dvtOld<>datamodule2.ODSempDVT.AsInteger) or
                   (trim(phoneOld)<>trim(datamodule2.ODSempPHONEOFF1.AsString))
                    then
                         begin  //2

                          for j:=1 to 10   do
                           for i:=1 to 12 do
                            begin
                          if   dvtdays0[i,j]<>0 then begin
                         OQins.SetVariable('phoneOld',phoneOld);
                         OQins.SetVariable('empOld',empOld);
                         OQins.SetVariable('dvtOld',dvtOld);
                         OQins.SetVariable('year',dvtdays0[13,j]);
                         OQins.SetVariable('month',i);
                         OQins.SetVariable('dvtdays',dvtdays0[i,j]);


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


                           end;


                      end;


                           empOld:= datamodule2.ODSempEMP.AsInteger;
                           dvtOld:= datamodule2.ODSempDVT.AsInteger;
                           phoneOld:=trim(datamodule2.ODSempPHONEOFF1.AsString);

                             for i:=1 to 13 do
                               for j:=1 to 10 do dvtdays0[i,j]:=0;
                             datamodule2.OracleSession1.Commit;
                         end;      //2

                    dvtdays;

                   datamodule2.ODSemp.Next;
                   Form1.ProgressBar1.StepIt;
                   Form1.StaticText2.Caption:=Inttostr(k);
                   Form1.StaticText2.Repaint;
                   Form1.StaticText4.Caption:=Inttostr(empold);
                   Form1.StaticText4.Repaint;




               end; //  for i:=1 to datamodule2.ODSemp.RecordCount do



                                  //последняя запись
                          for j:=1 to 10  do
                           for i:=1 to 12 do
                            begin
                          if   dvtdays0[i,j]<>0 then begin
                         OQins.SetVariable('phoneOld',phoneOld);
                         OQins.SetVariable('empOld',empOld);
                         OQins.SetVariable('dvtOld',dvtOld);
                         OQins.SetVariable('year',dvtdays0[13,j]);
                         OQins.SetVariable('month',i);
                         OQins.SetVariable('dvtdays',dvtdays0[i,j]);


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


                           end;


                      end;

                     datamodule2.OracleSession1.Commit;




         end;  //  if datamodule2.ODSemp.RecordCount<>0 then


          datamodule2.ODSemp.close;



end;



end.
