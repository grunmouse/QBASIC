CLS
PRINT "�ணࠬ�� ��� ���� ���ᨢ� ������⮢ �� ��㫥 a(n)=n^2+1"
INPUT "H����୮��� ���ᨢ� ", n
DIM a(n)
l = 0
PRINT "� ���ᨢ� ᮤ�ঠ��� ᫥���騥 ��� ��������:"
FOR i = 0 TO n
      a(i) = i ^ 2 + 1
      IF a(i) MOD 2 = 0 THEN
            PRINT TAB(4); a(i)
      ELSE
            l = l + 1
      END IF
NEXT i
PRINT "� ���ᨢ� ᮤ�ন���"; l; "������ ������⮢"

