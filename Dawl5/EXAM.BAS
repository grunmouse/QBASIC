10 CLS
20 INPUT "Введи к-во студентов - ", ns
30 DIM s$(ns), oc(ns, 4), sr(ns)
40 PRINT "Введи результаты сессии:"
50 n = 0
60 FOR i = 1 TO ns
70 PRINT "Студент №"; i
80 INPUT "Ф.И.О.: ", s$(i)
90 FOR j = 1 TO 4
100 PRINT "Оценка по"; j; "экз.: ";
110 INPUT "", oc(i, j)
120 NEXT j
130 sr(i) = (oc(i, 1) + oc(i, 2) + oc(i, 3) + oc(i, 4)) / 4
140 IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN n = n + 1
150 NEXT i
160 CLS
170 PRINT "Результаты сессии:"
180 PRINT " № ) Ф.И.О.";
190 FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
200 PRINT
210 PRINT STRING$(48, "-")
220 FOR i = 1 TO ns
230 PRINT i; ") "; s$(i);
240 FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(i, j); : NEXT j
250 PRINT
260 NEXT i
270 DIM sx(n), sxf(n)
280 j = 1
290 FOR i = 1 TO ns
300 IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN sx(j) = i: j = j + 1
310 NEXT i
320 FOR i = 1 TO n
330 max = 0
340 FOR j = 1 TO n
350 IF sr(sx(j)) > sr(sx(max)) THEN max = j
360 NEXT j
370 sxf(i) = sx(max): sx(max) = 0
380 NEXT i
385 DO: LOOP WHILE INKEY$ = ""
390 PRINT
400 PRINT "Сдали на хор. и отл.:"
410 PRINT " № ) Ф.И.О.";
420 FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
430 PRINT
440 PRINT STRING$(48, "-")
450 FOR i = 1 TO n
460 PRINT i; ") "; s$(sxf(i));
470 FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(sxf(i), j); : NEXT j
480 PRINT
490 NEXT i
500 DO: LOOP WHILE INKEY$ = ""
510 END

