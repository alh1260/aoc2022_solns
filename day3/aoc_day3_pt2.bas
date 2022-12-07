   10 REM > aoc_day3_pt2.bbc
   20 fd% = 0
   30 ON ERROR PROCerror
   40 fd% = OPENIN("/home/al/aoc_day3.in")
   50 sum% = 0
   60 REPEAT
   70   PRINT "Group"
   80   PROCfind_common_item
   90   PRINT "-----"
  100 UNTIL EOF#fd%
  110 CLOSE#fd%
  120 PRINT "Sum of priorities: " sum%
  130 END
  140 :
  150 DEF PROCerror
  160 IF fd% <> 0 THEN CLOSE#fd%
  170 REPORT: PRINT " at line "; ERL: END
  180 ENDPROC
  190 :
  200 DEF PROCfind_common_item
  210 LOCAL curChar$, line$, i%
  220 LOCAL grp$()
  230 DIM grp$(2)
  240 grp$(0) = ""
  250 grp$(1) = ""
  260 grp$(2) = ""
  270 FOR i% = 0 TO 2
  280   line$ = GET$#fd%
  290   PRINT line$
  300   WHILE LEN(line$) > 0
  310     curChar$ = FNstrtok_char(line$)
  320     IF INSTR(grp$(i%), curChar$) = 0 THEN grp$(i%) += curChar$
  330   ENDWHILE
  340   PRINT "Unique items: " grp$(i%)
  350 NEXT i%
  360 REPEAT
  370   curChar$ = FNstrtok_char(grp$(0))
  380 UNTIL INSTR(grp$(1), curChar$) <> 0 AND INSTR(grp$(2), curChar$) <> 0
  390 PRINT "Common item in this group: " curChar$
  400 PROCget_priority(curChar$)
  410 ENDPROC
  420 :
  430 DEF PROCget_priority(char$)
  440 CASE char$ OF
  450   WHEN "a" : sum% += 1
  460   WHEN "b" : sum% += 2
  470   WHEN "c" : sum% += 3
  480   WHEN "d" : sum% += 4
  490   WHEN "e" : sum% += 5
  500   WHEN "f" : sum% += 6
  510   WHEN "g" : sum% += 7
  520   WHEN "h" : sum% += 8
  530   WHEN "i" : sum% += 9
  540   WHEN "j" : sum% += 10
  550   WHEN "k" : sum% += 11
  560   WHEN "l" : sum% += 12
  570   WHEN "m" : sum% += 13
  580   WHEN "n" : sum% += 14
  590   WHEN "o" : sum% += 15
  600   WHEN "p" : sum% += 16
  610   WHEN "q" : sum% += 17
  620   WHEN "r" : sum% += 18
  630   WHEN "s" : sum% += 19
  640   WHEN "t" : sum% += 20
  650   WHEN "u" : sum% += 21
  660   WHEN "v" : sum% += 22
  670   WHEN "w" : sum% += 23
  680   WHEN "x" : sum% += 24
  690   WHEN "y" : sum% += 25
  700   WHEN "z" : sum% += 26
  710   WHEN "A" : sum% += 27
  720   WHEN "B" : sum% += 28
  730   WHEN "C" : sum% += 29
  740   WHEN "D" : sum% += 30
  750   WHEN "E" : sum% += 31
  760   WHEN "F" : sum% += 32
  770   WHEN "G" : sum% += 33
  780   WHEN "H" : sum% += 34
  790   WHEN "I" : sum% += 35
  800   WHEN "J" : sum% += 36
  810   WHEN "K" : sum% += 37
  820   WHEN "L" : sum% += 38
  830   WHEN "M" : sum% += 39
  840   WHEN "N" : sum% += 40
  850   WHEN "O" : sum% += 41
  860   WHEN "P" : sum% += 42
  870   WHEN "Q" : sum% += 43
  880   WHEN "R" : sum% += 44
  890   WHEN "S" : sum% += 45
  900   WHEN "T" : sum% += 46
  910   WHEN "U" : sum% += 47
  920   WHEN "V" : sum% += 48
  930   WHEN "W" : sum% += 49
  940   WHEN "X" : sum% += 50
  950   WHEN "Y" : sum% += 51
  960   WHEN "Z" : sum% += 52
  970 ENDCASE
  980 ENDPROC
  990 :
 1000 DEF FNstrtok_char(RETURN s$)
 1010 LOCAL res$
 1020 res$ = LEFT$(s$, 1)
 1030 s$ = RIGHT$(s$, LEN(s$) - 1)
 1040 = res$
 1050
