object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 238
  Top = 420
  Height = 380
  Width = 906
  object OQins: TOracleQuery
    SQL.Strings = (
      'INSERT INTO EMPDVTPF'
      
        '               (PHONEOFF1,EMP#,DVT#,YEAR,MONTH,DVTDAYS,DVTDAYS_A' +
        'LL)'
      
        '       VALUES (:phoneOld,:empOld,:dvtOld,:year,:month,:dvtdays,:' +
        'dvtdays)'
      '')
    Session = OracleSession1
    Variables.Data = {
      0300000006000000090000003A50484F4E454F4C440500000000000000000000
      00070000003A454D504F4C44030000000000000000000000070000003A445654
      4F4C44030000000000000000000000050000003A594541520300000000000000
      00000000060000003A4D4F4E5448030000000000000000000000080000003A44
      565444415953030000000000000000000000}
    Left = 48
    Top = 152
  end
  object OQdel: TOracleQuery
    SQL.Strings = (
      
        'DELETE FROM EMPDVTPF WHERE  (DVT#=:dvt or 0=:dvt) and  emp# betw' +
        'een :empmin and :empmax')
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
  object ODSemp: TOracleDataSet
    SQL.Strings = (
      '     SELECT   PHONEOFF1,'
      '                 EMP#,'
      '                 DVT#,'
      '                 DVTDATE1,'
      '                 DVTDATE2'
      ''
      '        FROM     EMPDVTST '
      
        '        WHERE    EMP# between :EMPMIN and :EMPMAX and (DVT#=:dvt' +
        ' or 0=:dvt)'
      '        ORDER BY DVT#, PHONEOFF1, EMP#, DVTDATE1'
      ''
      ''
      '')
    Variables.Data = {
      0300000003000000070000003A454D504D494E03000000000000000000000007
      0000003A454D504D4158030000000000000000000000040000003A4456540300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000004000000454D50230100000000000900000050484F4E454F
      4646310100000000000400000044565423010000000000080000004456544441
      544531010000000000080000004456544441544532010000000000}
    Session = OracleSession1
    Left = 152
    Top = 32
    object ODSempPHONEOFF1: TStringField
      FieldName = 'PHONEOFF1'
      Required = True
      Size = 10
    end
    object ODSempEMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSempDVT: TIntegerField
      FieldName = 'DVT#'
      Required = True
    end
    object ODSempDVTDATE1: TDateTimeField
      FieldName = 'DVTDATE1'
      Required = True
    end
    object ODSempDVTDATE2: TDateTimeField
      FieldName = 'DVTDATE2'
      Required = True
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
end
