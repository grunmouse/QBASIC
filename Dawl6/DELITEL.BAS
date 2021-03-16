DEFSTR Q
DEFINT C-K, M-N
OPTION BASE 1
'$DYNAMIC
CLS
INPUT "Введи первое число ", qm
INPUT "Введи второе число ", qn

m = VAL(qm): n = VAL(qn)
DIM dm1(m)
i = 1: j = 0

DO UNTIL i > m
      IF m MOD i = 0 THEN
            j = j + 1
            dm1(j) = i
      END IF
i = i + 1
LOOP

DIM dm(j)
FOR i = 1 TO UBOUND(dm)
      dm(i) = dm1(i)
NEXT i

DIM dn1(m)
i = 1: j = 0

DO UNTIL i > n
      IF n MOD i = 0 THEN
            j = j + 1
            dn1(j) = i
      END IF
i = i + 1
LOOP

DIM dn(j)
FOR i = 1 TO UBOUND(dn)
      dn(i) = dn1(i)
NEXT i

ERASE dm1, dn1

IF UBOUND(dn) > UBOUND(dm) THEN c = UBOUND(dn) ELSE c = UBOUND(dm)
DIM do1(c)
k = 0
FOR i = 1 TO UBOUND(dm)
FOR j = 1 TO UBOUND(dn)
      IF dm(i) = dn(j) THEN
            k = k + 1
            do1(k) = dm(i)
            EXIT FOR
      END IF
NEXT: NEXT

DIM dob(k)
FOR i = 1 TO UBOUND(dob)
      dob(i) = do1(i)
NEXT i

PRINT TAB(5); "Делители"; m; TAB(24); "Делители"; n; TAB(44); "Общие делители"
PRINT STRING$(60, "=")
FOR i = 1 TO c
      IF i <= UBOUND(dm) THEN PRINT TAB(10); dm(i);
      IF i <= UBOUND(dn) THEN PRINT TAB(28); dn(i);
      IF i <= UBOUND(dob) THEN PRINT TAB(50); dob(i);
      PRINT
NEXT i
max = dob(1)
FOR i = 2 TO UBOUND(dob)
      IF dob(i) > max THEN max = dob(i)
NEXT i
PRINT "Наибольший общий делитель "; max

