DECLARE FUNCTION CLineStyl! (l1 AS ANY, l2 AS ANY)
DECLARE SUB LinePaint (l AS ANY)
DECLARE SUB LineInit (x AS INTEGER, y AS INTEGER, l AS INTEGER, orient AS INTEGER, tip AS INTEGER, c AS INTEGER, lin AS ANY)
DECLARE FUNCTION ContLine! (l1 AS ANY, l2 AS ANY)

'Ориентация линии
CONST Vertical = 1
CONST Horizontal = 0
'Тип линии
CONST SINGL = 0
CONST DOUBL = 1
CONST BOLD1 = 2
CONST BOLD2 = 3
'Соединение линий
CONST Left = 0
CONST WCentr = 1
CONST Right = 2
CONST Up = 0
CONST HCentr = 3
CONST Down = 6

'Цвета
CONST BLACK = 0
CONST BLUE = 1
CONST GREEN = 2
CONST TURQUOISE = 3
CONST RED = 4
CONST CRIMSON = 5
CONST BROWN = 6
CONST WHITE = 7
'Атрибуты цвета
CONST Bright = 8
CONST Fickering = 16

TYPE LineStyle
      orient AS INTEGER
      element AS STRING * 1
      LineColor AS INTEGER
END TYPE
TYPE LineScript
      x AS INTEGER
      y AS INTEGER
      l AS INTEGER
      style AS LineStyle
END TYPE

TYPE LabelString
      Capt AS STRING * 64
      Acs AS STRING * 1
END TYPE

DIM SHARED LineSymbol(0 TO 1, 0 TO 3) AS STRING * 1, LineContSymbol(0 TO 3, 0 TO 3, 0 TO 8)
FOR i = 0 TO 3
FOR j = 0 TO 1
      READ LineSymbol(j, i)
NEXT j: NEXT i

CLS
DIM lin AS LineScript
LineInit 1, 1, 20, Horizontal, BOLD1, RED, lin

END

'LineSumbol
DATA "─", "│", "═", "║", "▀", "▌", "▄", "▐"
'LineContSymbol

FUNCTION CLineStyl (l1 AS LineScript, l2 AS LineScript)
      CLineStyl
END FUNCTION

FUNCTION ContLine (l1 AS LineScript, l2 AS LineScript)
      DIM s AS INTEGER
      IF l1.style.orient = l2.style.orient GOTO ContLineMet1
      SELECT CASE l1.style.orient
            CASE Vertical
                  SELECT CASE l1.x
                        CASE l2.x - 1
                              s = Left
                        CASE l2.x TO l2.x + l2.l - 1
                              s = WCentr
                        CASE l2.x + l2.l
                              s = Right
                  END SELECT
                  SELECT CASE l2.y
                        CASE l1.y - 1
                              s = s + Up
                        CASE l1.y TO l1.y + l1.l - 1
                              s = s + HCentr
                        CASE l1.y + l1.l
                              s = s + Down
                  END SELECT
            CASE Horizontal
                  SELECT CASE l2.x
                        CASE l1.x - 1
                              s = Left
                        CASE l1.x TO l1.x + l1.l - 1
                              s = WCentr
                        CASE l1.x + l1.l
                              s = Right
                  END SELECT
                  SELECT CASE l1.y
                        CASE l2.y - 2
                              s = s + Up
                        CASE l2.y TO l2.y + l2.l - 1
                              s = s + HCentr
                        CASE l2.y + l2.l
                              s = s + Down
                  END SELECT
      END SELECT
ContLine = s
EXIT FUNCTION
ContLineMet1:
ContLine = -1
END FUNCTION

SUB LineInit (x AS INTEGER, y AS INTEGER, l AS INTEGER, orient AS INTEGER, tip AS INTEGER, c AS INTEGER, lin AS LineScript)
      lin.x = x
      lin.y = y
      lin.l = l
      lin.style.orient = orient
      lin.style.element = LineSymbol(orient, tip)
      lin.style.LineColor = c
      LinePaint lin
END SUB

SUB LinePaint (l AS LineScript)
      FOR i = 0 TO l.l - 1
            SELECT CASE l.style.orient
                  CASE Horizontal
                        LOCATE l.y, l.x + i
                  CASE Vertical
                        LOCATE l.y + i, l.x
                  CASE ELSE
                        LOCATE l.y, l.x
            END SELECT
            COLOR l.style.LineColor
            PRINT l.style.element;
      NEXT i
END SUB

