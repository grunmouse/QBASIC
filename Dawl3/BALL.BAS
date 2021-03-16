SCREEN 12
CLS
DO
FOR i = 0 TO 640
      x = (640 - i) / 20
      y = .5 * x ^ 2
      CIRCLE (i, y), 25, CINT(14 * RND) + 1
      FOR j = 1 TO 1000
            IF INKEY$ <> "" THEN END
      NEXT
      CIRCLE (i, y), 25, 0
NEXT
FOR i = 640 TO 0 STEP -1
      x = (640 - i) / 20
      y = .5 * x ^ 2
      CIRCLE (i, y), 25, CINT(14 * RND) + 1
      FOR j = 1 TO 1000
            IF INKEY$ <> "" THEN END
      NEXT
      CIRCLE (i, y), 25, 0
NEXT
LOOP

