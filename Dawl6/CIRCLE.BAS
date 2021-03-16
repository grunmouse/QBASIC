OPTION BASE 0
DEFINT X-Y
Pi = 3.14158265359#
CLS
SCREEN 12

RANDOMIZE TIMER

DIM col(7)
FOR i = 0 TO 7
      col(i) = INT(RND * 15)
NEXT i

FOR i = 0 TO 7
      x = 150 * COS(Pi * i / 4) + 320
      y = 150 * SIN(Pi * i / 4) + 240
      CIRCLE (x, y), 30, 15
NEXT i
LOCATE 29, 20: PRINT "Нажми Esc для выхода"

KEY 15, CHR$(32) + CHR$(1)
KEY 16, CHR$(0) + CHR$(1)
ON KEY(15) GOSUB met
ON KEY(16) GOSUB met
KEY(0) ON

DO

FOR j = 0 TO 7
SLEEP 1
FOR i = 0 TO 7
      x = 150 * COS(Pi * i / 4) + 320
      y = 150 * SIN(Pi * i / 4) + 240
      PAINT (x, y), col((i + j) MOD 8), 15
NEXT i
NEXT j

LOOP
met:

