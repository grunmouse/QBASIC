SCREEN 0
CLS
INPUT "������ ��� ��襣� ஦����� ", g
PRINT "������ ��� ��� (�/�)"
DO
      p$ = UCASE$(INPUT$(1))
LOOP UNTIL p$ = "�" OR p$ = "�" OR p$ = "V" OR p$ = ";" OR p$ = ":"
IF p$ = "�" OR p$ = "V" THEN v = g + 60
IF p$ = "�" OR p$ = ";" OR p$ = ":" THEN v = g + 55
PRINT "�� 㩤�� �� ����� � "; v; " ����"

