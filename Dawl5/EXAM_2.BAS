CLS
ns = 21  'к-во студентов
DIM s$(ns), oc(ns, 4), sr(ns)
n = 0
FOR i = 1 TO ns
      READ s$(i) 'считывание Ф.И.О. студента
      FOR j = 1 TO 4
            READ oc(i, j)  'считывание оценок
      NEXT j
      sr(i) = (oc(i, 1) + oc(i, 2) + oc(i, 3) + oc(i, 4)) / 4 'ср. балл
      IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN n = n + 1
NEXT i
CLS
PRINT "Результаты сессии:"
PRINT " № ) Ф.И.О.";
FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
PRINT
PRINT STRING$(48, "-")
FOR i = 1 TO ns
      PRINT i; ") "; s$(i);
      FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(i, j); : NEXT j
      PRINT
NEXT i
DIM sx(n), sxf(n)
j = 1
FOR i = 1 TO ns
      IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN sx(j) = i: j = j + 1
NEXT i
FOR i = 1 TO n
      max = 0
      FOR j = 1 TO n
            IF sr(sx(j)) > sr(sx(max)) THEN max = j
      NEXT j
      sxf(i) = sx(max): sx(max) = 0
NEXT i
DO: LOOP WHILE INKEY$ = ""
PRINT
PRINT "Сдали на хор. и отл.:"
PRINT " № ) Ф.И.О.";
FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
PRINT TAB(50); "ср."
PRINT STRING$(55, "-")
FOR i = 1 TO n
      PRINT i; ") "; s$(sxf(i));
      FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(sxf(i), j); : NEXT j
      PRINT TAB(50); sr(sxf(i))
NEXT i
DO: LOOP WHILE INKEY$ = ""
END
1000 DATA "Иванов И.И.", 4, 4, 4, 4        
1010 DATA "Петров П.П.", 5, 4, 5, 5        
1020 DATA "Сидоров С.С.", 3, 4, 5, 4       
1030 DATA "Ульянов У.У.", 4, 5, 4, 5       
1040 DATA "Абрамовский А.А.", 5, 4, 4, 3   
1050 DATA "Макаров М.М.", 4, 4, 3, 3       
1060 DATA "Владимиров В.В.", 3, 3, 3, 3    
1070 DATA "Фролов Ф.Ф.", 4, 3, 4, 3        
1080 DATA "Жданов П.Б.", 4, 4, 4, 5        
1090 DATA "Исаев М.М.", 5, 5, 5, 4        
1100 DATA "Ткаченко М.Б.", 5, 5, 5, 5     
1110 DATA "Высоцкий А.И.", 5, 5, 4, 5     
1120 DATA "Хрумов А.Б.", 5, 5, 5, 5       
1130 DATA "Черный Т.К.", 4, 4, 4, 4       
1140 DATA "Долгих В.Б.", 3, 5, 5, 5  
1150 DATA "Белый Д.К.", 4, 4, 4, 3   
1160 DATA "Тер А.А.", 4, 4, 5, 5     
1170 DATA "Крекер К.Б.", 5, 4, 4, 4  
1180 DATA "Карвель А.И.", 4, 4, 4, 4
1190 DATA "Загоруйко П.И.", 5, 4, 5,4
1200 DATA "Яворский К.М.", 4, 4, 3,4

