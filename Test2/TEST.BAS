DECLARE FUNCTION loading% (rg%)
DECLARE FUNCTION Testfile! (cat%)
DECLARE FUNCTION inputfile$ ()
DECLARE SUB privet ()
DECLARE FUNCTION test! (rt%)
DECLARE SUB result (mistake%)
DECLARE SUB kontrol (akey$)
DECLARE FUNCTION restart$ ()
DECLARE SUB menu (rq%)
DECLARE FUNCTION klutsch$ ()
DECLARE FUNCTION tim! ()
DECLARE SUB siren ()
DECLARE SUB vremja (an$, rt%, mis%)
DECLARE SUB ramka (R1%, C1%, R2%, C2%)
DECLARE SUB ramka1 (R1%, C1%, R2%, C2%)
DEFSTR A, Q: DEFINT C, I-N, R
TYPE filename
  n AS STRING * 8
  r AS STRING * 3
END TYPE
RANDOMIZE TIMER

ON ERROR GOTO handler
CLS
begin:
      qfile = inputfile$
OPEN qfile FOR INPUT AS #1
IF ERR = 53 GOTO handler53
INPUT #1, rq
DIM SHARED Question(rq * 2, rq * 2), Answer(rq * 2, rq * 2), j(rq * 2, rq * 2), i(rq * 2), number(rq * 2)
  IF loading(rg) THEN
  END IF
CLOSE
      akey = klutsch$
      rt = tim
DO
      CLS
      menu rq                 'Составляет массив вопросов
      privet                  'Рисует заставку для ученика
      mistake = test(rt%)     'Производит тестирование
      result mistake          'Выводит результат
      kontrol akey            'Запрашивает ключ
      q = restart$            'Предлагает повторить
      COLOR 7, 0
LOOP WHILE UCASE$(q) = "Y" OR UCASE$(q) = "Н"
END
handler53:

END

FUNCTION inputfile$
ON ERROR GOTO handlerinput
begininput:
      COLOR 10, 0
      LOCATE 10, 17: PRINT "Учитель, введи имя файла (с указанием диска)"
      LOCATE 12, 24: PRINT "с вопросами и ответами."
      COLOR 11, 0
      LOCATE 16, 26: PRINT "Нажми клавишу `Enter`"
      LOCATE 20, 35: INPUT qfile
inputfile$ = qfile
EXIT FUNCTION
handlerinput:
      CLS : COLOR 18: LOCATE 22, 25: PRINT "Неверно введено имя файла"
      COLOR 29: LOCATE 23, 31: PRINT "Повторите ввод "
      GOTO begininput
END FUNCTION

FUNCTION klutsch$
CLS
COLOR 13, 0
LOCATE 10, 17: PRINT "Учитель, введи с клавиатуры 2 любых символа."
LOCATE 12, 24: PRINT "Это будет ключ к программе."
COLOR 10, 0
LOCATE 14, 26: PRINT "Запомни или запиши ключ."
LOCATE 16, 27: INPUT "Нажми клавишу `Enter`"; akey
klutsch$ = akey
END FUNCTION

SUB kontrol (akey)
 COLOR 12, 0: CALL ramka1(20, 18, 23, 62)
   LOCATE 21, 20: PRINT "Позови учителя."
   LOCATE 22, 50: PRINT "Введи ключ"
mkey:
alkey = INPUT$(2)
IF LEFT$(alkey, 1) <> LEFT$(akey, 1) THEN alkey = "": GOTO mkey2
IF alkey <> akey THEN alkey = "": GOTO mkey ELSE GOTO mkey3
mkey2:
CALL siren
GOTO mkey
mkey3:
END SUB

FUNCTION loading (rg)
ON ERROR GOTO handlerLoad
CLS
FOR i = 1 TO rq
FOR k = 1 TO 3
1010 INPUT #1, Question(i, k)
IF ERL = 1010 THEN t = 1: GOTO endfun
NEXT
FOR n = 1 TO 10
1020 INPUT #1, Answer(i, n), j(i, n)
IF ERL = 1020 THEN t = 1: GOTO endfun
NEXT
NEXT
endfun:
loading = (t = 1)
EXIT FUNCTION
handlerLoad:
      SELECT CASE ERL
            CASE 1010, 1020
                  t = 1: GOTO endfun
            CASE ELSE
                  PRINT ""
      END SELECT
RESUME NEXT
END FUNCTION

SUB menu (rq)
FOR n = 1 TO rq
   i(n) = 0: number(n) = 0
NEXT n
FOR n = 1 TO rq
20 i(n) = INT(RND * rq + 1)
FOR m = 1 TO rq
IF i(n) = number(m) GOTO 20
NEXT m
number(n) = i(n)
PRINT number(n)
SLEEP 1
NEXT n
END SUB

SUB poisk
DIM nam AS filename, directori AS STRING
DIM cat AS STRING, cat1 AS STRING
s = 18
COLOR 0
OPEN "cat.rnd" FOR RANDOM ACCESS READ WRITE AS #1
cat = "c:\"
PUT #1, 1, cat
ia = 1
ic = 2
WIDTH 80, 50
DO
  FOR j = ia TO ic - 1
    CLS
    GET #1, j, cat
    IF LEN(cat) < 100 THEN
      FILES cat + "*.   "
      x = POS(0): y = CSRLIN
      FOR i1 = 2 TO y - 2
        FOR i2 = 0 TO 3
          a$ = ""
          FOR i = 1 TO 8
            a$ = a$ + CHR$(SCREEN(i1, i2 * s + i))
          NEXT i
          nam.n = a$
          a$ = ""
          FOR i = 13 TO s
            a$ = a$ + CHR$(SCREEN(i1, i2 * s + i))
          NEXT i
          IF LTRIM$(RTRIM$(a$)) = "<DIR>" THEN
            IF INSTR(STRING$(80, " "), nam.n) = 0 THEN
              cat1 = cat + RTRIM$(nam.n) + "\"
              PUT #1, ic, cat1
              ic = ic + 1
            END IF
          END IF
        NEXT i2
      NEXT i1
    END IF
  NEXT j
  ia = j
LOOP UNTIL j >= ic - 1
CLS
OPEN "fil.rnd" FOR RANDOM ACCESS READ WRITE AS #2
icat = ic - 1
ic = 1
FOR j = 1 TO icat
    GET #1, j, cat
    CLS
    IF LEN(cat) < 100 THEN
      FILES cat + "*.dat"
      IF ERR = 53 GOTO met1
      x = POS(0): y = CSRLIN
      FOR i1 = 2 TO y - 2
        FOR i2 = 0 TO 3
          a$ = ""
          FOR i = 1 TO 8
            a$ = a$ + CHR$(SCREEN(i1, i2 * s + i))
          NEXT i
          nam.n = a$
          a$ = ""
          IF INSTR(STRING$(80, " "), nam.n) = 0 THEN
            cat1 = cat + RTRIM$(nam.n) + ".dat"
            IF Testfile(cat1) THEN
              PUT #2, ic, cat1
              ic = ic + 1
            END IF
          END IF
        NEXT i2
      NEXT i1
    END IF
met1:
NEXT j
COLOR 7
CLS
CLOSE

END SUB

SUB privet
COLOR 11, 0
CALL ramka(1, 1, 24, 80)
COLOR 10, 0
CALL ramka(3, 12, 8, 64)
LOCATE 4, 24: PRINT "Вам будет задано 10 вопросов. "
LOCATE 5, 13: PRINT "К каждому вопросу будет предложено по пять ответов."
LOCATE 6, 24: PRINT "Только один из них правильный."
LOCATE 7, 16: PRINT "Выберите правильный ответ и введите его номер."
CALL ramka(19, 23, 21, 53): LOCATE 20, 24: PRINT "Для продолжения нажми пробел."
DO
LOOP UNTIL INKEY$ = CHR$(32)
END SUB

SUB ramka (R1, C1, R2, C2)
FOR iram = C1 + 1 TO C2 - 1
LOCATE R1, iram: PRINT CHR$(196);
NEXT
LOCATE R1, C2: PRINT CHR$(191);
FOR iram = R1 + 1 TO R2 - 1
LOCATE iram, C2: PRINT CHR$(179);
NEXT
LOCATE R2, C2: PRINT CHR$(217);
FOR iram = C2 - 1 TO C1 + 1 STEP -1
LOCATE R2, iram: PRINT CHR$(196);
NEXT
LOCATE R2, C1: PRINT CHR$(192);
FOR iram = R2 - 1 TO R1 + 1 STEP -1
LOCATE iram, C1: PRINT CHR$(179);
NEXT
LOCATE R1, C1: PRINT CHR$(218);
END SUB

SUB ramka1 (R1, C1, R2, C2)
FOR iram = C1 + 1 TO C2 - 1
LOCATE R1, iram: PRINT CHR$(205);
NEXT
LOCATE R1, C2: PRINT CHR$(187);
FOR iram = R1 + 1 TO R2 - 1
LOCATE iram, C2: PRINT CHR$(186);
NEXT
LOCATE R2, C2: PRINT CHR$(188);
FOR iram = C2 - 1 TO C1 + 1 STEP -1
LOCATE R2, iram: PRINT CHR$(205);
NEXT
LOCATE R2, C1: PRINT CHR$(200);
FOR iram = R2 - 1 TO R1 + 1 STEP -1
LOCATE iram, C1: PRINT CHR$(186);
NEXT
LOCATE R1, C1: PRINT CHR$(201);
END SUB

FUNCTION restart$
CLS
   COLOR 12, 0: CALL ramka1(10, 26, 14, 50)
   COLOR 7: LOCATE 12, 29: PRINT "Повторить (Y/n)?";
   q = INPUT$(1)
WHILE INSTR("yYNnНнТт", q) = 0
   q = INPUT$(1)
WEND
restart$ = q
END FUNCTION

SUB result (mistake)
  CLS
  COLOR 10, 0
  CALL ramka(2, 3, 24, 78): CALL ramka(11, 20, 15, 60)
  COLOR 13, 0
SELECT CASE mistake
  CASE 0
      LOCATE 12, 23: PRINT "Все правильно.";
      LOCATE 14, 30: PRINT "Отлично! (5)"
  CASE 1
      LOCATE 12, 23: PRINT "Допущена одна ошибка.";
      LOCATE 14, 30: PRINT "Хорошо. (4)"
  CASE 2
      LOCATE 12, 23: PRINT "Допущено 2 ошибки.";
      LOCATE 14, 30: PRINT "Хорошо. (4)"
  CASE 3 TO 4
      LOCATE 12, 22: PRINT "Допущено"; mistake; "ошибки.";
      LOCATE 14, 28: PRINT "Удовлетворительно. (3)"
  CASE ELSE
      LOCATE 12, 22: PRINT "Допушено "; mistake; "ошибок.";
      LOCATE 14, 28: PRINT "Учи еще!   Плохо! (2)"
END SELECT
END SUB

SUB siren
COLOR 27, 0: LOCATE 4, 30: PRINT "Не балуй!":
COLOR 29, 0: LOCATE 6, 36: PRINT "Позови учителя!"
COLOR 28, 0: LOCATE 8, 26: PRINT "Не трогай клавиши!"
htone = 800: range = 650
WHILE INKEY$ = ""
FOR count = range TO -range STEP -4
SOUND htone - ABS(count), .3
NEXT
WEND
END SUB

FUNCTION test (rt%)
  mistake = 0
FOR i = 1 TO 10
   CLS
   COLOR 10, 0
   CALL ramka(1, 1, 24, 80)
   COLOR 11, 0
   LOCATE 3, 32: PRINT "Вопрос "; CHR$(252); i
FOR k = 1 TO 3
   CALL ramka(4, 3, 8, 78): LOCATE 4 + k, 4: PRINT Question(number(i), k)
NEXT
FOR l = 1 TO 10
    l1 = INT((l - 1) \ 2 + 1): al = STR$(l1)
    CALL ramka(9, 4, 20, 78)
    IF (l + 1) MOD 2 = 0 THEN LOCATE 9 + l, 5: PRINT al + CHR$(41); Answer(number(i), l): GOTO meta
    LOCATE 9 + l, 8: PRINT Answer(number(i), l)
meta:
NEXT l
    COLOR 11, 0: CALL ramka(20, 21, 22, 56):  LOCATE 20, 52: PRINT CHR$(194);
    LOCATE 22, 52: PRINT CHR$(193); : LOCATE 21, 52: PRINT CHR$(179);
    LOCATE 21, 22: PRINT "Введи номер правильного ответа";
    an = ""
CALL vremja(an, rt%, mis%)
   
    n% = VAL(an): an = "": LOCATE 21, 53: PRINT n%
FOR ir = 1 TO 10
LOCATE 9 + ir, 5: PRINT SPC(73);
NEXT ir
IF mis% = 1 THEN COLOR 28, 0, 0: LOCATE 21, 54: PRINT CHR$(88)
IF mis% = 1 THEN COLOR 28, 0, 0: LOCATE 21, 22: PRINT "   Время на ответ истекло     "
COLOR 13, 0
CALL ramka(13, 23, 15, 54): LOCATE 14, 25: PRINT "Для продолжения нажми пробел."
COLOR 10, 0
DO
LOOP UNTIL INKEY$ = CHR$(32)
CLS
IF j(number(i), 2 * n%) THEN GOTO 2
   mistake = mistake + 1
2 NEXT i
test = mistake
END FUNCTION

FUNCTION Testfile (cat)
100 OPEN qfile FOR INPUT AS #1
IF ERL = 100 THEN t = 1: GOTO endtst
INPUT #1, rq
DIM SHARED Question(rq * 2, rq * 2), Answer(rq * 2, rq * 2), j(rq * 2, rq * 2), i(rq * 2), number(rq * 2)
  IF loading(rg) THEN t = 1
endtst:
CLOSE
Testfile = (t = 1)
END FUNCTION

FUNCTION tim
CLS
COLOR 13, 0
LOCATE 12, 17: PRINT " Учитель, введи время в секундах для"
LOCATE 13, 17: PRINT "  обдумывания ответа на один вопрос"
LOCATE 14, 17: PRINT "************************************"
COLOR 10, 0
LOCATE 16, 27: INPUT "Нажми клавишу `Enter`"; rt
IF rt <= 10 THEN rt = 10
tim = rt
END FUNCTION

SUB vremja (an, rt%, mis%)
vid$ = "& ## & ## "
t = rt%  'Время на ответ в секундах
tr = TIMER
t0 = tr + t
FOR k = 2 TO 79
COLOR 14, 0, 12
LOCATE 23, k: PRINT CHR$(177)
NEXT
WHILE an = ""
  an = INKEY$
  trn = TIMER: t1 = t0 - trn
  LOCATE 2, 48: COLOR 14, 0, 0
  PRINT USING vid$; "время на ответ =>"; t1 \ 60; "мин"; t1 MOD 60; "сек"
  IF an = "1" OR an = "2" OR an = "3" OR an = "4" OR an = "5" THEN mis% = 0: GOTO met21 ELSE an = ""
  tr1 = 79 - INT(79 / t * t1)
  COLOR 7, 0, 0: 'LOCATE 15, 15: PRINT tr1, l, t1
  IF tr1 <= 1 THEN tr1 = 2
  IF tr1 >= 80 THEN mis% = 1: GOTO met21
  LOCATE 23, tr1: PRINT " "

WEND
met21:

END SUB

