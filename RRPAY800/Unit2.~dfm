object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 287
  Top = 114
  Height = 380
  Width = 776
  object ODS2_koeff: TOracleDataSet
    SQL.Strings = (
      'SELECT NVL(NVAL,0) koef,INDATE '
      #9' FROM   SYSINDEX                                     '
      #9' WHERE  IND#   = :kf    AND                         '
      #9'        ROWNUM = 1       AND                         '
      #9'        INDATE = (SELECT MAX(INDATE)                 '
      #9#9'        FROM   SYSINDEX                      '
      #9#9'        WHERE  IND# = :kf AND               '
      #9#9#9'     INDATE <= :date1)               '
      '')
    Variables.Data = {
      0300000002000000060000003A44415445310C00000000000000000000000300
      00003A4B46030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000006000000494E44415445010000000000040000004B4F4546
      010000000000}
    Cursor = crSQLWait
    Session = OracleSession1
    Left = 32
    Top = 24
    object ODS2_koeffKOEF: TFloatField
      FieldName = 'KOEF'
    end
    object ODS2_koeffINDATE: TDateTimeField
      FieldName = 'INDATE'
      Required = True
    end
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory, ldConnectAs]
    HistoryIniFile = 'c:\history.ini'
    Left = 696
    Top = 24
  end
  object OracleSession1: TOracleSession
    RollbackOnDisconnect = True
    Left = 688
    Top = 88
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'SELECT EMP# emp, YEAR, MONTH, SHOP, EXPEND# expend, NVL(SUM2,0) ' +
        'sum2, NVL(SUM3,0) sum3,NVL(SUM4,0) sum4, '
      
        '       NVL(SUM5,0) sum5, FLAGINV,NVL(SUM22,0) sum22, NVL(SUM33,0' +
        ') sum33,NVL(SUM44,0) sum44, NVL(SUM55,0) sum55,'
      'nvl(monthyear,0) monthyear'
      '            FROM PAYRECJUR'
      
        '            WHERE (EMP# BETWEEN nvl(:empmin,0) AND nvl(:empmax,0' +
        '))'
      '             AND MONTH = :month'
      '             AND YEAR=:year'
      '             ORDER BY EMP# ')
    Variables.Data = {
      0300000004000000070000003A454D504D494E03000000000000000000000007
      0000003A454D504D4158030000000000000000000000060000003A4D4F4E5448
      030000000000000000000000050000003A594541520300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000003000000454D500100000000000400000059454152010000
      000000050000004D4F4E54480100000000000400000053484F50010000000000
      06000000455850454E440100000000000400000053554D320100000000000400
      000053554D330100000000000400000053554D34010000000000040000005355
      4D3501000000000007000000464C4147494E560100000000000500000053554D
      32320100000000000500000053554D33330100000000000500000053554D3434
      0100000000000500000053554D3535010000000000090000004D4F4E54485945
      4152010000000000}
    Cursor = crSQLWait
    Session = OracleSession1
    Left = 40
    Top = 88
    object OracleDataSet1EMP: TIntegerField
      FieldName = 'EMP'
      Required = True
    end
    object OracleDataSet1YEAR: TIntegerField
      FieldName = 'YEAR'
      Required = True
    end
    object OracleDataSet1MONTH: TIntegerField
      FieldName = 'MONTH'
      Required = True
    end
    object OracleDataSet1SHOP: TIntegerField
      FieldName = 'SHOP'
    end
    object OracleDataSet1EXPEND: TIntegerField
      FieldName = 'EXPEND'
    end
    object OracleDataSet1SUM2: TFloatField
      FieldName = 'SUM2'
    end
    object OracleDataSet1SUM3: TFloatField
      FieldName = 'SUM3'
    end
    object OracleDataSet1SUM4: TFloatField
      FieldName = 'SUM4'
    end
    object OracleDataSet1SUM5: TFloatField
      FieldName = 'SUM5'
    end
    object OracleDataSet1FLAGINV: TIntegerField
      FieldName = 'FLAGINV'
    end
    object OracleDataSet1SUM22: TFloatField
      FieldName = 'SUM22'
    end
    object OracleDataSet1SUM33: TFloatField
      FieldName = 'SUM33'
    end
    object OracleDataSet1SUM44: TFloatField
      FieldName = 'SUM44'
    end
    object OracleDataSet1SUM55: TFloatField
      FieldName = 'SUM55'
    end
    object OracleDataSet1MONTHYEAR: TFloatField
      FieldName = 'MONTHYEAR'
    end
  end
  object OracleQuery1del: TOracleQuery
    SQL.Strings = (
      ' DELETE  FROM RECALCJUR'
      
        '              WHERE (EMP# BETWEEN nvl(:empmin,0) AND nvl(:empmax' +
        ',0)) AND'
      '                    MONTH= :month AND'
      '                    YEAR = :year')
    Session = OracleSession1
    Variables.Data = {
      0300000004000000070000003A454D504D494E03000000000000000000000007
      0000003A454D504D4158030000000000000000000000060000003A4D4F4E5448
      030000000000000000000000050000003A594541520300000000000000000000
      00}
    Cursor = crSQLWait
    Left = 160
    Top = 16
  end
  object OracleQuery1ins: TOracleQuery
    SQL.Strings = (
      'INSERT    INTO RECALCJUR'
      
        '            VALUES (:emp, :pay, :yearz, :monthz,:year*100+:month' +
        ', :expend, :sum, '
      
        '                  :flaginv, to_char(SYSDATE,'#39'DD/MM/YYYY HH24:MI ' +
        #39') || USER, :shop)')
    Session = OracleSession1
    Variables.Data = {
      030000000A000000040000003A454D5003000000000000000000000004000000
      3A504159030000000000000000000000060000003A594541525A030000000000
      000000000000070000003A4D4F4E54485A030000000000000000000000050000
      003A59454152030000000000000000000000060000003A4D4F4E544803000000
      0000000000000000070000003A455850454E4403000000000000000000000004
      0000003A53554D040000000000000000000000080000003A464C4147494E5603
      0000000000000000000000050000003A53484F50030000000000000000000000}
    Cursor = crSQLWait
    Left = 152
    Top = 80
  end
end
