DECLARE FUNCTION arccos! (x!)
DECLARE FUNCTION arcsin! (x!)
CLS
DEFSTR M
DIM SHARED l(3), g(3), t, x(3), y(3)
DIM SHARED gn(3), np(3, 3) AS INTEGER, nl(3, 3) AS INTEGER, ng(3, 3, 3) AS INTEGER, nt(3, 3, 3) AS INTEGER
DIM SHARED mp(3) AS STRING, ml(3) AS STRING, mg(3) AS STRING, mt AS STRING
pi = 3.14159126#
nt(1, 2, 3) = 1: nl(1, 2) = 1: nl(1, 3) = 2: nl(2, 3) = 3
ng(2, 1, 3) = 1: ng(1, 2, 3) = 2: ng(1, 3, 2) = 3: np(1, 2) = 1: np(1, 3) = 2: np(2, 3) = 3
INPUT "Имя треугольника ", mt(1)
FOR i = 1 TO 3
mp(i) = MID$(mt(1), i, 1)
NEXT
FOR i = 1 TO 3
ml(i) = mp(1 + i \ 3) + mp(2 + i \ 2)
mg(i) = mp(2 - i \ 2) + mp(i) + mp(3 - i \ 3)
NEXT
PRINT "его вершины", mp(1), mp(2), mp(3)
PRINT "его стороны", ml(1), ml(2), ml(3)
PRINT "его углы", mg(1), mg(2), mg(3)
PRINT
met1:
PRINT "введите данные (углы в градусах или стороны)"
FOR i = 1 TO 3
met2:
PRINT i;
INPUT ")", m.d
met3:
IF INSTR(m.d, "=") = 0 THEN INPUT "чему равно"; d$: dat = VAL(d$) ELSE dat = VAL(RIGHT$(m.d, LEN(m.d) - INSTR(m.d, "="))): m.d = LEFT$(m.d, INSTR(m.d, "=") - 1)
FOR j = 1 TO 3
IF LEN(m.d) = 2 AND ml(j) = m.d THEN l(j) = dat: con = 1: PRINT "подтверждаю "; ml(j); " ="; dat: IF l(j) <= 0 GOTO met3
IF LEN(m.d) = 3 AND mg(j) = m.d THEN g(j) = dat / 180 * pi: con = 1: PRINT "подтверждаю"; mg(j); " ="; dat: IF SIN(g(j)) <= 0 GOTO met3
NEXT j
IF con = 0 GOTO met2
NEXT i
IF l(1) > 0 AND l(2) > 0 AND l(3) = 0 THEN p = (l(1) + l(2) + l(3)) / 2: IF l(1) > p OR l(2) > p OR l(3) > p GOTO met1
FOR i = 1 TO 3
a = i MOD 3 + 1: b = (i + 1) MOD 3 + 1
IF l(i) = 0 AND l(a) > 0 AND l(b) > 0 AND g(4 - i) THEN l(i) = (l(a) ^ 2 + l(b) ^ 2 - 2 * l(a) * l(b) * COS(g(4 - i))) ^ .5: m1 = ml(i)
IF g(i) = 0 AND g(a) > 0 AND g(b) > 0 THEN g(i) = pi - g(a) - g(b): m2 = mg(i)
IF g(4 - i) = 0 AND l(i) > 0 AND l(a) > 0 AND l(b) > 0 THEN g(4 - i) = arccos((l(a) ^ 2 + l(b) ^ 2 - l(i) ^ 2) / (2 * l(a) * l(b))): m3 = mg(4 - i)
IF l(i) = 0 AND l(a) > 0 AND g(4 - i) > 0 AND g(4 - a) > 0 THEN l(i) = l(a) * SIN(g(4 - i)) / SIN(g(4 - a)): m1 = ml(i)
IF l(i) = 0 AND l(b) > 0 AND g(4 - i) > 0 AND g(4 - b) > 0 THEN l(i) = l(b) * SIN(g(4 - i)) / SIN(g(4 - b)): m1 = ml(i)
IF g(4 - i) = 0 AND l(i) > 0 AND l(a) > 0 AND g(4 - a) > 0 THEN g(4 - i) = arcsin(l(i) * SIN(g(4 - a)) / l(a)): m3 = mg(4 - i)
IF g(4 - i) = 0 AND l(i) > 0 AND l(b) > 0 AND g(4 - b) > 0 THEN g(4 - i) = arcsin(l(i) * SIN(g(4 - b)) / l(b)): m3 = mg(4 - i)
WRITE m1, m2, m3
NEXT
FOR i = 1 TO 3
PRINT ml(i); " ="; l(i)
NEXT
FOR i = 1 TO 3
gn(i) = CINT(g(i) / pi * 180)
PRINT mg(i); " ="; gn(i)
NEXT
IF gn(1) + gn(2) + gn(3) <> 180 THEN PRINT "ошибка из-за погрешности"
p = (l(1) + l(2) + l(3)) / 2
S = (p * (p - l(1)) * (p - l(2)) * (p - l(3))) ^ .2
PRINT "S ="; S

FUNCTION arccos (x)
arccos = 1.570796 - ATN(x / (1 - x ^ 2) ^ .5)
END FUNCTION

FUNCTION arcsin (x)
arcsin = ATN(x / (1 - x ^ 2) ^ .5)
END FUNCTION

