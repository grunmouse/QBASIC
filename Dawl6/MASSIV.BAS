DEFINT A-Z
RANDOMIZE TIMER
DIM s(1 TO 50) AS INTEGER, sum AS LONG

CLS
FOR i = 1 TO 50
      s(i) = CINT(RND * 10000)
      PRINT s(i),
NEXT i

PRINT
max = 1: min = 1: sum = s(1)
FOR i = 2 TO 50
      IF s(i) > s(max) THEN max = i
      IF s(i) < s(min) THEN min = i
      sum = sum + s(i)
NEXT i

PRINT "s(max) = s("; max; ") ="; s(max)
PRINT "s(min) = s("; min; ") ="; s(min)
PRINT "s(ба) ="; sum / 50

