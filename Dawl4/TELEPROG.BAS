DO
CLS
PRINT "����� ��஢�� �������:"
PRINT "1. �������..."
PRINT "2. ������ ��� ��ᬮ��..."
PRINT "3. ������ ��� ����������..."
PRINT "4. ��室"
DO
      q = VAL(UCASE$(INPUT$(1)))
LOOP UNTIL q > 0 AND q < 5
IF q = 4 THEN END
INPUT "����� ����� ���� 䠩��:  ", f$
MetOpen:
CLS
SELECT CASE q
      CASE 1
            OPEN f$ FOR OUTPUT AS #1
      CASE 2
            OPEN f$ FOR INPUT AS #1
      CASE 3
            OPEN f$ FOR APPEND AS #1
END SELECT
PRINT f$
SELECT CASE q
      CASE 1, 3
            DO
            CLS
            INPUT "����쪮 ����ᥩ �� ��� ��������? ", kv
            FOR i = 1 TO kv
                  INPUT "������������ ⥫���।��: ", n$
                  INPUT "�६� ������ (��:��): ", t$
                  WRITE #1, n$, t$
            NEXT
            CLS
            PRINT "����� ��஢�� �������:"
            PRINT "1. ������ ��� 䠩� ��� ��ᬮ��"
            PRINT "2. �த������ ���������� � ��� 䠩�"
            PRINT "3. ������� 䠩�"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 4
            IF q1 = 1 THEN q = 2: CLOSE : GOTO MetOpen
            LOOP UNTIL q1 = 3
      CASE 2
            CLS
            PRINT "����� ��஢�� �������:"
            PRINT "1. �뢥�� ᯨ᮪ ⥫���।��"
            PRINT "2. ���� �ணࠬ�� �� �६���"
            PRINT "3. ���� �६� ⥫���।��"
            PRINT "4. �⬥���� ��ᬮ��"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 5
            IF q1 < 4 THEN
                  ut$ = "": un$ = ""
                  SELECT CASE q1
                        CASE 2
                              INPUT "����� �६� (��:��): ", ut$
                        CASE 3
                              INPUT "����� �������� ��।��: ", un$
                  END SELECT
                  CLS
                  DO
                        INPUT #1, n$, t$
                        IF q1 = 1 OR t$ = ut$ OR n$ = un$ THEN
                              PRINT t$, n$
                        END IF
                  LOOP UNTIL EOF(1)
            END IF
            PRINT "����� ��஢�� �������:"
            PRINT "1. �த������ (�����������) ��ᬮ�� 䠩��"
            PRINT "2. ������ ��� 䠩� ��� ����������"
            PRINT "3. ������� 䠩�"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 4
            CLOSE
            IF q1 = 2 THEN q = 3: GOTO MetOpen
            IF q1 = 1 THEN q = 2: GOTO MetOpen
END SELECT
CLOSE
LOOP

