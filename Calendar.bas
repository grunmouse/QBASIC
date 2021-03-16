DECLARE SUB CheckBoxForm ()
DECLARE SUB CheckBox (n AS STRING)
DECLARE SUB ramka1 (R1%, C1%, R2%, C2%)
DECLARE FUNCTION Feiertag$ (Month%, Day%)
DECLARE SUB ComputeMonth (Year%, Month%, StartDay%, TotalDays%)
DECLARE FUNCTION ComputePeriod% (Year%, Month%, Day%, Period%, Y2%, M2%, D2%)
DECLARE SUB PrintCalendar (Year%, Month%, d%)
DECLARE FUNCTION IsleapYear% (n%)
DEFINT A-Z
TYPE MonthType
   Number AS INTEGER
   MName AS STRING * 9
END TYPE
DIM SHARED directori AS STRING
DIM SHARED MonthData(1 TO 12) AS MonthType
DIM SHARED n(10) AS INTEGER
RESTORE datacalendar
      FOR i = 1 TO 12
         READ MonthData(i).MName, MonthData(i).Number
      NEXT
Y = VAL(MID$(DATE$, 7, 4))
M = VAL(MID$(DATE$, 1, 2))
d = VAL(MID$(DATE$, 4, 2))
CLS
COLOR 4
ramka1 1, 1, 24, 80
LOCATE 2, 2: COLOR 14
PrintCalendar Y, M, d
CheckBoxForm
END
datacalendar:
  DATA "Январь", 31,"Февраль" , 28, "Март", 31
  DATA "Апрель", 30, "Май", 31, "Июнь", 30, "Июль", 31, "Август", 31
  DATA "Сентябрь", 30, "Октябрь", 31, "Ноябрь", 30, "Декабрь", 31

SUB CheckBox (n AS STRING)
      LOCATE , 41
      COLOR 2: PRINT "";
      COLOR 15: PRINT "[ ]";
      COLOR 7: PRINT n;
      COLOR 2: PRINT ""
END SUB

SUB CheckBoxForm
      ramka1 2, 40, 17, 79
      COLOR 15: LOCATE 3, 51: PRINT "Отображать:"
      CheckBox "Выделять текущую дату"
      CheckBox "Выделять воскресенье"
      CheckBox "Выделять субботу"

END SUB

SUB ComputeMonth (Year, Month%, StartDay%, TotalDays%) STATIC
   SHARED MonthData() AS MonthType
   CONST LEAP = 366 MOD 7
   CONST NORMAL = 365 MOD 7
   NumDays% = -1
   FOR i = 1899 TO Year - 1
      IF IsleapYear(i) THEN
         NumDays% = NumDays% + LEAP
      ELSE
         NumDays% = NumDays% + NORMAL
      END IF
   NEXT
   FOR i = 1 TO Month% - 1
      NumDays% = NumDays% + MonthData(i).Number
   NEXT
   TotalDays% = MonthData(Month%).Number
   IF IsleapYear(Year) THEN
      IF Month% > 2 THEN
         NumDays% = NumDays% + 1
      ELSEIF Month% = 2 THEN
         TotalDays% = TotalDays% + 1
      END IF
   END IF
   StartDay% = NumDays% MOD 7
END SUB

FUNCTION ComputePeriod (Year, Month%, Day%, Period%, Y2, M2%, D2%) STATIC
   SHARED MonthData() AS MonthType
   LEAP% = 366 MOD Period%
   NORMAL% = 365 MOD Period%
   NumDays% = D2%
   FOR i = Y2 TO Year - 1
      IF IsleapYear(i) THEN
         NumDays% = NumDays% + LEAP%
      ELSE
         NumDays% = NumDays% + NORMAL%
      END IF
   NEXT
   FOR i = 1 TO Month% - 1
      NumDays% = NumDays% + MonthData(i).Number
   NEXT
   TotalDays% = MonthData(Month%).Number
   IF IsleapYear(Year) THEN
      IF Month% > 2 THEN
         NumDays% = NumDays% + 1
      ELSEIF Month% = 2 THEN
         TotalDays% = TotalDays% + 1
      END IF
   END IF
   ComputePeriod = (Day% - NumDays% MOD Period%) MOD Period%
END FUNCTION

FUNCTION Feiertag$ (Month, Day)
   FOR i = 1 TO Month% - 1
      ND = ND + MonthData(i).Number
   NEXT
   IF Month > 2 THEN ND = ND + 1
      OPEN directori + "feiertag.dat" FOR RANDOM AS #1
          GET #1, ND + Day, ap$
      CLOSE
      Feiertag$ = ap$
END FUNCTION

FUNCTION IsleapYear% (n) STATIC
   IsleapYear% = (n MOD 4 = 0 AND n MOD 100 <> 0) OR (n MOD 400 = 0)
END FUNCTION

SUB PrintCalendar (Year, Month%, d%) STATIC
SHARED MonthData() AS MonthType
   ramka1 2, 2, 17, 39
   x0 = 3
   y0 = 2
   ComputeMonth Year, Month%, StartDay%, TotalDays%
   Header$ = RTRIM$(MonthData(Month%).MName) + "," + STR$(Year)
   LeftMargin% = (35 - LEN(Header$)) \ 2
   COLOR 15
   LOCATE y0 + 1, x0 + 1 + LeftMargin%: PRINT Header$
   LOCATE y0 + 3, x0 + 1: PRINT " Пн   Вт   Ср   Чт   Пт   Сб   Вс"
   LeftMargin% = 5 * StartDay%
   LOCATE y0 + 5, x0 + 1 + LeftMargin%
   Y = 5
   FOR i = 1 TO TotalDays%
      IF POS(0) > 27 THEN co = 4 ELSE co = 7
      IF ComputePeriod(Year, Month%, i, 4, 2001, 1, 10) = 0 THEN co = 1
      IF Feiertag$(Month%, i) <> "" THEN co = 12
      IF i = d THEN
        IF co < 9 THEN co = co + 8
        ELSEIF co > 7 AND co < 16 THEN co = co + 16
      END IF
      COLOR co
      PRINT USING " ##  "; i;
      IF POS(0) > 32 + x0 THEN Y = Y + 2: LOCATE y0 + Y, x0 + 1
   NEXT
ap$ = Feiertag$(Month, d)
IF ap$ <> "" THEN LOCATE 21, 30: COLOR 28: PRINT ap$
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

