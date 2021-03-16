CLS
SCREEN 12
DIM co(320)
FOR x = 0 TO 320
  SELECT CASE x
    CASE 0 TO 40
      co(x) = 4
    CASE 41 TO 80
      co(x) = 12
    CASE 81 TO 120
      co(x) = 14
    CASE 121 TO 160
      co(x) = 10
    CASE 161 TO 200
      co(x) = 2
    CASE 201 TO 240
      co(x) = 9
    CASE 241 TO 280
      co(x) = 1
    CASE 281 TO 320
      co(x) = 5
  END SELECT
NEXT x
DO
 FOR i = 0 TO 320
    FOR x = 0 TO 320
      a = (320 + x - i) MOD 321
      LINE (320 - x, 0)-(320 + x, 480), co(a)
      Q$ = INKEY$
      IF Q$ = CHR$(27) THEN EXIT FOR
    NEXT x
    IF Q$ = CHR$(27) THEN EXIT FOR
  NEXT i
LOOP UNTIL Q$ = CHR$(27)

