object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 303
  Top = 124
  Height = 379
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
    Left = 696
    Top = 88
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      '       SELECT DEPT.SHOPOLD SHOP,'
      '              PAYSUM.PAY# PAY,'
      '              PAYSUM.EXPEND# EXPEND,'
      '              PAYSUM.EMP# EMP,'
      '              PAYSUM.SUM SUM,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) FLAGVO,'
      '             decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) PAYPRTY'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  MONTH = :month AND'
      '              YEAR  = :year  AND'
      '              (PAYSUM.EMP# BETWEEN :empmin AND :empmax)  AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      
        '              PAYSUM.PAY# = PAYTBL.PAY# AND  PAYSUM.DEPT# = DEPT' +
        '.DEPT#(+) and'
      
        '              ( NVL(BUDGTAX8,'#39' '#39') ='#39'*'#39' or NVL(BUDGTAX0,'#39' '#39') ='#39'*'#39 +
        ' OR'
      '               NVL(BUDGTAX7,'#39' '#39') ='#39'*'#39' or '
      ''
      
        '                (  ( NVL(BUDGTAX9,'#39' '#39') ='#39'*'#39' and PAYSUM.PAY# not ' +
        'in (245,246,247) ) OR'
      '                      ( PAYSUM.PAY# in (245,246,247) '
      
        '                        and  ( PAYSUM.year * 100 +PAYSUM.month )' +
        ' >= 201307 '
      '                        and  FACTMON >= 201307 '
      '                       )  )  ) '
      '             '
      '       ORDER  BY 4,6,7,3,2,1'
      ''
      ''
      ''
      ''
      ' ')
    Variables.Data = {
      0300000004000000060000003A4D4F4E54480300000000000000000000000500
      00003A59454152030000000000000000000000070000003A454D504D494E0300
      00000000000000000000070000003A454D504D41580300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000700000003000000454D500100000000000400000053484F50010000
      0000000300000050415901000000000006000000455850454E44010000000000
      0300000053554D01000000000006000000464C4147564F010000000000070000
      0050415950525459010000000000}
    Cursor = crSQLWait
    Session = OracleSession1
    Left = 40
    Top = 88
    object OracleDataSet1SHOP: TIntegerField
      FieldName = 'SHOP'
    end
    object OracleDataSet1PAY: TIntegerField
      FieldName = 'PAY'
      Required = True
    end
    object OracleDataSet1EXPEND: TIntegerField
      FieldName = 'EXPEND'
    end
    object OracleDataSet1EMP: TIntegerField
      FieldName = 'EMP'
      Required = True
    end
    object OracleDataSet1SUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object OracleDataSet1FLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
    object OracleDataSet1PAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
  end
  object OracleQuery1del: TOracleQuery
    SQL.Strings = (
      'DELETE FROM PAYRECJUR'
      '              WHERE  YEAR = :year'
      '                AND  MONTH= :month  AND'
      '              (EMP# BETWEEN :empmin AND :empmax)'
      ''
      ' ')
    Session = OracleSession1
    Variables.Data = {
      0300000004000000070000003A454D504D494E03000000000000000000000007
      0000003A454D504D4158030000000000000000000000060000003A4D4F4E5448
      030000000000000000000000050000003A594541520300000000000000000000
      00}
    Left = 160
    Top = 16
  end
  object OracleQuery1ins: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO PAYRECJUR   VALUES (:emp,:shop,:year,:month,:expend,' +
        ':sum2,:sum22,'
      
        '                                :flaginv,:flagcorr,to_char(SYSDA' +
        'TE,'#39'DD/MM/YYYY HH24:MI '#39') || USER,'
      
        '                                 :sum3,:sum4,:sum5,:sum33,:sum44' +
        ',:sum55,:monthyear)'
      ''
      '')
    Session = OracleSession1
    Variables.Data = {
      0300000010000000040000003A454D5003000000000000000000000005000000
      3A53484F50030000000000000000000000050000003A59454152030000000000
      000000000000060000003A4D4F4E544803000000000000000000000007000000
      3A455850454E44030000000000000000000000050000003A53554D3204000000
      0000000000000000060000003A53554D32320400000000000000000000000800
      00003A464C4147494E56030000000000000000000000090000003A464C414743
      4F5252030000000000000000000000050000003A53554D330400000000000000
      00000000050000003A53554D34040000000000000000000000050000003A5355
      4D35040000000000000000000000060000003A53554D33330400000000000000
      00000000060000003A53554D3434040000000000000000000000060000003A53
      554D35350400000000000000000000000A0000003A4D4F4E5448594541520300
      00000000000000000000}
    Left = 152
    Top = 80
  end
  object OracleQueryinv: TOracleQuery
    SQL.Strings = (
      'SELECT DECODE(INVAL,'#39'*'#39',1,0) flaginv'
      '                FROM EMPLOY'
      '               WHERE emp#=:emp')
    Session = OracleSession1
    Variables.Data = {0300000001000000040000003A454D50030000000000000000000000}
    Left = 152
    Top = 160
  end
  object OracleDataSetinv: TOracleDataSet
    SQL.Strings = (
      'SELECT DECODE(INVAL,'#39'*'#39',1,0) flaginv'
      '                FROM EMPLOY'
      '               WHERE emp#=:emp'
      '')
    Variables.Data = {0300000001000000040000003A454D50030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {040000000100000007000000464C4147494E56010000000000}
    Session = OracleSession1
    Left = 48
    Top = 160
    object OracleDataSetinvFLAGINV: TFloatField
      FieldName = 'FLAGINV'
    end
  end
end
