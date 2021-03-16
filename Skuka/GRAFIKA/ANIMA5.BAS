CLS
SCREEN 12
DIM co(320)
FOR x = 0 TO 320
  SELECT CASE x
    CASE 0 TO 39
      co(x) = 4
    CASE 40 TO 79
      co(x) = 12
    CASE 80 TO 119
      co(x) = 14
    CASE 120 TO 159
      co(x) = 10
    CASE 160 TO 199
      co(x) = 2
    CASE 200 TO 239
      co(x) = 9
    CASE 240 TO 279
      co(x) = 1
    CASE 280 TO 320
      co(x) = 5
  END SELECT
NEXT x
DO
 FOR i = 0 TO 320
    FOR x = 0 TO 320 STEP 40
      y = INT(x * 3 / 4)
      B = INT(i * 3 / 4)
      a = (320 + x - i) MOD 321
      y1 = y + B: x1 = x + i
      y2 = (y1 + INT(39 * 3 / 4)) MOD 240
      x2 = (x1 + 39) MOD 320
      x1 = x1 MOD 320
      y1 = y1 MOD 240
      LINE (320 - x1, 240 - y1)-(320 + x1, 240 + y1), co(a), B
      LINE (320 - x2, 240 - y2)-(320 + x2, 240 + y2), co(a), B
      IF y1 < y2 AND y2 > 2 THEN PAINT (320 - x2 + 2, 240 - y2 + 2), co(a), co(a)
      Q$ = INKEY$
      IF Q$ = CHR$(27) THEN EXIT DO
    NEXT x
  NEXT i
LOOP

