DECLARE SUB init ()
DECLARE SUB prosess ()
DECLARE SUB result ()
DIM SHARED r(1 TO 5)
DIM SHARED i, f
CLS
CALL init
CALL prosess
CALL result

SUB init
ret: INPUT "��஭� a==>", r(1)
INPUT "��஭� b==>", r(2)
INPUT "��஭� c==>", r(3)
r(4) = r(1): r(5) = r(2)
FOR i = 1 TO 3
IF r(1) >= r(i + 1) + r(i + 2) THEN PRINT "�� �� ��㣮�쭨�!": GOTO ret
NEXT i
END SUB

SUB prosess
f = 0
FOR i = 1 TO 3
IF r(i) * r(i) = r(i + 1) * r(i + 1) + r(i + 2) * r(i + 2) THEN f = 1: EXIT FOR
NEXT i
END SUB

SUB result
IF f = 0 THEN PRINT "� ��㣮�쭨�� ��� ��אַ�� 㣫�": EXIT SUB
PRINT "�� ��אַ㣮��� ��㣮�쭨�"
PRINT "��� ����⨭㧠 - ��஭� "; r(i)
END SUB

