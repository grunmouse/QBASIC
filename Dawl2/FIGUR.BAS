CONST Pi = 3.14159165359#
SCREEN 12
PRINT "Выбери фигуру"
PRINT "1) круг"
PRINT "2) ромб"
PRINT "3) цилиндр"
DO
      Q$ = INPUT$(1)
LOOP UNTIL VAL(Q$) > 0 AND VAL(Q$) < 4
CLS
SELECT CASE VAL(Q$)
      CASE 1
            CIRCLE (320, 240), 200, 14
      CASE 2
            LINE (0, 240)-(320, 0), 15
            LINE -(640, 240), 15
            LINE -(320, 480), 15
            LINE -(0, 240), 15
            PAINT (320, 240), 15, 15
      CASE 3
            CIRCLE (320, 150), 100, 13, , , .5
            CIRCLE (320, 330), 100, 13, , , .5
            LINE (220, 150)-(220, 330), 13
            LINE (420, 150)-(420, 330), 13
END SELECT

