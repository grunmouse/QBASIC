CONST Pi = 3.1415912#
CLS
SCREEN 9
LINE (0, 0)-(0, 350), 4
LINE (0, 175)-(640, 175), 4
FOR x = 0 TO 640
y = INT(-SIN(Pi * x / 50) * 100)
a = EXP(-x / 640)
y = y * a + 175
PSET (x, 175 + 100 * a), 9
PSET (x, 175 - 100 * a), 9
PSET (x, y), 14
NEXT x

