DECLARE SUB Zoom (X!)
DO
INPUT ""; Q$
co = VAL(Q$)
LOOP UNTIL co > 0 AND co < 16
SCREEN 12
X = 500: Xdelta = 50
DO
   DO WHILE X < 525 AND X > 50
      X = X + Xdelta
      CALL Zoom(X)
      FOR I = 1 TO 1000
         IF INKEY$ <> "" THEN END
      NEXT
   LOOP
   X = X - Xdelta
   Xdelta = -Xdelta
LOOP



SUB Zoom (X) STATIC
SHARED co
   CLS
   WINDOW (-X, -X)-(X, X)
   LINE (-X, -X)-(X, X), co, B
   CIRCLE (0, 0), 60, co, , , .5
   PAINT (0, 0), co
END SUB

