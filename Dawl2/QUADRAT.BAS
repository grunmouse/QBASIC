SCREEN 0
CLS
PRINT "�ணࠬ�� ��� �襭�� �ࠢ����� ���� ax^2 + bx + c = 0"
INPUT "a = ", a
INPUT "b = ", b
INPUT "c = ", c
d = b ^ 2 - 4 * a * b
IF a = 0 THEN
      x = -c / b
      PRINT "�ࠢ����� ����� ���� ��७� ࠢ�� "; x
ELSEIF d < 0 THEN
      PRINT "�ࠢ����� �� ����� ����⢨⥫��� ��୥�"
ELSEIF d = 0 THEN
      x = -b / (2 * a)
      PRINT "�ࠢ����� ����� ���� ��७� ࠢ�� "; x
ELSEIF d > 0 THEN
      x1 = (-b - d ^ .5) / (2 * a)
      x2 = (-b + d ^ .5) / (2 * a)
      PRINT "�ࠢ����� ����� ��� ���� ࠢ�� "; x1; " � "; x2
END IF

