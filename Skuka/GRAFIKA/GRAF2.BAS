CLS
SCREEN 12
DIM co(50)
FOR i = 1 TO 40
  SELECT CASE i
    CASE 1 TO 5
      co(i) = 4
    CASE 6 TO 10
      co(i) = 12
    CASE 11 TO 15
      co(i) = 14
    CASE 16 TO 20
      co(i) = 10
    CASE 21 TO 25
      co(i) = 2
    CASE 26 TO 30
      co(i) = 9
    CASE 31 TO 35
      co(i) = 1
    CASE 36 TO 40
      co(i) = 5
  END SELECT
LINE (320 - i, 240 - i)-(320 + i, 240 - i), co(i)
LINE -(320 + i, 240 + i), co(i)
LINE -(320 - i, 240 + i), co(i)
LINE -(320 - i, 240 - i), co(i)
NEXT i
FOR i = 1 TO 40
  LINE (280 + i, 200 - i)-(360 + i, 200 - i), co(i)
  LINE -(360 + i, 280 - i), co(i)
NEXT i
LINE (280, 200)-(360, 200), 15
LINE -(360, 280), 15
LINE -(280, 280), 15
LINE -(280, 200), 15
LINE (360, 280)-(400, 240), 15
LINE (360, 200)-(400, 160), 15
LINE (280, 200)-(320, 160), 15
LINE -(400, 160), 15
LINE -(400, 240), 15

