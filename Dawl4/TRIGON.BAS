DEFSTR Q
DEFINT X-Y
'�����
CLS
SCREEN 0
COLOR 15
PRINT "�������� ���न���: "
PRINT TAB(10); "x �� 0 �� 640"
PRINT TAB(10); "y �� 0 �� 480"
COLOR 7
INPUT "������ ���न���� �窨 A, x = ", qxA
PRINT TAB(29);
INPUT "y = ", qyA
xA = VAL(qxA): yA = VAL(qyA)
INPUT "������ ���न���� �窨 B, x = ", qxB
PRINT TAB(29);
INPUT "y = ", qyB
xB = VAL(qxB): yB = VAL(qyB)
INPUT "������ ���न���� �窨 C, x = ", qxC
PRINT TAB(29);
INPUT "y = ", qyC
xC = VAL(qxC): yC = VAL(qyC)
'�����
AB = ((xB - xA) ^ 2 + (yB - yA) ^ 2) ^ .5
AC = ((xC - xA) ^ 2 + (yC - yA) ^ 2) ^ .5
BC = ((xC - xB) ^ 2 + (yC - yB) ^ 2) ^ .5

p = (AB + BC + AC) / 2
R = ((p - AB) * (p - AC) * (p - BC) / p) ^ .5'ࠤ��� ������

cosA = (xC - xA) / AC
sinA = (yC - yA) / AC

cos2f1 = (BC ^ 2 - AB ^ 2 - AC ^ 2) / (2 * AB * AC)
sin2f1 = (1 - cos2f1 ^ 2) ^ .5

sinB = (yB - yA) / AB
cosB = (xB - xA) / AB
yB1 = AB * (sinB * cosA - cosB * sinA)

y1 = R * SGN(yB1)

tgf1 = sin2f1 / (1 - cos2f1)
x1 = R / tgf1

ro = (y1 ^ 2 + x1 ^ 2) ^ .5

sinf1 = y1 / ro
cosf1 = x1 / ro

x = ro * (cosf1 * cosA - sinf1 * sinA) + xA '���न���� �������
y = ro * (sinf1 * cosA + cosf1 * sinA) + yA

'����஥���
CLS
SCREEN 12
LINE (xA, yA)-(xB, yB), 2
LINE (xB, yB)-(xC, yC), 2
LINE (xA, yA)-(xC, yC), 2
PAINT (x, y), 2, 2
CIRCLE (x, y), R, 15
PAINT (x, y), 0, 15

