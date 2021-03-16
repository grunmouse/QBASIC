'Attribute VBDefInt A-Z
DEFINT A-Z
RANDOMIZE TIMER
DIM s(1 TO 50) AS INTEGER, sum AS LONG

CLS
FOR i = 1 TO 50
      s(i) = CINT(RND)
      PRINT s(i),
      sum = sum + s(i)
NEXT i

PRINT

PRINT "s(ба) ="; sum / 50

