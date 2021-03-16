DECLARE SUB siren ()
DECLARE SUB vremja (an$, rt%, mis%)
DECLARE SUB ramka (R1%, C1%, R2%, C2%)
DECLARE SUB ramka1 (R1%, C1%, R2%, C2%)
DEFSTR A, Q: DEFINT C, I-N, R
RANDOMIZE TIMER
ON ERROR GOTO handler
CLS
begin:
COLOR 10, 0
LOCATE 10, 17: PRINT "Учитель, введи имя файла (с указанием диска)"
LOCATE 12, 24: PRINT "с вопросами и ответами."
COLOR 11, 0
LOCATE 16, 26: PRINT "Нажми клавишу `Enter`"
LOCATE 20, 35: INPUT qfile
OPEN qfile FOR INPUT AS #1
INPUT #1, rq
DIM Question(rq * 2, rq * 2): DIM Answer(rq * 2, rq * 2): DIM j(rq * 2, rq * 2)
DIM i(rq * 2): DIM number(rq * 2)
CLS
FOR i = 1 TO rq
FOR k = 1 TO 3
INPUT #1, Question(i, k)
NEXT
FOR n = 1 TO 10
INPUT #1, Answer(i, n), j(i, n)
NEXT
NEXT
CLOSE
CLS
COLOR 13, 0
LOCATE 10, 17: PRINT "Учитель, введи с клавиатуры 2 любых символа."
LOCATE 12, 24: PRINT "Это будет ключ к программе."
COLOR 10, 0
LOCATE 14, 26: PRINT "Запомни или запиши ключ."
LOCATE 16, 27: INPUT "Нажми клавишу `Enter`"; akey
CLS
COLOR 13, 0
LOCATE 12, 17: PRINT " Учитель, введи время в секундах для"
LOCATE 13, 17: PRINT "  обдумывания ответа на один вопрос"
LOCATE 14, 17: PRINT "************************************"
COLOR 10, 0
LOCATE 16, 27: INPUT "Нажми клавишу `Enter`"; rt
IF rt <= 10 THEN rt = 10
1 CLS :
FOR n = 1 TO rq
   i(n) = 0: number(n) = 0
NEXT n
FOR n = 1 TO rq
20 i(n) = INT(RND * rq + 1)
FOR m = 1 TO rq
IF i(n) = number(m) GOTO 20
NEXT m
number(n) = i(n)
NEXT n
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
  CLS
  COLOR 10, 0
  CALL ramka(2, 3, 24, 78): CALL ramka(11, 20, 15, 60)
  COLOR 13, 0
SELECT CASE mistake
  CASE 0
      LOCATE 12, 23: PRINT "Все правильно.";
      LOCATE 14, 30: PRINT "Отлично! (5)": GOTO 3
  CASE 1
      LOCATE 12, 23: PRINT "Допущена одна ошибка.";
      LOCATE 14, 30: PRINT "Хорошо. (4)": GOTO 3
  CASE 2
      LOCATE 12, 23: PRINT "Допущено 2 ошибки.";
      LOCATE 14, 30: PRINT "Хорошо. (4)": GOTO 3
  CASE 3 TO 4
      LOCATE 12, 22: PRINT "Допущено"; mistake; "ошибки.";
      LOCATE 14, 28: PRINT "Удовлетворительно. (3)": GOTO 3
  CASE ELSE
      LOCATE 12, 22: PRINT "Допушено "; mistake; "ошибок.";
      LOCATE 14, 28: PRINT "Учи еще!   Плохо! (2)"
END SELECT
3 COLOR 12, 0: CALL ramka1(20, 18, 23, 62)
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
CLS
   COLOR 12, 0: CALL ramka1(10, 26, 14, 50)
   COLOR 7: LOCATE 12, 29: PRINT "Повторить (Y/n)?";
   q = INPUT$(1)
WHILE INSTR("yYNnНнТт", q) = 0
   q = INPUT$(1)
WEND
COLOR 7, 0
IF q = "y" OR q = "Y" GOTO 1
IF q = "Н" OR q = "н" GOTO 1 ELSE END
handler:
 SELECT CASE ERR
        CASE 53
           CLS : COLOR 18: LOCATE 22, 25: PRINT "Неверно введено имя файла"
           COLOR 29: LOCATE 23, 31: PRINT "Повторите ввод "
           GOTO begin
        CASE ELSE
           CLS : COLOR 13: LOCATE 12, 29:
           PRINT "Ошибка программы"
           COLOR 18: LOCATE 12, 29: PRINT "Перезагрузите компьютер"
END SELECT
END

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

