CLS
ns = 21  '�-�� ��㤥�⮢
DIM s$(ns), oc(ns, 4), sr(ns)
n = 0
FOR i = 1 TO ns
      READ s$(i) '���뢠��� �.�.�. ��㤥��
      FOR j = 1 TO 4
            READ oc(i, j)  '���뢠��� �業��
      NEXT j
      sr(i) = (oc(i, 1) + oc(i, 2) + oc(i, 3) + oc(i, 4)) / 4 '��. ����
      IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN n = n + 1
NEXT i
CLS
PRINT "�������� ��ᨨ:"
PRINT " � ) �.�.�.";
FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
PRINT
PRINT STRING$(48, "-")
FOR i = 1 TO ns
      PRINT i; ") "; s$(i);
      FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(i, j); : NEXT j
      PRINT
NEXT i
DIM sx(n), sxf(n)
j = 1
FOR i = 1 TO ns
      IF oc(i, 1) > 3 AND oc(i, 2) > 3 AND oc(i, 3) > 3 AND oc(i, 4) > 3 THEN sx(j) = i: j = j + 1
NEXT i
FOR i = 1 TO n
      max = 0
      FOR j = 1 TO n
            IF sr(sx(j)) > sr(sx(max)) THEN max = j
      NEXT j
      sxf(i) = sx(max): sx(max) = 0
NEXT i
DO: LOOP WHILE INKEY$ = ""
PRINT
PRINT "����� �� ��. � ��.:"
PRINT " � ) �.�.�.";
FOR j = 1 TO 4: PRINT TAB(25 + j * 5); j; : NEXT j
PRINT TAB(50); "��."
PRINT STRING$(55, "-")
FOR i = 1 TO n
      PRINT i; ") "; s$(sxf(i));
      FOR j = 1 TO 4: PRINT TAB(25 + j * 5); oc(sxf(i), j); : NEXT j
      PRINT TAB(50); sr(sxf(i))
NEXT i
DO: LOOP WHILE INKEY$ = ""
END
1000 DATA "������ �.�.", 4, 4, 4, 4        
1010 DATA "���஢ �.�.", 5, 4, 5, 5        
1020 DATA "����஢ �.�.", 3, 4, 5, 4       
1030 DATA "���ﭮ� �.�.", 4, 5, 4, 5       
1040 DATA "��ࠬ��᪨� �.�.", 5, 4, 4, 3   
1050 DATA "����஢ �.�.", 4, 4, 3, 3       
1060 DATA "�������஢ �.�.", 3, 3, 3, 3    
1070 DATA "�஫�� �.�.", 4, 3, 4, 3        
1080 DATA "������ �.�.", 4, 4, 4, 5        
1090 DATA "�ᠥ� �.�.", 5, 5, 5, 4        
1100 DATA "���祭�� �.�.", 5, 5, 5, 5     
1110 DATA "���檨� �.�.", 5, 5, 4, 5     
1120 DATA "��㬮� �.�.", 5, 5, 5, 5       
1130 DATA "���� �.�.", 4, 4, 4, 4       
1140 DATA "������ �.�.", 3, 5, 5, 5  
1150 DATA "���� �.�.", 4, 4, 4, 3   
1160 DATA "��� �.�.", 4, 4, 5, 5     
1170 DATA "�४�� �.�.", 5, 4, 4, 4  
1180 DATA "��ࢥ�� �.�.", 4, 4, 4, 4
1190 DATA "�����㩪� �.�.", 5, 4, 5,4
1200 DATA "����᪨� �.�.", 4, 4, 3,4

