KEY 15, CHR$(32) + CHR$(57)
KEY 16, CHR$(32) + CHR$(1)
ON KEY(15) GOSUB met
ON KEY(16) GOSUB met2
WIDTH 40
COLOR 4
CLS
KEY(16) ON
DO
  LOCATE 10, 10: PRINT "��� ����᪠ ����� �஡��"
  LOCATE 11, 12: PRINT "��� ��室� ����� Esc"
  DO
  LOOP UNTIL INKEY$ = CHR$(32)
  CLS
  COLOR 4
  LOCATE 10, 9: PRINT "��� ��⠭���� ����� �஡��"
  LOCATE 11, 12: PRINT "��� ��室� ����� Esc"
  COLOR 12
KEY(15) ON
  DO
    FOR y = 37 TO 32767
      SOUND y, .05
      LOCATE 7, 13
      PRINT "����� - "; y; "�� "
    NEXT
    FOR y = 32767 TO 37 STEP -1
      SOUND y, .05
      LOCATE 7, 13
      PRINT "����� - "; y; "�� "
    NEXT
  LOOP
met: 
KEY(15) OFF
LOOP
met2:
END

