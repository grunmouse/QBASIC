SCREEN 0
CLS
PRINT "Программа для решения уравнений вида ax^2 + bx + c = 0"
INPUT "a = ", a
INPUT "b = ", b
INPUT "c = ", c
d = b ^ 2 - 4 * a * b
IF a = 0 THEN
      x = -c / b
      PRINT "Уравнение имеет один корень равный "; x
ELSEIF d < 0 THEN
      PRINT "Уравнение не имеет действительных корней"
ELSEIF d = 0 THEN
      x = -b / (2 * a)
      PRINT "Уравнение имеет один корень равный "; x
ELSEIF d > 0 THEN
      x1 = (-b - d ^ .5) / (2 * a)
      x2 = (-b + d ^ .5) / (2 * a)
      PRINT "Уравнение имеет два корня равные "; x1; " и "; x2
END IF

