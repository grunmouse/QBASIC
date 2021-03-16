CONST Pi = 3.14159165359#
SCREEN 12
DEF fnx (i) = (i / 320 - 1) * Pi
DEF fny1 (x) = 200 * SIN(x) + 240
DEF fny2 (x) = 200 * COS(x) + 240
CLS
LINE (0, 240)-(640, 240), 9
LINE (320, 0)-(320, 480), 9
FOR i = 0 TO 640
      x = fnx(i)
      y1 = fny1(x)
      y2 = fny2(x)
      IF i > 0 THEN
          x0 = fnx(i - 1)
          LINE (i - 1, fny1(x0))-(i, y1), 15
          LINE (i - 1, fny2(x0))-(i, y2), 12
      END IF
      IF INT(y1) = INT(y2) THEN
            CIRCLE (i, y1), 5, 14
      END IF
NEXT i

