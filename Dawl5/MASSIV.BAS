5 DIM m(9)
10 CLS
20 PRINT "Введи значения элементов масива:"
30 FOR i = 0 TO 9
40 PRINT "m("; i; ") = ";
50 INPUT "", m(i)
60 NEXT i
70 imin = 0: imax = 0
80 FOR i = 1 TO 9
90 IF m(i) > m(imax) THEN imax = i
100 IF m(i) < m(imin) THEN imin = i
110 NEXT i
120 PRINT "m(min) = m("; imin; ") = "; m(imin),
130 PRINT "m(max) = m("; imax; ") = "; m(imax)
140 tmp = m(imin)
150 m(imin) = m(imax)
160 m(imax) = tmp
170 PRINT "Новые значения элементов массива:"
180 FOR i = 0 TO 9
190 PRINT "m("; i; ") = "; m(i)
200 NEXT i
210 PRINT "m(max) = m("; imin; ") = "; m(imin),
220 PRINT "m(min) = m("; imax; ") = "; m(imax)
230 END

