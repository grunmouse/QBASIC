DECLARE SUB init ()
DECLARE SUB prosess ()
DECLARE SUB result ()
DIM SHARED r(1 TO 5)
DIM SHARED i, f
CLS
CALL init
CALL prosess
CALL result

SUB init
ret: INPUT "сторона a==>", r(1)
INPUT "сторона b==>", r(2)
INPUT "сторона c==>", r(3)
r(4) = r(1): r(5) = r(2)
FOR i = 1 TO 3
IF r(1) >= r(i + 1) + r(i + 2) THEN PRINT "это не треугольник!": GOTO ret
NEXT i
END SUB

SUB prosess
f = 0
FOR i = 1 TO 3
IF r(i) * r(i) = r(i + 1) * r(i + 1) + r(i + 2) * r(i + 2) THEN f = 1: EXIT FOR
NEXT i
END SUB

SUB result
IF f = 0 THEN PRINT "в треугольнике нет прямого угла": EXIT SUB
PRINT "это прямоугольный треугольник"
PRINT "его гипотинуза - сторона "; r(i)
END SUB

