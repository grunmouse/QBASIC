RANDOMIZE TIMER
CLS
COLOR 12: LOCATE 10, 40: PRINT "�"
FOR i = 1 TO 50
c = INT(RND * 31 + 1)
x = INT(RND * 79 + 1)
y = INT(RND * 23 + 1)
COLOR c: LOCATE y, x: PRINT CHR$(3)
FOR k = 1 TO 500
NEXT
NEXT
FOR m = 1 TO 70
c = INT(RND * 14 + 1)
COLOR c: LOCATE 12, m
PRINT " �����"
FOR k = 1 TO 50000
NEXT: NEXT

