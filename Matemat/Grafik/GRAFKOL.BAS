CLS
Pi = 3.141591265358#
INPUT "введи абсциссу центра "; x0
INPUT "введи ординату центра "; y0
INPUT "введи период абсциссы "; Tx
INPUT "введи период ординаты "; Ty
INPUT "введи амплитуду абсциссы "; ax
INPUT "введи амплитуду ординаты "; ay
INPUT "введи абсциссу начала          Pi*"; x1
INPUT "введи ординату начала          Pi*"; y1
CLS
SCREEN 9
FOR t = 1 TO Tx * Ty
X = INT(ax * COS(t / Tx + Pi * ax) + x0)
Y = -INT(ay * COS(t / Ty + Pi * ay) + y0)
IF t = 1 THEN x0 = X: y0 = Y
IF t > 1 AND X = x0 AND Y = y0 THEN EXIT FOR
PSET (X, Y), 14
NEXT


