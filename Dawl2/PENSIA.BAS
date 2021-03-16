SCREEN 0
CLS
INPUT "Введите год вашего рождения ", g
PRINT "Введите ваш пол (М/Ж)"
DO
      p$ = UCASE$(INPUT$(1))
LOOP UNTIL p$ = "М" OR p$ = "Ж" OR p$ = "V" OR p$ = ";" OR p$ = ":"
IF p$ = "М" OR p$ = "V" THEN v = g + 60
IF p$ = "Ж" OR p$ = ";" OR p$ = ":" THEN v = g + 55
PRINT "Вы уйдете на пенсию в "; v; " году"

