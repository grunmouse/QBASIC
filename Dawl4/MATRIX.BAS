RANDOMIZE TIMER
m = CINT(RND * 9) + 1
n = CINT(RND * 9) + 1
DIM matrix(1 TO m, 1 TO n)
CLS
FOR i = 1 TO m
FOR j = 1 TO n
      matrix(i, j) = CINT(RND * 100)
      LOCATE j, (i - 1) * 4 + 1
      PRINT matrix(i, j)
NEXT: NEXT
INPUT "На что множим?   ", mal
PRINT "Результат:"
FOR i = 1 TO m
FOR j = 1 TO n
      matrix(i, j) = matrix(i, j) * mal
      LOCATE j, (i - 1) * 6 + 1
      PRINT matrix(i, j)
NEXT: NEXT

