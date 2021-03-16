DO
CLS
PRINT "Нажми цифровую клавишу:"
PRINT "1. Создать..."
PRINT "2. Открыть для просмотра..."
PRINT "3. Открыть для добавления..."
PRINT "4. Выход"
DO
      q = VAL(UCASE$(INPUT$(1)))
LOOP UNTIL q > 0 AND q < 5
IF q = 4 THEN END
INPUT "Введи полный путь файла:  ", f$
MetOpen:
CLS
SELECT CASE q
      CASE 1
            OPEN f$ FOR OUTPUT AS #1
      CASE 2
            OPEN f$ FOR INPUT AS #1
      CASE 3
            OPEN f$ FOR APPEND AS #1
END SELECT
PRINT f$
SELECT CASE q
      CASE 1, 3
            DO
            CLS
            INPUT "Сколько записей вы хотите добавить? ", kv
            FOR i = 1 TO kv
                  INPUT "Наименование телепередачи: ", n$
                  INPUT "Время показа (чч:мм): ", t$
                  WRITE #1, n$, t$
            NEXT
            CLS
            PRINT "Нажми цифровую клавишу:"
            PRINT "1. Открыть этот файл для просмотра"
            PRINT "2. Продолжить добавление в этот файл"
            PRINT "3. Закрыть файл"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 4
            IF q1 = 1 THEN q = 2: CLOSE : GOTO MetOpen
            LOOP UNTIL q1 = 3
      CASE 2
            CLS
            PRINT "Нажми цифровую клавишу:"
            PRINT "1. Вывести список телепередач"
            PRINT "2. Найти программу по времени"
            PRINT "3. Найти время телепередачи"
            PRINT "4. Отменить просмотр"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 5
            IF q1 < 4 THEN
                  ut$ = "": un$ = ""
                  SELECT CASE q1
                        CASE 2
                              INPUT "Введи время (чч:мм): ", ut$
                        CASE 3
                              INPUT "Введи название передачи: ", un$
                  END SELECT
                  CLS
                  DO
                        INPUT #1, n$, t$
                        IF q1 = 1 OR t$ = ut$ OR n$ = un$ THEN
                              PRINT t$, n$
                        END IF
                  LOOP UNTIL EOF(1)
            END IF
            PRINT "Нажми цифровую клавишу:"
            PRINT "1. Продолжить (возобновить) просмотр файла"
            PRINT "2. Открыть этот файл для добавления"
            PRINT "3. Закрыть файл"
            DO
                  q1 = VAL(UCASE$(INPUT$(1)))
            LOOP UNTIL q1 > 0 AND q < 4
            CLOSE
            IF q1 = 2 THEN q = 3: GOTO MetOpen
            IF q1 = 1 THEN q = 2: GOTO MetOpen
END SELECT
CLOSE
LOOP

