DEFSTR Q
DEFINT C-K, N
OPTION BASE 1
TYPE Arbeiter
      Nam AS STRING * 10
      Zarp AS SINGLE
END TYPE

CLS
INPUT "����� ���-�� ࠤ��� � �ਣ��� ", qn
n = VAL(qn)
DIM brig(n) AS Arbeiter
PRINT "����� �� 䠬���� � ࠧ��� ��௫���"
PRINT TAB(5); "䠬����"; TAB(20); "��௫��"

FOR i = 1 TO n
      c = CSRLIN
      PRINT i; TAB(5);
      INPUT "", qNam
      LOCATE c, 20:  INPUT "", qZarp
      brig(i).Nam = LEFT$(qNam, 10)
      brig(i).Zarp = VAL(qZarp)
      sum = sum + brig(i).Zarp
NEXT i

PRINT "�।��� ���ૠ� - "; sum / n
PRINT "��௫��� ��� �।��� �������:"
PRINT TAB(5); "䠬����"; TAB(20); "��௫��"
FOR i = 1 TO n
      IF brig(i).Zarp > sum / n THEN PRINT i; TAB(5); brig(i).Nam; TAB(20); brig(i).Zarp
NEXT i

