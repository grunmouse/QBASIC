DEFINT A-Z
TYPE MonthType
   Number AS INTEGER
   MName AS STRING * 9
END TYPE
DECLARE FUNCTION IsLeapYear% (N%)
DECLARE FUNCTION GetInput% (Prompt$, Row%, LowVal%, HighVal%)
DECLARE SUB PrintCalendar (Year%, Month%, d%, flag%)
DECLARE SUB ComputeMonth (Year%, Month%, StartDay%, TotalDays%)
DIM MonthData(1 TO 12) AS MonthType
FOR i = 1 TO 12
   READ MonthData(i).MName, MonthData(i).Number
NEXT
DO
   CLS
   PRINT "Нажми пробел, если тебе нужен календарь текущего месяца."
   PRINT "Нажми любую другую клавишу для расчета календаря другого месяца."
   DO
     a$ = INPUT$(1)
   LOOP WHILE a$ = ""
   CLS
   IF a$ <> " " THEN
     Year = GetInput("Год (1899 - 2099): ", 1, 1899, 2099)
     Month = GetInput("Месяц (1 - 12): ", 2, 1, 12)
     CLS
     PrintCalendar Year, Month, 0, 0
   END IF
   Year = VAL(MID$(DATE$, 7, 4)): Month = VAL(MID$(DATE$, 1, 2))
   d = VAL(MID$(DATE$, 4, 2))
   PrintCalendar Year, Month, d, 1
   LOCATE 20, 1
   PRINT "Повториь? ";
   LOCATE , , 1, 0, 13
   DO
   Resp$ = INPUT$(1)
   LOOP WHILE INSTR("YyNn", Resp$) = 0
   PRINT Resp$
LOOP WHILE UCASE$(Resp$) = "Y"
END
DATA "Январь", 31,"Февраль" ,28, "Март", 31
DATA "Апрель", 30, "Май", 31, "Июнь", 30, "Июль", 31, "Август", 31
DATA "Сентябрь", 30, "Октябрь", 31, "Ноябрь", 30, "Декабрь", 31

SUB ComputeMonth (Year, Month, StartDay, TotalDays) STATIC
   SHARED MonthData() AS MonthType
   CONST LEAP = 366 MOD 7
   CONST NORMAL = 365 MOD 7
   NumDays = -1
   FOR i = 1899 TO Year - 1
      IF IsLeapYear(i) THEN         ' If year is leap, add
         NumDays = NumDays + LEAP   ' 366 MOD 7.
      ELSE                          ' If normal year, add
         NumDays = NumDays + NORMAL ' 365 MOD 7.
      END IF
   NEXT
   FOR i = 1 TO Month - 1
      NumDays = NumDays + MonthData(i).Number
   NEXT
   TotalDays = MonthData(Month).Number
   IF IsLeapYear(Year) THEN
      IF Month > 2 THEN
         NumDays = NumDays + 1
      ELSEIF Month = 2 THEN
         TotalDays = TotalDays + 1
      END IF
   END IF
   StartDay = NumDays MOD 7
END SUB

FUNCTION GetInput (Prompt$, Row, LowVal, HighVal) STATIC
   LOCATE Row, 1, 1, 0, 13
   PRINT Prompt$;
   Column = POS(0)
   DO
      LOCATE Row, Column
      PRINT SPACE$(10)
      LOCATE Row, Column
      INPUT "", Value
   LOOP WHILE (Value < LowVal OR Value > HighVal)
   GetInput = Value
END FUNCTION

'
' ====================== ISLEAPYEAR ==========================
'         Determines if a year is a leap year or not.
' ============================================================
'
FUNCTION IsLeapYear (N) STATIC

   ' If the year is evenly divisible by 4 and not divisible
   ' by 100, or if the year is evenly divisible by 400, then
   ' it's a leap year:
   IsLeapYear = (N MOD 4 = 0 AND N MOD 100 <> 0) OR (N MOD 400 = 0)
END FUNCTION

SUB PrintCalendar (Year, Month, d, flag) STATIC
SHARED MonthData() AS MonthType
   ComputeMonth Year, Month, StartDay, TotalDays
   Header$ = RTRIM$(MonthData(Month).MName) + "," + STR$(Year)
   LeftMargin = (35 - LEN(Header$)) \ 2
   LOCATE 1, 1 + LeftMargin + 40 * flag: PRINT Header$
   LOCATE 3, 1 + 40 * flag: PRINT "Пн   Вт   Ср   Чт   Пт   Сб   Вс"
   LeftMargin = 5 * StartDay
   LOCATE 5, 1 + LeftMargin + 40 * flag
   y = 5
   FOR i = 1 TO TotalDays
      IF i = d THEN COLOR 15
      PRINT USING "##   "; i;
      IF i = d THEN COLOR 7
      IF POS(0) > 32 + 40 * flag THEN y = y + 2: LOCATE y, 1 + 40 * flag
   NEXT
   LOCATE 15, 15 + 40 * flag
   IF flag = 1 THEN PRINT "Текущий" ELSE PRINT "Заданный"
END SUB

