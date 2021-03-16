CLS
PRINT "Программа для расчета массива элементов по формуле a(n)=n^2+1"
INPUT "Hазмерность массива ", n
DIM a(n)
l = 0
PRINT "В массиве содержатся следующие четные элементы:"
FOR i = 0 TO n
      a(i) = i ^ 2 + 1
      IF a(i) MOD 2 = 0 THEN
            PRINT TAB(4); a(i)
      ELSE
            l = l + 1
      END IF
NEXT i
PRINT "В массиве содержится"; l; "нечетных элементов"

