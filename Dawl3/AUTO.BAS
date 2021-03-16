DEFSTR Q
DO
CLS
PRINT "Нажми:"
PRINT "1) - открыть"
PRINT "2) - создать"
PRINT "3) - выход"
DO
      cx = VAL(INPUT$(1))
LOOP UNTIL cx > 0 AND cx < 4
CLS
SELECT CASE cx
      CASE 1
INPUT "Введи полный путь файла"; q
OPEN q FOR INPUT AS #1
INPUT #1, n
INPUT "Введи марку автомобиля"; qm
FOR i = 1 TO n
      INPUT #1, qnam, kol
      IF qm = qnam THEN kvo = kol: EXIT FOR
      kol = 0
NEXT
PRINT "К-во автомобилей марки "; qm; " - "; kvo
DO
LOOP WHILE INKEY$ = ""
CLOSE
      CASE 2
INPUT "Введи полный путь файла"; q
OPEN q FOR OUTPUT AS #1
INPUT "Введи число марок", n
WRITE #1, n
FOR i = 1 TO n
      INPUT "Введи марку автомобиля"; qnam
      INPUT "Введи их число на складе", qkol
      kol = VAL(qkol)
      WRITE #1, qnam, kol
NEXT
CLOSE
      CASE 3
            END
END SELECT
LOOP

