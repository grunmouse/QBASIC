DO
CLS
COLOR 7
PRINT "�����:"
PRINT "1 - ������� 䠩�"
PRINT "2 - ������ �������騩 䠩�"
PRINT "3 - ��室"
Q = VAL(INPUT$(1))
CLS
SELECT CASE Q
      CASE 1
            INPUT "����� ����� ���� ᮧ��������� 䠩��: ", A$
            OPEN A$ FOR OUTPUT AS #1
            FOR i = 1 TO 10
                  PRINT "����� �業�� ��㤥�� "; i
                  PRINT " - ";
                  b = VAL(INPUT$(1))
                  SELECT CASE b
                        CASE 2
                              PRINT "���"
                        CASE 3
                              PRINT "㤮�"
                        CASE 4
                              PRINT "��"
                        CASE 5
                              PRINT "��"
                  END SELECT
                  WRITE #1, b
            NEXT
            CLOSE
      CASE 2
            INPUT "����� ����� ���� ���뢠����� 䠩��: ", A$
            OPEN A$ FOR INPUT AS #1
            DIM o5, o4, o2
            FOR i = 1 TO 10
                  INPUT #1, b
                  SELECT CASE b
                        CASE 5
                              o5 = o5 + 1
                        CASE 4
                              o4 = o4 + 1
                        CASE 2
                              o2 = o2 + 1
                  END SELECT
            NEXT
            CLOSE
            PRINT "ᤠ�� �� �� "; o5
            PRINT "ᤠ�� �� �� "; o4
            PRINT "�� ᤠ�� "; o2
            PRINT
            PRINT "����� ���� �������"
            A$ = INPUT$(1)
      CASE 3
      END
END SELECT
LOOP

