CLS
Pi = 3.141591265358#
INPUT "����� ������� 業�� "; x0
INPUT "����� �न���� 業�� "; y0
INPUT "����� ��ਮ� ������� "; Tx
INPUT "����� ��ਮ� �न���� "; Ty
INPUT "����� �������� ������� "; ax
INPUT "����� �������� �न���� "; ay
INPUT "����� ������� ��砫�          Pi*"; x1
INPUT "����� �न���� ��砫�          Pi*"; y1
CLS
SCREEN 9
FOR t = 1 TO Tx * Ty
X = INT(ax * COS(t / Tx + Pi * ax) + x0)
Y = -INT(ay * COS(t / Ty + Pi * ay) + y0)
IF t = 1 THEN x0 = X: y0 = Y
IF t > 1 AND X = x0 AND Y = y0 THEN EXIT FOR
PSET (X, Y), 14
NEXT


