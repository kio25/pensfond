object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 238
  Top = 420
  Height = 380
  Width = 906
  object OQins: TOracleQuery
    SQL.Strings = (
      'INSERT INTO EMPDVTst'
      '               (PHONEOFF1,EMP#,DVT#,dvtdate1,dvtdate2)'
      
        '       VALUES (:phoneoff,:emp,:dvt,to_date(:dvtdate1,'#39'dd.mm.yyyy' +
        #39'),to_date(:dvtdate2,'#39'dd.mm.yyyy'#39'))'
      '')
    Session = OracleSession1
    Variables.Data = {
      0300000005000000090000003A50484F4E454F46460500000000000000000000
      00040000003A454D50030000000000000000000000040000003A445654030000
      000000000000000000090000003A445654444154453105000000000000000000
      0000090000003A4456544441544532050000000000000000000000}
    Left = 48
    Top = 152
  end
  object OQdel: TOracleQuery
    SQL.Strings = (
      
        'DELETE FROM EMPDVTst WHERE  DVT#=:dvt  and  emp# between :empmin' +
        ' and :empmax')
    Session = OracleSession1
    Variables.Data = {
      0300000003000000040000003A44565403000000000000000000000007000000
      3A454D504D494E030000000000000000000000070000003A454D504D41580300
      00000000000000000000}
    Left = 48
    Top = 80
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory, ldConnectAs]
    HistoryIniFile = 'c:\history.ini'
    Left = 696
    Top = 24
  end
  object OracleSession1: TOracleSession
    Left = 696
    Top = 88
  end
  object ODSdata: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '                NVL(TO_CHAR(JOINDATE,'#39'DD.MM.YYYY'#39'),'#39' '#39') datemin,'
      '                NVL(TO_CHAR(DSCHDATE,'#39'DD.MM.YYYY'#39'),'#39' '#39') datemax'
      '        '
      '          FROM  RRTEMPIN'
      '          WHERE EMP# =0 AND PHONEOFF1 = '#39'0000000000'#39)
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000444154454D494E01000000000007000000444154
      454D4158010000000000}
    Session = OracleSession1
    Left = 48
    Top = 24
    object ODSdataDATEMIN: TStringField
      FieldName = 'DATEMIN'
      Size = 10
    end
    object ODSdataDATEMAX: TStringField
      FieldName = 'DATEMAX'
      Size = 10
    end
  end
  object ODSdvt: TOracleDataSet
    SQL.Strings = (
      'select distinct dvt# from empdvtst order by dvt#')
    QBEDefinition.QBEFieldDefs = {04000000010000000400000044565423010000000000}
    Session = OracleSession1
    Left = 248
    Top = 32
    object ODSdvtDVT: TIntegerField
      FieldName = 'DVT#'
      Required = True
    end
  end
  object ODSemp12: TOracleDataSet
    SQL.Strings = (
      '     SELECT   DVT#,'
      '                 RRTEMPIN.EMP#,'
      '                 PHONEOFF1,'
      
        '                 GREATEST(DVTDATE1,TO_DATE( :DATEMIN ,'#39'DD.MM.YYY' +
        'Y'#39'))  DVTMIN,'
      
        '                 LEAST(DVTDATE2,TO_DATE( :DATEMAX ,'#39'DD.MM.YYYY'#39')' +
        ','
      
        '                 NVL(RRTEMPIN.DSCHDATE,TO_DATE(:DATEMAX,'#39'DD.MM.Y' +
        'YYY'#39')))  DVTMAX'
      '        FROM     EMPDVT, RRTEMPIN, empsick'
      ''
      
        '        WHERE    (EMPDVT.DVT# = 12 OR (EMPDVT.DVT# = 14 AND SCKT' +
        'YPE = 8 )) AND   /* '#1073#1099#1083#1086' SCKTYPE = 6 */'
      '                 RRTEMPIN.EMP# between :empmin and :empmax and'
      
        '                 DVTDATE1 <= TO_DATE( :DATEMAX ,'#39'DD.MM.YYYY'#39') AN' +
        'D'
      
        '                 DVTDATE2 >= TO_DATE( :DATEMIN ,'#39'DD.MM.YYYY'#39') AN' +
        'D'
      '                 RRTEMPIN.EMP#=EMPDVT.EMP# AND'
      '                 EMPDVT.EMP# = EMPSICK.EMP# (+) AND'
      '                 EMPDVT.DVTDATE1 = EMPSICK.SCKDATE1 (+) '
      
        '                 ORDER BY RRTEMPIN.EMP#, DVT#, PHONEOFF1, DVTDAT' +
        'E1, DVTDATE2'
      ''
      '')
    Variables.Data = {
      0300000004000000080000003A444154454D494E050000000000000000000000
      080000003A444154454D4158050000000000000000000000070000003A454D50
      4D494E030000000000000000000000070000003A454D504D4158030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000004000000454D50230100000000000900000050484F4E454F
      4646310100000000000400000044565423010000000000060000004456544D49
      4E010000000000060000004456544D4158010000000000}
    Session = OracleSession1
    Left = 152
    Top = 32
    object ODSemp12DVT: TIntegerField
      FieldName = 'DVT#'
      Required = True
    end
    object ODSemp12EMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSemp12PHONEOFF1: TStringField
      FieldName = 'PHONEOFF1'
      Size = 10
    end
    object ODSemp12DVTMIN: TDateTimeField
      FieldName = 'DVTMIN'
    end
    object ODSemp12DVTMAX: TDateTimeField
      FieldName = 'DVTMAX'
    end
  end
  object ODSemp14: TOracleDataSet
    SQL.Strings = (
      '     SELECT   RRTEMPIN.EMP#,'
      '                 PHONEOFF1,'
      '                 SCKDATE1  DVTmin,'
      
        '                 LEAST( SCKDATE2 ,NVL(RRTEMPIN.DSCHDATE,TO_DATE(' +
        ' '#39'31.12.2999'#39','#39'DD.MM.YYYY'#39')))  DVTmax'
      '                 '
      '        FROM     RRTEMPIN, EMPSICK'
      '        WHERE    SCKTYPE != 8               /* '#1085#1077' '#1076#1077#1082#1088#1077#1090#1085#1099#1081' */'
      '                 AND SUMFLAG = :M '
      
        '                 and sckdate1 > to_date( :DATEMIN , '#39'dd.mm.yyyy'#39 +
        ') - 183'
      '                 AND'
      '                 RRTEMPIN.EMP#= EMPSICK.EMP# '
      '                 AND RRTEMPIN.EMP# between :EMPMIN and :EMPMAX'
      '        ORDER BY RRTEMPIN.EMP#,SCKDATE1'
      ''
      '')
    Variables.Data = {
      0300000004000000080000003A444154454D494E050000000000000000000000
      070000003A454D504D494E030000000000000000000000070000003A454D504D
      4158030000000000000000000000020000003A4D030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000004000000454D50230100000000000900000050484F4E454F
      464631010000000000060000004456544D494E01000000000006000000445654
      4D4158010000000000}
    Session = OracleSession1
    Left = 152
    Top = 104
    object ODSemp14EMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSemp14PHONEOFF1: TStringField
      FieldName = 'PHONEOFF1'
      Size = 10
    end
    object ODSemp14DVTMIN: TDateTimeField
      FieldName = 'DVTMIN'
      Required = True
    end
    object ODSemp14DVTMAX: TDateTimeField
      FieldName = 'DVTMAX'
    end
  end
  object ODSemp14d: TOracleDataSet
    SQL.Strings = (
      '     SELECT   RRTEMPIN.EMP#,'
      '                 PHONEOFF1,'
      '                 SCKDATE1  DVTmin,'
      
        '                 LEAST( SCKDATE2 ,NVL(RRTEMPIN.DSCHDATE,TO_DATE(' +
        ' '#39'31.12.2999'#39','#39'DD.MM.YYYY'#39')))  DVTmax'
      '                 '
      '        FROM     RRTEMPIN, EMPSICK'
      '        WHERE    SCKTYPE = 8               /*  '#1076#1077#1082#1088#1077#1090#1085#1099#1081' */'
      '                 AND SUMFLAG = :M '
      
        '                 and sckdate1 > to_date( :DATEMIN , '#39'dd.mm.yyyy'#39 +
        ') - 183'
      '                 AND'
      '                 RRTEMPIN.EMP#= EMPSICK.EMP# '
      '                 AND RRTEMPIN.EMP# between :EMPMIN and :EMPMAX'
      '        ORDER BY RRTEMPIN.EMP#,SCKDATE1'
      ''
      '')
    Variables.Data = {
      0300000004000000080000003A444154454D494E050000000000000000000000
      070000003A454D504D494E030000000000000000000000070000003A454D504D
      4158030000000000000000000000020000003A4D030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000004000000454D50230100000000000900000050484F4E454F
      464631010000000000060000004456544D494E01000000000006000000445654
      4D4158010000000000}
    Session = OracleSession1
    Left = 152
    Top = 168
    object ODSemp14dEMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSemp14dPHONEOFF1: TStringField
      FieldName = 'PHONEOFF1'
      Size = 10
    end
    object ODSemp14dDVTMIN: TDateTimeField
      FieldName = 'DVTMIN'
      Required = True
    end
    object ODSemp14dDVTMAX: TDateTimeField
      FieldName = 'DVTMAX'
    end
  end
end
