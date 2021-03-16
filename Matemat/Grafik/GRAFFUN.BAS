'GRAFSIN.BAS
SCREEN 9
CLS
INPUT "функция - "; a$
INPUT "амплитуда - "; k1
INPUT "полупериод -"; k2
CLS
LINE (0, 175)-(640, 175), 1
LINE (10, 0)-(10, 350), 1
LOCATE 1, 3: PRINT "y"
LOCATE 14, 80: PRINT "x"
SELECT CASE a$
      CASE "sin"
FOR i = 0 TO 10
r = INT(-k1 * SIN(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
FOR i = 10 TO 2 * k2
y = INT(-k1 * SIN(3.141591265358# * (i - 10) / k2))
CIRCLE (i, y + 175), 2, 14
NEXT
FOR i = 2 * k2 TO 640
r = INT(-k1 * SIN(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
      CASE "cos"
FOR i = 0 TO 10
r = INT(-k1 * COS(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
FOR i = 10 TO 2 * k2
y = INT(-k1 * COS(3.141591265358# * (i - 10) / k2))
CIRCLE (i, y + 175), 2, 14
NEXT
FOR i = 2 * k2 TO 640
r = INT(-k1 * COS(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
      CASE "tg"
FOR i = 0 TO 10
r = INT(-k1 * TAN(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
FOR i = 10 TO 2 * k2
y = INT(-k1 * TAN(3.141591265358# * (i - 10) / k2))
CIRCLE (i, y + 175), 2, 14
NEXT
FOR i = 2 * k2 TO 640
r = INT(-k1 * TAN(3.141591265358# * (i - 10) / k2))
PSET (i, r + 175), 3
NEXT
END SELECT
END




