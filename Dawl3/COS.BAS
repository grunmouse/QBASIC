CONST Pi = 3.14159265358#
SCREEN 12
WIDTH 80, 60
PRINT "угол"; TAB(6); "cos"; TAB(40); "|"; "угол"; TAB(47); "cos"
PRINT STRING$(80, "=")
FOR i = 0 TO 180 STEP 5
      PRINT i; TAB(6); COS(i * Pi / 180); TAB(40); "|";
      IF i > 0 THEN PRINT i + 180; TAB(47); COS((i + 180) * Pi / 180) ELSE PRINT
NEXT
PRINT "Нажми любую клавишу, чтобы строить график"
DO
LOOP WHILE INKEY$ = ""
CLS
LINE (0, 0)-(0, 480), 1
LINE (0, 240)-(640, 240), 1
PSET (0, -COS(0) * 200 + 240), 14
FOR i = 1 TO 640
      LINE -(i, -COS(i * Pi / 320) * 200 + 240), 14
NEXT

