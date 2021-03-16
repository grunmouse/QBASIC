SCREEN 12
VIEW (20, 2)-(620, 400), , 1
CONST PI = 3.141592653589#
WINDOW (0, -1.1)-(2 * PI, 1.1)
Style% = &HFF00
VIEW PRINT 27 TO 28
DO
   PRINT TAB(20);
   INPUT "Введите частоту (0 для завершения): ", Cycles
   CLS
   LINE (2 * PI, 0)-(0, 0), , , Style%
   IF Cycles > 0 THEN
      FOR X = 0 TO 2 * PI STEP .01
         Y = SIN(Cycles * X)
         LINE -(X, Y)
      NEXT X
   END IF
LOOP WHILE Cycles > 0

