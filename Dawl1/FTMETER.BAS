CLS
DO
      INPUT "футов"; ft
      INPUT "дюймов"; inc
      PRINT ft; " футов +"; inc; " дюймов ="; ft * .3 + inc * .0251; "метров"
      q$ = INPUT$(1)
LOOP UNTIL q$ = CHR$(27)

