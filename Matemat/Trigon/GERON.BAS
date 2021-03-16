'GERON.BAS
'Программа на языке BASIC
'Разработана учеником 10"Б" Раковым Дмитрием
'Предназначена для вычисления площади треугольника по его сторонам
CLS
vvod:
CLS
LOCATE 10, 30: INPUT "введите сторону a"; A
CLS
LOCATE 10, 30: INPUT "введите сторону b"; B
CLS
LOCATE 10, 30: INPUT "введите сторону c"; C
P = (A + B + C) / 2
LOCATE 11, 20
IF P <= A THEN PRINT "такого треугольника не существует": GOTO vvod
IF P <= B THEN PRINT "такого треугольника не существует": GOTO vvod
IF P <= C THEN PRINT "такого треугольника не существует": GOTO vvod
S = (P * (P - A) * (P - B) * (P - C)) ^ .5
CLS
LOCATE 10, 20: PRINT "площадь треугольника равна  "; S
END

