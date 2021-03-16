CLS
SCREEN 12
start = TIMER
CONST pi = 3.1459165358#
DO
      FOR i = 1 TO 10000: NEXT
      t = (TIMER - start)
      x = -COS(t) * 300
      y = (160000 - x ^ 2) ^ .5
      CLS
      LINE (320, 0)-(x + 320, y)
      CIRCLE (x + 320, y), 10
      LOCATE 1, 56: PRINT t / 2 / pi
LOOP UNTIL t >= 10 * pi OR INKEY$ = CHR$(27)

