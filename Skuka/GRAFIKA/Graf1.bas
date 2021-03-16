DECLARE FUNCTION GAS% (x1%, y1%, x2%, y2%)
SCREEN 12
LINE (0, 50)-(80, 50), 15
LINE -(80, 130), 15
LINE -(0, 130), 15
LINE -(0, 50), 15
LINE (80, 50)-(130, 0), 15
LINE (80, 130)-(130, 80), 15
LINE (0, 50)-(50, 0), 15
LINE -(130, 0), 15
LINE -(130, 80), 15
PAINT (40, 90), 10, 15
PAINT (40, 40), 2, 15
PAINT (110, 90), 2, 15
a% = GAS%(0, 0, 130, 130)
REDIM mas(a%)
GET (0, 0)-(130, 130), mas
CLS
FOR x = 1 TO 500 STEP 125
PUT (x, 150), mas, PSET
NEXT x

FUNCTION GAS% (x1%, y1%, x2%, y2%) STATIC
      GAS% = 4 + INT(((PMAP(x2%, 0) - PMAP(x1%, 0) + 1) * 1 + 7) / 8) * 1 * (PMAP(y2%, 1) - PMAP(y1%, 1) + 1)
END FUNCTION

