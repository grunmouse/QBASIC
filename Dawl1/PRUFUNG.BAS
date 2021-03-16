DO
CLS
COLOR 7
PRINT "Нажми:"
PRINT "1 - Создать файл"
PRINT "2 - Открыть существующий файл"
PRINT "3 - Выход"
Q = VAL(INPUT$(1))
CLS
SELECT CASE Q
      CASE 1
            INPUT "Введи полный путь создаваемого файла: ", A$
            OPEN A$ FOR OUTPUT AS #1
            FOR i = 1 TO 10
                  PRINT "Введи оценку студента "; i
                  PRINT " - ";
                  b = VAL(INPUT$(1))
                  SELECT CASE b
                        CASE 2
                              PRINT "неуд"
                        CASE 3
                              PRINT "удов"
                        CASE 4
                              PRINT "хор"
                        CASE 5
                              PRINT "отл"
                  END SELECT
                  WRITE #1, b
            NEXT
            CLOSE
      CASE 2
            INPUT "Введи полный путь открываемого файла: ", A$
            OPEN A$ FOR INPUT AS #1
            DIM o5, o4, o2
            FOR i = 1 TO 10
                  INPUT #1, b
                  SELECT CASE b
                        CASE 5
                              o5 = o5 + 1
                        CASE 4
                              o4 = o4 + 1
                        CASE 2
                              o2 = o2 + 1
                  END SELECT
            NEXT
            CLOSE
            PRINT "сдали на отл "; o5
            PRINT "сдали на хор "; o4
            PRINT "не сдали "; o2
            PRINT
            PRINT "нажми любую клавишу"
            A$ = INPUT$(1)
      CASE 3
      END
END SELECT
LOOP

