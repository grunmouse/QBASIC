DECLARE SUB ramka (R1, C1, R2, C2)
DEFSTR A, Q: DEFINT I-N
DIM a(21, 20), q(21, 20), n(21, 20)
CLS : COLOR 10, 0
LOCATE 4, 18: PRINT "��⥫�, �� ������ ������� �� ����� 10 ����ᮢ. "
LOCATE 5, 13: PRINT "� ������� ������ ������ ���� �।������ �� ���� �⢥⮢."
LOCATE 6, 26: PRINT "���쪮 ���� �� ��� �ࠢ����."
LOCATE 7, 16: PRINT
LOCATE 20, 24: PRINT "��� �த������� ����� �஡��."
DO
LOOP UNTIL INKEY$ = CHR$(32)
CLS
LOCATE 10, 10: PRINT "������ ��� 䠩�� ��⨭᪨�� �㪢��� (� 㪠������ ��᪠),"
LOCATE 11, 24: PRINT "���ਬ��=> A:\qv1.dat,"
LOCATE 12, 20: PRINT "��� ����� ����ᮢ � �⢥⮢."
LOCATE 16, 26: PRINT "������ ������� `Enter`"
LOCATE 14, 35: INPUT qfile
PRINT
CLS
LOCATE 12, 21: PRINT "��४���� ���������� �� ���᪨�!"
LOCATE 20, 24: PRINT "��� �த������� ����� �஡��."
DO
LOOP UNTIL INKEY$ = CHR$(32)
CLS
COLOR 13, 0
LOCATE 12, 21: PRINT "��ப� ����ࠩ� � �।���� ࠬ��!"
LOCATE 13, 16: PRINT "�ਬ������ ������� � ����祪 �� ����᪠����!"
COLOR 10, 0
LOCATE 20, 24: PRINT "��� �த������� ����� �஡��."
DO
LOOP UNTIL INKEY$ = CHR$(32)
OPEN qfile FOR OUTPUT AS #1
COLOR 14, 0
LOCATE 15, 24: INPUT "������ �᫮ ����ᮢ"; rq
IF rq <= 10 THEN rq = 10
COLOR 10, 0
WRITE #1, rq
FOR i = 1 TO rq
 CLS
 LOCATE 2, 28: PRINT "����� "; i
 FOR j = 1 TO 3
COLOR 12, 0
LOCATE 5, 24: PRINT "������ 3 ��ப� �����."
LOCATE 6, 15: PRINT "��᫥ ����� ������ ��ப� ������ 'Enter'."
LOCATE 7, 20: PRINT "�᫨ ⥪�� ��� - ������ 'Enter'."
  COLOR 10, 0
  CALL ramka(4, 8, 8, 68)
  CALL ramka(10, 5, 15, 78)
LOCATE 10 + j, 1: PRINT j; CHR$(16);
LOCATE 10 + j, 6: INPUT "", q(i, j)
WRITE #1, q(i, j)
 NEXT
 CLS
 CALL ramka(8, 5, 19, 76)
 LOCATE 2, 28: PRINT "����� "; i
 FOR k = 2 TO 11
COLOR 10, 0
LOCATE 21, 1: PRINT SPC(70);
LOCATE 22, 1: PRINT SPC(70);
LOCATE 23, 1: PRINT SPC(70);
IF k MOD 2 > 0 THEN kq = (k - 1) / 2 ELSE kq = k / 2
COLOR 12, 0: LOCATE 5, 24: PRINT "������ "; kq; "��ਠ�� �⢥�"
COLOR 10, 0: LOCATE 7 + k, 1: PRINT kq; CHR$(16);
LOCATE 7 + k, 6: INPUT "", a(i, k)
IF k MOD 2 = 0 THEN qk = " ": GOTO 11
COLOR 13, 0: CALL ramka(21, 9, 23, 42)
LOCATE 22, 10: PRINT "��� �⢥� �ࠢ����? (�/�)"; : qk = INPUT$(1)
11 IF qk = "�" OR qk = "�" OR qk = "L" OR qk = "l" THEN n(i, k) = -1 ELSE n(i, k) = 0
COLOR 10, 0
WRITE #1, a(i, k), n(i, k)
NEXT
NEXT
CLOSE
CLS
LOCATE 10, 15: PRINT "��� ������ � �⢥�� � ��� ����ᠭ� � 䠩��:"
LOCATE 12, 30: PRINT "=> "; : PRINT qfile
LOCATE 14, 15: PRINT "������  �������� 䠩�� ��� ࠡ��� � �ணࠬ���"
LOCATE 15, 30: PRINT "����஫� ������"
LOCATE 20, 32: PRINT "�� ᢨ�����."
COLOR 7, 0
END

SUB ramka (R1, C1, R2, C2)
REM ��ᮢ���� ��אַ㣮�쭮� ࠬ��
FOR iram = C1 + 1 TO C2 - 1
LOCATE R1, iram: PRINT CHR$(196);
NEXT
LOCATE R1, C2: PRINT CHR$(191); '���孨� �ࠢ� 㣮�
FOR iram = R1 + 1 TO R2 - 1
LOCATE iram, C2: PRINT CHR$(179);
NEXT
LOCATE R2, C2: PRINT CHR$(217); '������ �ࠢ� 㣮�
FOR iram = C2 - 1 TO C1 + 1 STEP -1
LOCATE R2, iram: PRINT CHR$(196);
NEXT
LOCATE R2, C1: PRINT CHR$(192); '������ ���� 㣮�
FOR iram = R2 - 1 TO R1 + 1 STEP -1
LOCATE iram, C1: PRINT CHR$(179);
NEXT
LOCATE R1, C1: PRINT CHR$(218); '���孨� ���� 㣮�.
END SUB

