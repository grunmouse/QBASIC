'GERON.BAS
'�ணࠬ�� �� �몥 BASIC
'���ࠡ�⠭� �祭���� 10"�" ������ ����ਥ�
'�।�����祭� ��� ���᫥��� ���頤� ��㣮�쭨�� �� ��� ��஭��
CLS
vvod:
CLS
LOCATE 10, 30: INPUT "������ ��஭� a"; A
CLS
LOCATE 10, 30: INPUT "������ ��஭� b"; B
CLS
LOCATE 10, 30: INPUT "������ ��஭� c"; C
P = (A + B + C) / 2
LOCATE 11, 20
IF P <= A THEN PRINT "⠪��� ��㣮�쭨�� �� �������": GOTO vvod
IF P <= B THEN PRINT "⠪��� ��㣮�쭨�� �� �������": GOTO vvod
IF P <= C THEN PRINT "⠪��� ��㣮�쭨�� �� �������": GOTO vvod
S = (P * (P - A) * (P - B) * (P - C)) ^ .5
CLS
LOCATE 10, 20: PRINT "���頤� ��㣮�쭨�� ࠢ��  "; S
END

