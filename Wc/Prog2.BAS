CLS
PRINT "Программа для расчета премии сотрудников фирмы"
DIM fio$(10), okl(10), proc(10), prem(10), m(3)
PRINT SPC(4); "Оклад сотрудников и премиальный процент"
PRINT "==============================================="
PRINT " №   Ф.И.О.            оклад,руб       премия,%"
PRINT "-----------------------------------------------"
FOR i = 1 TO 10
    READ fio$(i)
    LOCATE 5 + i, 1: PRINT i;
    LOCATE 5 + i, 6: PRINT fio$(i);
    LOCATE 5 + i, 24: INPUT "", okl(i)
    LOCATE 5 + i, 40: INPUT "", proc(i)
    prem(i) = okl(i) * proc(i) / 100
NEXT i
PRINT "==============================================="
PRINT
PRINT "Сотрудники получающие наибольшую премию"
PRINT "=================================="
PRINT " №   Ф.И.О.            премия,руб"
PRINT "---------------------------------"
FOR j = 1 TO 3
    b = 1
    FOR i = 1 TO 10
        IF prem(i) > prem(b) THEN
            ctrl = 0
            FOR k = 1 TO j - 1
                IF m(k) = i THEN ctrl = 1: EXIT FOR
            NEXT k
            IF ctrl = 0 THEN b = i
        END IF
        m(j) = b
    NEXT i
    PRINT j; TAB(6); fio$(m(j)); TAB(24); prem(m(j))
NEXT j
PRINT "================================="

DATA "Карвель А.И."
DATA "Кононов Д.Б."
DATA "Загоруйко П.И."
DATA "Раков Д.В."
DATA "Владимиров А.А."
DATA "Яворский К.М."
DATA "Дилбарян Г.Г."
DATA "Рузанкин А.Б."
DATA "Моисеев И.О."
DATA "Михаленя Д.Н."

