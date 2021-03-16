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
      b = INT(i * 3 / 4)
      y = INT(x * 3 / 4) + b MOD 30
      x1 = x + i MOD 40
      a = (320 + x - i) MOD 321
      LINE (320 - x1, 240 - y)-(320 + x1, 240 + y), co(a), B
      LINE (320 - x1 - 39, 240 - y - INT(39 * 3 / 4))-(320 + x1 + 39, 240 + y + INT(39 * 3 / 4)), co(a), B
      PAINT (320 - x1 - 37, 240 - y - INT(37 * 3 / 4)), co(a), co(a)
      Q$ = INKEY$
      IF Q$ = CHR$(27) THEN EXIT DO
    NEXT x
  NEXT i
LOOP

