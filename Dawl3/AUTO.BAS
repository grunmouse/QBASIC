DEFSTR Q
DO
CLS
PRINT "�����:"
PRINT "1) - ������"
PRINT "2) - ᮧ����"
PRINT "3) - ��室"
DO
      cx = VAL(INPUT$(1))
LOOP UNTIL cx > 0 AND cx < 4
CLS
SELECT CASE cx
      CASE 1
INPUT "����� ����� ���� 䠩��"; q
OPEN q FOR INPUT AS #1
INPUT #1, n
INPUT "����� ���� ��⮬�����"; qm
FOR i = 1 TO n
      INPUT #1, qnam, kol
      IF qm = qnam THEN kvo = kol: EXIT FOR
      kol = 0
NEXT
PRINT "�-�� ��⮬������ ��ન "; qm; " - "; kvo
DO
LOOP WHILE INKEY$ = ""
CLOSE
      CASE 2
INPUT "����� ����� ���� 䠩��"; q
OPEN q FOR OUTPUT AS #1
INPUT "����� �᫮ ��ப", n
WRITE #1, n
FOR i = 1 TO n
      INPUT "����� ���� ��⮬�����"; qnam
      INPUT "����� �� �᫮ �� ᪫���", qkol
      kol = VAL(qkol)
      WRITE #1, qnam, kol
NEXT
CLOSE
      CASE 3
            END
END SELECT
LOOP

