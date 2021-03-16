REDIM co(640)
CLS
SCREEN 12
SLEEP 1
FOR x = 1 TO 640
  SELECT CASE x MOD 321
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
  LINE (320, 480)-(x, 0), co(x)
    FOR i = 1 TO 10
    FOR j = 1 TO 100
    NEXT j: NEXT i
NEXT x
SLEEP 1
FOR Y = 0 TO 350
  LINE (320, 480)-(0, Y), co(0)
  FOR x = 1 TO 601 STEP 40
    LINE (320, 480)-(x, Y), co(x + 1)
    LINE (320, 480)-(x + 39, Y), co(x + 1)
    LINE (x, Y)-(x + 39, Y), co(x + 1)
    PAINT (x + 20, Y + 2), co(x + 1)
  NEXT x
  LINE (0, Y / 3)-(640, Y / 3), 0
NEXT Y
SLEEP 1
END

