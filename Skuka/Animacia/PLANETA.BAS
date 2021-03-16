DECLARE FUNCTION lim! (x!, y!)
DECLARE FUNCTION GetMas! (x1!, y1!, x2!, y2!)
CONST pi = 3.1415926#
CLS
SCREEN 12
'Солнце (star)
  CIRCLE (100, 100), 15, 14
  PAINT (100, 100), 14
  a = GetMas(85, 85, 115, 115)
'Земля (terra)
  CIRCLE (200, 100), 5, 10
  PAINT (200, 100), 10
  a1 = GetMas(195, 95, 205, 105)
'Меркурий (merkuri)
  CIRCLE (300, 100), 3, 12
  PAINT (300, 100), 12
  a2 = GetMas(297, 97, 303, 103)
'Венера (venera)
  CIRCLE (400, 100), 5, 9
  PAINT (400, 100), 9
  a3 = GetMas(395, 95, 405, 105)
'Марс (mars)
  CIRCLE (500, 100), 4, 12
  PAINT (500, 100), 12
  a4 = GetMas(496, 96, 504, 104)
'Юпитер (jupiter)
  CIRCLE (100, 200), 10, 6
  PAINT (100, 200), 6
  a5 = GetMas(90, 190, 110, 210)
'Сатурн (saturn)
  CIRCLE (200, 200), 9, 6
  PAINT (200, 200), 6
  CIRCLE (200, 200), 20, 10, , , .5
  CIRCLE (200, 200), 15, 10, pi * 3 / 4, pi / 4, .5
  a6 = GetMas(180, 190, 220, 210)
'Уран (uran)
  CIRCLE (300, 200), 8, 10
  PAINT (300, 200), 10
  a7 = GetMas(292, 192, 308, 208)
'Нептун (neptun)
  CIRCLE (400, 200), 8, 9
  PAINT (400, 200), 9
  a8 = GetMas(392, 192, 408, 208)
'Плутон (pluton)
  CIRCLE (500, 200), 3, 7
  PAINT (500, 200), 7
  a9 = GetMas(497, 197, 503, 203)

DIM star(a), terra(a1) AS LONG, merkuri(a2) AS LONG, venera(a3) AS LONG, mars(a4) AS LONG, jupiter(a5) AS LONG, saturn(a6) AS LONG, uran(a7) AS LONG, neptun(a8) AS LONG, pluton(a9) AS LONG
GET (85, 85)-(115, 115), star
GET (195, 95)-(205, 105), terra
GET (297, 97)-(303, 103), merkuri
GET (395, 95)-(405, 105), venera
GET (496, 96)-(504, 104), mars
GET (90, 190)-(110, 210), jupiter
GET (180, 190)-(220, 210), saturn
GET (292, 192)-(308, 208), uran
GET (392, 192)-(408, 208), neptun
GET (497, 197)-(503, 203), pluton
s = .5 ' cos угла наклона
t = 20 'секунд = год
r = 75 'точек = астр.ед.
x0 = 295
y0 = 215
KEY 15, CHR$(32) + CHR$(1)
KEY 16, CHR$(32) + CHR$(57)
KEY 17, CHR$(32) + CHR$(28)
ON KEY(17) GOSUB enter
ON KEY(15) GOSUB esc
ON KEY(16) GOSUB pr
begin:
KEY(0) ON
CLS
PUT (x0, y0), star
CIRCLE (x0 + 15, y0 + 15), r, 7, , , s
DO
  'Земля
  x1 = SIN(2 * pi * TIMER / t) * r + x0 + 10
  y1 = COS(2 * pi * TIMER / t) * r * s + y0 + 10
  'Меркурий
  x2 = SIN(2 * pi * TIMER / (t * .241)) * r * .387 + x0 + 12
  y2 = COS(2 * pi * TIMER / (t * .241)) * r * .387 * s + y0 + 12
  'Венера
  x3 = SIN(2 * pi * TIMER / (t * .615)) * r * .723 + x0 + 10
  y3 = COS(2 * pi * TIMER / (t * .615)) * r * .723 * s + y0 + 10
  'Марс
  x4 = SIN(2 * pi * TIMER / (t * 1.881)) * r * 1.524 + x0 + 11
  y4 = COS(2 * pi * TIMER / (t * 1.881)) * r * 1.524 * s + y0 + 11
  'Юпитер
  x5 = SIN(2 * pi * TIMER / (t * 11.86)) * r * 5.203 + x0 + 5
  y5 = COS(2 * pi * TIMER / (t * 11.86)) * r * 5.203 * s + y0 + 5
  'Сатурн
  x6 = SIN(2 * pi * TIMER / (t * 29.46)) * r * 9.539 + x0 - 5
  y6 = COS(2 * pi * TIMER / (t * 29.46)) * r * 9.539 * s + y0 + 5
  'Уран
  x7 = -SIN(2 * pi * TIMER / (t * 84.02)) * r * 19.19 + x0 + 7
  y7 = -COS(2 * pi * TIMER / (t * 84.02)) * r * 19.19 * s + y0 + 7
  'Нептун
  x8 = SIN(2 * pi * TIMER / (t * 164.8)) * r * 30.07 + x0 + 7
  y8 = COS(2 * pi * TIMER / (t * 164.8)) * r * 30.07 * s + y0 + 7
  'Плутон
  x9 = SIN(2 * pi * TIMER / (t * 247.7)) * r * 39.46 + x0 + 10
  y9 = COS(2 * pi * TIMER / (t * 247.7)) * r * 39.46 * s + y0 + 10
  KEY(16) STOP
  IF lim(x1, y1) THEN PUT (x1, y1), terra, XOR
  IF lim(x2, y2) THEN PUT (x2, y2), merkuri, XOR
  IF lim(x3, y3) THEN PUT (x3, y3), venera, XOR
  IF lim(x4, y4) THEN PUT (x4, y4), mars, XOR
  IF lim(x5, y5) THEN PUT (x5, y5), jupiter, XOR
  IF lim(x6, y6) THEN PUT (x6, y6), saturn, XOR
  IF lim(x7, y7) THEN PUT (x7, y7), uran, XOR
  IF lim(x8, y8) THEN PUT (x8, y8), neptun, XOR
  IF lim(x9, y9) THEN PUT (x9, y9), pluton, XOR
  KEY(16) ON
  FOR i = 1 TO 1000
  NEXT
  KEY(16) STOP
  IF lim(x1, y1) THEN PUT (x1, y1), terra, XOR
  IF lim(x2, y2) THEN PUT (x2, y2), merkuri, XOR
  IF lim(x3, y3) THEN PUT (x3, y3), venera, XOR
  IF lim(x4, y4) THEN PUT (x4, y4), mars, XOR
  IF lim(x5, y5) THEN PUT (x5, y5), jupiter, XOR
  IF lim(x6, y6) THEN PUT (x6, y6), saturn, XOR
  IF lim(x7, y7) THEN PUT (x7, y7), uran, XOR
  IF lim(x8, y8) THEN PUT (x8, y8), neptun, XOR
  IF lim(x9, y9) THEN PUT (x9, y9), pluton, XOR
LOOP
esc:
KEY(0) OFF
END
pr:
KEY(16) OFF
DO
LOOP UNTIL INKEY$ = CHR$(32)
KEY(16) ON
RETURN
enter:
KEY(0) OFF
CLS
PRINT "cos угла наклона: "; s
PRINT "временной масштаб сек/год:"; t
PRINT "пространственный масштаб тчк/астр.ед.:"; r
INPUT "новый cos угла наклона: ", s
INPUT "новый временной масштаб сек/год:", t
INPUT "новый пространственный масштаб тчк/астр.ед.:", r
RETURN begin

FUNCTION GetMas (x1, y1, x2, y2)
GetMas = 4 + INT(((PMAP(x2, 0) - PMAP(x1, 0) + 1) + 7) / 8) * (PMAP(y2, 1) - PMAP(y1, 1) + 1)
END FUNCTION

FUNCTION lim (x, y)
lim = (x <= 600) AND (x >= 0) AND (y <= 400) AND (y >= 0)
END FUNCTION

