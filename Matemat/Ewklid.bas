DECLARE FUNCTION NOD% (m%, n%)
DEFSTR Q
DEFINT M-N
CLS
DO
PRINT "Введите числа"
INPUT "1) ", qn
INPUT "2) ", qm
n = VAL(qn): m = VAL(qm)
LOOP WHILE n = 0 OR m = 0
PRINT "Наибольший общий делитель чисел "; qn; " и "; qm; " равен "; NOD(m, n)

FUNCTION NOD% (m%, n%)
DO
IF m% > n% THEN m% = m% - n%
IF n% > m% THEN n% = n% - m%
LOOP UNTIL n% = m%
NOD% = n
END FUNCTION

