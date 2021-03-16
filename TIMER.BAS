SCREEN 12
CONST Pi = 3.141591265358#
CIRCLE (320, 200), 175, 1
FOR i = 1 TO 12
LINE (320 + 173 * SIN(2 * Pi * i / 12), 200 - 173 * COS(2 * Pi * i / 12))-(320 + 177 * SIN(2 * Pi * i / 12), 200 - 177 * COS(2 * Pi * i / 12)), 4
NEXT i
DO
a1 = VAL(MID$(TIME$, 1, 2))
a2 = VAL(MID$(TIME$, 4, 2))
a3 = VAL(MID$(TIME$, 7, 2))
LINE (320, 200)-STEP(150 * SIN(2 * Pi * a1 / 12), -150 * COS(2 * Pi * a1 / 12)), 4
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a2 / 60), -170 * COS(2 * Pi * a2 / 60)), 10
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a3 / 60), -170 * COS(2 * Pi * a3 / 60)), 1
LOCATE 7, 36: PRINT TIME$
SLEEP 1
LINE (320, 200)-STEP(150 * SIN(2 * Pi * a1 / 12), -150 * COS(2 * Pi * a1 / 12)), 0
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a2 / 60), -170 * COS(2 * Pi * a2 / 60)), 0
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a3 / 60), -170 * COS(2 * Pi * a3 / 60)), 0
LOOP WHILE INKEY$ = ""
LINE (320, 200)-STEP(150 * SIN(2 * Pi * a1 / 12), -150 * COS(2 * Pi * a1 / 12)), 4
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a2 / 60), -170 * COS(2 * Pi * a2 / 60)), 10
LINE (320, 200)-STEP(170 * SIN(2 * Pi * a3 / 60), -170 * COS(2 * Pi * a3 / 60)), 1

