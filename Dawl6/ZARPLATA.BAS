DEFSTR Q
DEFINT C-K, N
OPTION BASE 1
TYPE Arbeiter
      Nam AS STRING * 10
      Zarp AS SINGLE
END TYPE

CLS
INPUT "Введи кол-во радочих в бригаде ", qn
n = VAL(qn)
DIM brig(n) AS Arbeiter
PRINT "Введи их фамилии и размер зарплаты"
PRINT TAB(5); "фамилия"; TAB(20); "зарплата"

FOR i = 1 TO n
      c = CSRLIN
      PRINT i; TAB(5);
      INPUT "", qNam
      LOCATE c, 20:  INPUT "", qZarp
      brig(i).Nam = LEFT$(qNam, 10)
      brig(i).Zarp = VAL(qZarp)
      sum = sum + brig(i).Zarp
NEXT i

PRINT "Средняя запрлата - "; sum / n
PRINT "Зарплату выше средней получают:"
PRINT TAB(5); "фамилия"; TAB(20); "зарплата"
FOR i = 1 TO n
      IF brig(i).Zarp > sum / n THEN PRINT i; TAB(5); brig(i).Nam; TAB(20); brig(i).Zarp
NEXT i

