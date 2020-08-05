object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 232
  Top = 204
  Height = 527
  Width = 924
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
    Left = 696
    Top = 88
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      '       SELECT DISTINCT PAYSUM.EMP# emp,'
      '              PAYSUM.FACTMON factmon'
      '       FROM   PAYSUM'
      '       WHERE  '
      
        '              PAYSUM.EMP# BETWEEN nvl(:empmin,0) AND nvl(:empmax' +
        ',0) AND'
      '              YEAR  = :year  AND MONTH=:month '
      '       ORDER  BY PAYSUM.EMP#,PAYSUM.FACTMON'
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
      040000000200000003000000454D5001000000000007000000464143544D4F4E
      010000000000}
    Cursor = crSQLWait
    Session = OracleSession1
    Left = 40
    Top = 88
    object OracleDataSet1EMP: TIntegerField
      FieldName = 'EMP'
      Required = True
    end
    object OracleDataSet1FACTMON: TIntegerField
      FieldName = 'FACTMON'
      Required = True
    end
  end
  object OracleQuery1del: TOracleQuery
    SQL.Strings = (
      'DELETE FROM PAYRECJUR'
      '              WHERE  YEAR = :yearf'
      '                AND  MONTH= :monthf  AND'
      '               EMP#= :empf'
      ''
      ' ')
    Session = OracleSession1
    Variables.Data = {
      0300000003000000060000003A59454152460300000000000000000000000700
      00003A4D4F4E544846030000000000000000000000050000003A454D50460300
      00000000000000000000}
    Left = 160
    Top = 16
  end
  object OracleQuery1ins: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO PAYRECJUR   VALUES (:emp,:shop,:yearf,:monthf,:expen' +
        'd,:sum2,:sum22,'
      
        '                                :flaginv,:flagcorr,to_char(SYSDA' +
        'TE,'#39'DD/MM/YYYY HH24:MI '#39') || USER,'
      
        '                                 :sum3,:sum4,:sum5,:sum33,:sum44' +
        ',:sum55)'
      ''
      '')
    Session = OracleSession1
    Variables.Data = {
      030000000F000000040000003A454D5003000000000000000000000005000000
      3A53484F50030000000000000000000000060000003A59454152460300000000
      00000000000000070000003A4D4F4E5448460300000000000000000000000700
      00003A455850454E44030000000000000000000000050000003A53554D320400
      00000000000000000000060000003A53554D3232040000000000000000000000
      080000003A464C4147494E56030000000000000000000000090000003A464C41
      47434F5252030000000000000000000000050000003A53554D33040000000000
      000000000000050000003A53554D34040000000000000000000000050000003A
      53554D35040000000000000000000000060000003A53554D3333040000000000
      000000000000060000003A53554D343404000000000000000000000006000000
      3A53554D3535040000000000000000000000}
    Left = 152
    Top = 80
  end
  object OracleQueryinv: TOracleQuery
    SQL.Strings = (
      'SELECT NVL(FLAGINV,0) flaginv'
      '                FROM PFTSUMN'
      '               WHERE EMP# = :emp  AND'
      '               MONTH= :monthf AND'
      '                YEAR = :yearf')
    Session = OracleSession1
    Variables.Data = {
      0300000003000000040000003A454D5003000000000000000000000007000000
      3A4D4F4E544846030000000000000000000000060000003A5945415246030000
      000000000000000000}
    Left = 152
    Top = 160
  end
  object OracleDataSet2_old: TOracleDataSet
    SQL.Strings = (
      '       SELECT decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD shop,'
      '              PAYSUM.PAY# pay,'
      '              PAYSUM.EXPEND# expend,'
      '              PAYSUM.SUM sum,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  YEAR = :yearf AND MONTH=:monthf AND'
      '              PAYSUM.EMP# =:emp AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      '              (NVL(PAYTBL.BUDGTAX0,'#39' '#39') = '#39'*'#39' OR'
      '              NVL(PAYTBL.BUDGTAX8,'#39' '#39') = '#39'*'#39') AND'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+) '
      '      UNION ALL'
      '       SELECT decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD shop,'
      '              PAYSUM.PAY# pay,'
      '              PAYSUM.EXPEND# expend,'
      '              PAYSUM.SUM sum,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  FACTMON = :yearf*100+:monthf AND'
      '              PAYSUM.EMP# =:emp AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      
        '              (NVL(PAYTBL.BUDGTAX7,'#39' '#39') = '#39'*'#39' OR NVL(PAYTBL.BUDG' +
        'TAX9,'#39' '#39') = '#39'*'#39')AND'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+) '
      '       ORDER  BY 6,1,4,3,2')
    Variables.Data = {
      0300000003000000060000003A59454152460300000000000000000000000700
      00003A4D4F4E544846030000000000000000000000040000003A454D50030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000504159505254590100000000000400000053484F
      500100000000000300000050415901000000000006000000455850454E440100
      000000000300000053554D01000000000006000000464C4147564F0100000000
      00}
    Session = OracleSession1
    Left = 568
    Top = 224
    object OracleDataSet2_oldPAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object OracleDataSet2_oldSHOP: TFloatField
      FieldName = 'SHOP'
    end
    object OracleDataSet2_oldPAY: TFloatField
      FieldName = 'PAY'
    end
    object OracleDataSet2_oldEXPEND: TFloatField
      FieldName = 'EXPEND'
    end
    object OracleDataSet2_oldSUM: TFloatField
      FieldName = 'SUM'
    end
    object OracleDataSet2_oldFLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object OracleQuery2ins0: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO PAYRECJUR (emp#,expend#,flaginv,shop,month,year,dbus' +
        'er)'
      
        'select emp#,expend#,flaginv,rshop,month,year,to_char(SYSDATE,'#39'DD' +
        '/MM/YYYY HH24:MI '#39') || USER'
      'from recalcjur'
      'where month=:monthf'
      'and year=:yearf'
      'and EMP# = :emp '
      'and pay# IN (800,806,808,804)'
      'minus'
      
        'select emp#,expend#,flaginv,shop,month,year,to_char(SYSDATE,'#39'DD/' +
        'MM/YYYY HH24:MI '#39') || USER'
      'from payrecjur'
      'where month=: monthf'
      'and  year=:yearf'
      'and  EMP#=:emp')
    Session = OracleSession1
    Variables.Data = {
      0300000003000000070000003A4D4F4E54484603000000000000000000000006
      0000003A5945415246030000000000000000000000040000003A454D50030000
      000000000000000000}
    Left = 264
    Top = 88
  end
  object OracleDataSet3inv: TOracleDataSet
    SQL.Strings = (
      'SELECT NVL(FLAGINV,0) flaginv'
      '                FROM PFTSUMN'
      '               WHERE EMP# = :emp  AND'
      '               MONTH= :monthf AND'
      '                YEAR = :yearf'
      '')
    Variables.Data = {
      0300000003000000040000003A454D5003000000000000000000000007000000
      3A4D4F4E544846030000000000000000000000060000003A5945415246030000
      000000000000000000}
    QBEDefinition.QBEFieldDefs = {040000000100000007000000464C4147494E56010000000000}
    Session = OracleSession1
    Left = 344
    Top = 32
    object OracleDataSet3invFLAGINV: TFloatField
      FieldName = 'FLAGINV'
    end
  end
  object OracleDataSet3_old2012: TOracleDataSet
    SQL.Strings = (
      ' SELECT decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD shop,'
      '              PAYSUM.PAY# pay,'
      '              PAYSUM.EXPEND# expend,'
      '              PAYSUM.SUM sum,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  '
      '              PAYSUM.EMP# =:emp AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      '              '
      '              (NVL(PAYTBL.BUDGTAX0,'#39' '#39') = '#39'*'#39' OR'
      '              NVL(PAYTBL.BUDGTAX8,'#39' '#39') = '#39'*'#39'  or'
      '              NVL(PAYTBL.BUDGTAX7,'#39' '#39') = '#39'*'#39' OR   --01.2012'
      '              NVL(PAYTBL.BUDGTAX9,'#39' '#39') = '#39'*'#39'      --01.2012'
      '              ) AND'
      
        '              PAYSUM.FACTMON = :yearf*100+:monthf AND PAYSUM.yea' +
        'r>2011  and  --01.2012'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+) '
      '       ORDER  BY 6,1,4,3,2'
      '')
    Variables.Data = {
      0300000003000000060000003A59454152460300000004000000DC0700000000
      0000070000003A4D4F4E54484603000000040000000200000000000000040000
      003A454D5003000000040000006F7A000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000504159505254590100000000000400000053484F
      500100000000000300000050415901000000000006000000455850454E440100
      000000000300000053554D01000000000006000000464C4147564F0100000000
      00}
    Session = OracleSession1
    Left = 592
    Top = 320
    object OracleDataSet3_old2012PAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object OracleDataSet3_old2012SHOP: TIntegerField
      FieldName = 'SHOP'
    end
    object OracleDataSet3_old2012PAY: TIntegerField
      FieldName = 'PAY'
      Required = True
    end
    object OracleDataSet3_old2012EXPEND: TIntegerField
      FieldName = 'EXPEND'
    end
    object OracleDataSet3_old2012SUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object OracleDataSet3_old2012FLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      '   SELECT decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD shop,'
      '              PAYSUM.PAY# pay,'
      '              PAYSUM.EXPEND# expend,'
      '              PAYSUM.SUM sum,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  ((YEAR = :yearf AND MONTH=:monthf) OR'
      '               (YEAR>2011 AND FACTMON=:yearf*100+:monthf)'
      '                )'
      '              AND'
      ''
      '              PAYSUM.EMP# =:emp AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      '           --   NVL(PAYTBL.BUDGTAX1,'#39' '#39') = '#39'*'#39' AND'
      '              (NVL(PAYTBL.BUDGTAX0,'#39' '#39') = '#39'*'#39' OR'
      '              NVL(PAYTBL.BUDGTAX8,'#39' '#39') = '#39'*'#39') AND'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+) '
      '      UNION ALL'
      '       SELECT decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD shop,'
      '              PAYSUM.PAY# pay,'
      '              PAYSUM.EXPEND# expend,'
      '              PAYSUM.SUM sum,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '       FROM   PAYSUM,DEPT,PAYTBL,PAY'
      '       WHERE  FACTMON = :yearf*100+:monthf AND'
      '              PAYSUM.EMP# =:emp AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      
        '              PAYSUM.PAY# = PAYTBL.PAY# AND PAYSUM.DEPT# = DEPT.' +
        'DEPT#(+) and'
      '            --  NVL(PAYTBL.BUDGTAX1,'#39' '#39') = '#39'*'#39' AND'
      '              (NVL(PAYTBL.BUDGTAX7,'#39' '#39') = '#39'*'#39' OR '
      ''
      
        '                    (  ( NVL(BUDGTAX9,'#39' '#39') ='#39'*'#39' and PAYSUM.PAY# ' +
        'not in (245,246,247) ) OR'
      '                      ( PAYSUM.PAY# in (245,246,247) '
      
        '                        and  ( PAYSUM.year * 100 +PAYSUM.month )' +
        ' >= 201307 '
      '                        and  FACTMON >= 201307 '
      '                       )  )  '
      '                 '
      '                      '
      ' )'
      '              '
      '       ORDER  BY 6,1,4,3,2')
    Variables.Data = {
      0300000003000000060000003A59454152460300000004000000DC0700000000
      0000070000003A4D4F4E54484603000000040000000200000000000000040000
      003A454D5003000000040000006F7A000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000504159505254590100000000000400000053484F
      500100000000000300000050415901000000000006000000455850454E440100
      000000000300000053554D01000000000006000000464C4147564F0100000000
      00}
    Session = OracleSession1
    Left = 40
    Top = 152
    object OracleDataSet2PAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object OracleDataSet2SHOP: TFloatField
      FieldName = 'SHOP'
    end
    object OracleDataSet2PAY: TFloatField
      FieldName = 'PAY'
    end
    object OracleDataSet2EXPEND: TFloatField
      FieldName = 'EXPEND'
    end
    object OracleDataSet2SUM: TFloatField
      FieldName = 'SUM'
    end
    object OracleDataSet2FLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object ODSsum1: TOracleDataSet
    SQL.Strings = (
      '    SELECT   decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD,                                '
      '              PAYSUM.PAY#,'
      '              PAYSUM.EXPEND#,'
      '              PAYSUM.SUM,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '    FROM      PAYSUM,DEPT,PAYTBL,PAY'
      '    WHERE     FACTMON =:FACTMONF AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      '              PAYSUM.EMP# = :EMP AND'
      '              nvl(BUDGTAX8,'#39' '#39') = '#39'*'#39' and'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+)  AND ('
      ''
      '       ( MONTH = :MONTHF AND                      '
      '           YEAR = :YEARF ) OR'
      ''
      '       ( ( YEAR * 100 + MONTH ) < :FACTMONR11 AND'
      '         ( YEAR * 100 + MONTH ) != :FACTMONF  ) OR '
      ''
      '       ( ( YEAR * 100 + MONTH ) >= :FACTMONR11 AND '
      '         ( YEAR * 100 + MONTH ) != :FACTMONF  AND'
      '           PAYSUM.PAY# IN'
      
        '               ( SELECT TBL# FROM SYSTBL WHERE TBLID ='#39'PF_T7_K3'#39 +
        ' ) )    '
      '                                                )')
    Variables.Data = {
      0300000005000000090000003A464143544D4F4E460300000000000000000000
      00040000003A454D50030000000000000000000000070000003A4D4F4E544846
      030000000000000000000000060000003A594541524603000000000000000000
      00000B0000003A464143544D4F4E523131030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000504159505254590100000000000700000053484F
      504F4C4401000000000004000000504159230100000000000700000045585045
      4E44230100000000000300000053554D01000000000006000000464C4147564F
      010000000000}
    Session = OracleSession1
    Left = 208
    Top = 256
    object ODSsum1PAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object ODSsum1SHOPOLD: TIntegerField
      FieldName = 'SHOPOLD'
    end
    object ODSsum1PAY: TIntegerField
      FieldName = 'PAY#'
      Required = True
    end
    object ODSsum1EXPEND: TIntegerField
      FieldName = 'EXPEND#'
    end
    object ODSsum1SUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object ODSsum1FLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object OQ2sumzpf: TOracleQuery
    SQL.Strings = (
      '       SELECT nvl(SUM(SUM),0) '
      '       FROM   paySUM , PAYTBL'
      '       WHERE  EMP# = :EMPf AND'
      '              MONTH = :MONTH_T AND'
      #9'      YEAR  = :YEAR_T  AND'
      #9'      FACTMON = :FACTMONF AND'
      '  '#9'      paySUM.PAY# < 300 AND'
      '  '#9'      paysUM.PAY# = PAYTBL.PAY# AND'
      '  '#9'      NVL(BUDGTAX8,'#39' '#39') ='#39'*'#39' AND'
      '              paysum.PAY# NOT IN'
      
        '                  ( SELECT TBL# FROM SYSTBL WHERE TBLID ='#39'PF_T7_' +
        'K3'#39' )     ')
    Session = OracleSession1
    Variables.Data = {
      0300000004000000050000003A454D5046030000000000000000000000080000
      003A4D4F4E54485F54030000000000000000000000070000003A594541525F54
      030000000000000000000000090000003A464143544D4F4E4603000000000000
      0000000000}
    Left = 208
    Top = 304
  end
  object OQ2sumblf: TOracleQuery
    SQL.Strings = (
      '       SELECT nvl(SUM(SUM),0) '
      '       FROM   PAYSUM , PAYTBL'
      '       WHERE  EMP# = :EMPf AND '
      '              MONTH = :MONTH_T AND'
      #9'      YEAR  = :YEAR_T  AND'
      #9'      FACTMON = :FACTMONF AND'
      '  '#9'      PAYSUM.PAY# = PAYTBL.PAY# AND'
      '  '#9'      ( NVL(BUDGTAX7,'#39' '#39') ='#39'*'#39' OR'
      
        '  (  ( NVL(BUDGTAX9,'#39' '#39') ='#39'*'#39' and PAYSUM.PAY# not in (245,246,24' +
        '7) ) OR'
      '                      ( PAYSUM.PAY# in (245,246,247) '
      
        '                        and  ( PAYSUM.year * 100 +PAYSUM.month )' +
        ' >= 201307 '
      '                        and  FACTMON >= 201307 '
      '                       )  )   ) '
      '')
    Session = OracleSession1
    Variables.Data = {
      0300000004000000050000003A454D5046030000000000000000000000080000
      003A4D4F4E54485F54030000000000000000000000070000003A594541525F54
      030000000000000000000000090000003A464143544D4F4E4603000000000000
      0000000000}
    Left = 264
    Top = 304
  end
  object ODSsum2: TOracleDataSet
    SQL.Strings = (
      '    SELECT   decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '              DEPT.SHOPOLD,                                '
      '              PAYSUM.PAY#,'
      '              PAYSUM.EXPEND#,'
      '              PAYSUM.EMP#,'
      '              PAYSUM.SUM,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      '    FROM      PAYSUM,DEPT,PAYTBL,PAY'
      '    WHERE     MONTH = :MONTH_T AND'
      '              YEAR = :YEAR_T AND'
      '              FACTMON = :FACTMONF AND  '
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      '              PAYSUM.PAY# = PAYTBL.PAY# AND'
      '              PAYSUM.EMP# = :EMPf AND'
      '              nvl(BUDGTAX8,'#39' '#39') = '#39'*'#39' and'
      '              PAYSUM.DEPT# = DEPT.DEPT#(+)  AND '
      '              PAYSUM.PAY# NOT IN'
      
        '                  ( SELECT TBL# FROM SYSTBL WHERE TBLID ='#39'PF_T7_' +
        'K3'#39' )     '
      '           ')
    Variables.Data = {
      0300000004000000090000003A464143544D4F4E460300000000000000000000
      00080000003A4D4F4E54485F54030000000000000000000000070000003A5945
      41525F54030000000000000000000000050000003A454D504603000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000504159505254590100000000000700000053484F
      504F4C4401000000000004000000504159230100000000000700000045585045
      4E44230100000000000300000053554D01000000000006000000464C4147564F
      01000000000004000000454D5023010000000000}
    Session = OracleSession1
    Left = 320
    Top = 304
    object ODSsum2PAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object ODSsum2SHOPOLD: TIntegerField
      FieldName = 'SHOPOLD'
    end
    object ODSsum2PAY: TIntegerField
      FieldName = 'PAY#'
      Required = True
    end
    object ODSsum2EXPEND: TIntegerField
      FieldName = 'EXPEND#'
    end
    object ODSsum2EMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSsum2SUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object ODSsum2FLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object ODSsumzpf3: TOracleDataSet
    SQL.Strings = (
      '       SELECT FACTMON,nvl(SUM(SUM),0) sumzpf3  '
      '       FROM   paysum , PAYTBL'
      '       WHERE  EMP# = :EMPf AND'
      '              MONTH = :MONTHF AND'
      #9'      YEAR  = :YEARF  AND'
      #9'      FACTMON != :FACTMONF AND'
      '  '#9'      paySUM.PAY# < 300 AND'
      '  '#9'      paySUM.PAY# = PAYTBL.PAY# AND'
      '  '#9'      NVL(BUDGTAX8,'#39' '#39') ='#39'*'#39' AND'
      '              paySUM.PAY# NOT IN'
      
        '                  ( SELECT TBL# FROM SYSTBL WHERE TBLID ='#39'PF_T7_' +
        'K3'#39' )     '
      ' group by factmon')
    Variables.Data = {
      0300000004000000050000003A454D5046030000000000000000000000070000
      003A4D4F4E544846030000000000000000000000060000003A59454152460300
      00000000000000000000090000003A464143544D4F4E46030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000464143544D4F4E0100000000000700000053554D
      5A504633010000000000}
    Session = OracleSession1
    Left = 200
    Top = 360
    object ODSsumzpf3FACTMON: TIntegerField
      FieldName = 'FACTMON'
    end
    object ODSsumzpf3SUMZPF3: TFloatField
      FieldName = 'SUMZPF3'
    end
  end
  object ODSbol: TOracleDataSet
    SQL.Strings = (
      '    SELECT   decode(PAY.PAYPRTY,0,9,PAY.PAYPRTY) payprty,'
      '            DEPT.SHOPOLD,                                '
      '              PAYSUM.PAY#,'
      '              PAYSUM.EXPEND#,'
      '              PAYSUM.EMP#,'
      '              PAYSUM.SUM,'
      '              DECODE(NVL(PAY.FLAGVO,0),0,1,PAY.FLAGVO) flagvo'
      ''
      '    FROM      PAYSUM,DEPT,PAYTBL,PAY'
      '    WHERE     FACTMON = :FACTMONF AND      '
      '              PAYSUM.EMP# = :EMPf AND'
      '              PAYSUM.PAY# < 300 AND'
      '              PAYSUM.PAY# = PAY.PAY# AND'
      
        '              PAYSUM.PAY# = PAYTBL.PAY# AND PAYSUM.DEPT# = DEPT.' +
        'DEPT#(+) and'
      '              ( PAYTBL.BUDGTAX7 = '#39'*'#39' or '
      
        '                   (  ( NVL(BUDGTAX9,'#39' '#39') ='#39'*'#39' and PAYSUM.PAY# n' +
        'ot in (245,246,247) ) OR'
      '                      ( PAYSUM.PAY# in (245,246,247) '
      
        '                        and  ( PAYSUM.year * 100 +PAYSUM.month )' +
        ' >= 201307 '
      '                        and  FACTMON >= 201307 '
      '                       )  )   ) '
      '              ')
    Variables.Data = {
      0300000002000000090000003A464143544D4F4E460300000000000000000000
      00050000003A454D5046030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000007000000504159505254590100000000000700000053484F
      504F4C4401000000000004000000504159230100000000000700000045585045
      4E442301000000000004000000454D50230100000000000300000053554D0100
      0000000006000000464C4147564F010000000000}
    Session = OracleSession1
    Left = 296
    Top = 368
    object ODSbolPAYPRTY: TFloatField
      FieldName = 'PAYPRTY'
    end
    object ODSbolSHOPOLD: TIntegerField
      FieldName = 'SHOPOLD'
    end
    object ODSbolPAY: TIntegerField
      FieldName = 'PAY#'
      Required = True
    end
    object ODSbolEXPEND: TIntegerField
      FieldName = 'EXPEND#'
    end
    object ODSbolEMP: TIntegerField
      FieldName = 'EMP#'
      Required = True
    end
    object ODSbolSUM: TFloatField
      FieldName = 'SUM'
      Required = True
    end
    object ODSbolFLAGVO: TFloatField
      FieldName = 'FLAGVO'
    end
  end
  object OQinstmp2: TOracleQuery
    SQL.Strings = (
      
        'INSERT INTO tmpjur   VALUES (:EMP, :YEAR, :MONTH , :PAY, :fACTMO' +
        'N,'
      
        '                             :SUM, :SHOPOLD, :EXPEND, :FLAGVO, :' +
        'PAYPRTY ,'
      
        '                              to_char(SYSDATE,'#39'DD/MM/YYYY HH24:M' +
        'I '#39') || USER)'
      ''
      '')
    Session = OracleSession1
    Variables.Data = {
      030000000A000000040000003A454D5003000000000000000000000005000000
      3A59454152030000000000000000000000060000003A4D4F4E54480300000000
      00000000000000040000003A504159030000000000000000000000080000003A
      464143544D4F4E030000000000000000000000040000003A53554D0400000000
      00000000000000080000003A53484F504F4C4403000000000000000000000007
      0000003A455850454E44030000000000000000000000070000003A464C414756
      4F030000000000000000000000080000003A5041595052545903000000000000
      0000000000}
    Left = 400
    Top = 280
  end
  object OQdeltmp: TOracleQuery
    SQL.Strings = (
      'DELETE FROM tmpjur'
      '              WHERE '
      '                EMP# BETWEEN nvl(:empmin,0) AND nvl(:empmax,0) '
      ''
      ' ')
    Session = OracleSession1
    Variables.Data = {
      0300000002000000070000003A454D504D494E03000000000000000000000007
      0000003A454D504D4158030000000000000000000000}
    Left = 400
    Top = 224
  end
  object ODStmp4: TOracleDataSet
    SQL.Strings = (
      '       SELECT DISTINCT EMP# emp,'
      '              FACTMON factmon'
      '       FROM   tmpjur'
      '       WHERE  '
      '              EMP# BETWEEN nvl(:empmin,0) AND nvl(:empmax,0) AND'
      '              YEAR  = :year  AND MONTH=:month '
      '       ORDER  BY EMP#,FACTMON'
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
      040000000200000003000000454D5001000000000007000000464143544D4F4E
      010000000000}
    Cursor = crSQLWait
    Session = OracleSession1
    Left = 400
    Top = 160
    object ODStmp4EMP: TIntegerField
      FieldName = 'EMP'
      Required = True
    end
    object ODStmp4FACTMON: TIntegerField
      FieldName = 'FACTMON'
      Required = True
    end
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      ' SELECT t.PAYPRTY payprty,'
      '        t.SHOPOLD shop,'
      '        t.PAY# pay,'
      '       t.expend# expend,'
      '       t.sum sum, '
      '        t.FLAGVO flagvo'
      ''
      '       FROM   tmpjur t'
      '       WHERE  '
      '              t.EMP# =:emp AND'
      '              t.FACTMON = :yearf*100+:monthf '
      '       ORDER  BY 6,1,4,3,2'
      '')
    Variables.Data = {
      0300000003000000060000003A59454152460300000004000000DC0700000000
      0000070000003A4D4F4E54484603000000040000000200000000000000040000
      003A454D5003000000040000006F7A000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000007000000504159505254590100000000000400000053484F
      500100000000000300000050415901000000000006000000455850454E440100
      000000000300000053554D01000000000006000000464C4147564F0100000000
      00}
    Session = OracleSession1
    Left = 48
    Top = 216
    object OracleDataSet3PAYPRTY: TIntegerField
      FieldName = 'PAYPRTY'
      Required = True
    end
    object OracleDataSet3SHOP: TIntegerField
      FieldName = 'SHOP'
    end
    object OracleDataSet3PAY: TIntegerField
      FieldName = 'PAY'
      Required = True
    end
    object OracleDataSet3EXPEND: TIntegerField
      FieldName = 'EXPEND'
    end
    object OracleDataSet3SUM: TFloatField
      FieldName = 'SUM'
    end
    object OracleDataSet3FLAGVO: TIntegerField
      FieldName = 'FLAGVO'
      Required = True
    end
  end
end
