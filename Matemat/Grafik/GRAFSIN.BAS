'GRAFSIN.BAS
CLS
INPUT "амплитуда - "; k1
INPUT "период -"; k2
CLS
SCREEN 9
LINE (0, 175)-(640, 175), 1
LINE (0, 0)-(0, 350), 1
FOR i = 1 TO 640
r = INT(-k1 * SIN(i / k2))
PSET (i, r + 175), 3
NEXT
END


