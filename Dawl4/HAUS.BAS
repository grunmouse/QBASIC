SCREEN 12
VIEW PRINT 26 TO 30
DO
CLS
PRINT "Рисуем домик"
INPUT "цвет стен (от 1 до 15)"; cs
      LINE (220, 180)-(420, 380), cs, BF
INPUT "цвет крыши (от 1 до 15)"; ck
      LINE (200, 180)-(440, 180), ck
      LINE -(320, 100), ck
      LINE -(200, 180), ck
      PAINT (320, 140), ck
INPUT "цвет трубы (от 1 до 15)"; ct
      LINE (370, 50)-(390, 150), ct, BF
      LINE (200, 180)-(440, 180), ck
      LINE -(320, 100), ck
      LINE -(200, 180), ck
      PAINT (371, 149), ck
INPUT "цвет рамы (от 1 до 15)"; cr
      DO WHILE cr = cs
            PRINT "Раму не будет видно на фоне стен"
            INPUT "введи другой цвет (от 1 до 15)"; cr
      LOOP
      LINE (270, 230)-(370, 330), cr, BF
      LINE (272, 232)-(368, 328), 0, BF
INPUT "цвет стекла (от 1 до 15)"; cw
      DO WHILE cr = cw
            PRINT "Стекло не будет видно на фоне рамы"
            INPUT "введи другой цвет (от 1 до 15)"; cw
      LOOP
      PAINT (320, 320), cw, cr
PRINT "Повторим (Д/Н) ?"
DO
      q$ = UCASE$(INPUT$(1))
LOOP UNTIL q$ = "Д" OR q$ = "Н" OR q$ = "L" OR q$ = "Y"
LOOP WHILE q$ = "L" OR q$ = "Д"

