DEFINT A-Z
RANDOMIZE TIMER
CLS
INPUT "Абсцисса начала ", x1
INPUT "Абсцисса конца ", x2
INPUT "Ордината начала ", y1
INPUT "Ордината конца ", y2
X = (x1 + x2) / 2
Y = (y1 + y2) / 2
SCREEN 12
FOR i = x1 TO x2
LINE (X, Y)-(i, y1), RND * 14 + 1
NEXT
FOR i = y1 TO y2
LINE (X, Y)-(x2, i), RND * 14 + 1
NEXT
FOR i = x2 TO x1 STEP -1
LINE (X, Y)-(i, y2), RND * 14 + 1
NEXT
FOR i = y2 TO y1 STEP -1
LINE (X, Y)-(x1, i), RND * 14 + 1
NEXT
SLEEP 5
CLS
xs = INT((x2 - x1) / 2)
ys = INT((y2 - x2) / 2)
FOR i = 1 TO X - x1
CIRCLE (X, Y), i, RND * 14 + 1, , , ys / xs
NEXT

