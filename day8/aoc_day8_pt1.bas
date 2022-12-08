   10 fd% = 0
   20 ON ERROR PROCerror
   30 DIM grid%(98, 98)
   40 visTrees% = 392
   50 fd% = OPENIN("/home/al/aoc_day8.in")
   60 FOR i% = 0 TO DIM(grid%(), 1)
   70   PROCinit_row(grid%(), i%)
   80 NEXT i%
   90 CLOSE#fd%
  100 PROCget_vis_trees(grid%())
  110 PRINT "Visible trees: " visTrees%
  120 END
  130
  140 DEF PROCerror
  150 IF fd% <> 0 THEN CLOSE#fd%
  160 REPORT: PRINT " at line "; ERL: END
  170 ENDPROC
  180
  190 DEF PROCinit_row(gr%(), r%)
  200 LOCAL line$, i%
  210 line$ = GET$#fd%
  220 FOR i% = 0 TO DIM(gr%(), 2)
  230   gr%(r%, i%) = VAL(FNstrtok_char(line$))
  240 NEXT i%
  250 ENDPROC
  260
  270 DEF PROCget_vis_trees(gr%())
  280 LOCAL i%, j%, nth%, sth%, est%, wst%
  290 FOR i% = 1 TO DIM(gr%(), 1) - 1
  300   FOR j% = 1 TO DIM(gr%(), 2) - 1
  310     nth% = FNcheck_north(gr%(), i%, j%): PRINT nth%
  320     sth% = FNcheck_south(gr%(), i%, j%): PRINT sth%
  330     est% = FNcheck_east(gr%(), i%, j%): PRINT est%
  340     wst% = FNcheck_west(gr%(), i%, j%): PRINT wst%
  350     IF (nth% > 0) OR (sth% > 0) OR (est% > 0) OR (wst% > 0) THEN visTrees% += 1
  360   NEXT j%
  370 NEXT i%
  380 ENDPROC
  390
  400 DEF FNcheck_north(gr%(), a%, b%)
  410 LOCAL j%, res%
  420 res% = 1
  430 FOR j% = b% - 1 TO 0 STEP -1
  440   IF gr%(a%, b%) <= gr%(a%, j%) THEN
  450     res% = 0
  460     EXIT FOR
  470   ENDIF
  480 NEXT j%
  490 = res%
  500
  510 DEF FNcheck_south(gr%(), a%, b%)
  520 LOCAL j%, res%
  530 res% = 1
  540 FOR j% = b% + 1 TO DIM(gr%(), 1)
  550   IF gr%(a%, b%) <= gr%(a%, j%) THEN
  560     res% = 0
  570     EXIT FOR
  580   ENDIF
  590 NEXT j%
  600 = res%
  610
  620 DEF FNcheck_east(gr%(), a%, b%)
  630 LOCAL i%, res%
  640 res% = 1
  650 FOR i% = a% - 1 TO 0 STEP -1
  660   IF gr%(a%, b%) <= gr%(i%, b%) THEN
  670     res% = 0
  680     EXIT FOR
  690   ENDIF
  700 NEXT i%
  710 = res%
  720
  730 DEF FNcheck_west(gr%(), a%, b%)
  740 LOCAL i%, res%
  750 res% = 1
  760 FOR i% = a% + 1 TO DIM(gr%(), 2)
  770   IF gr%(a%, b%) <= gr%(i%, b%) THEN
  780     res% = 0
  790     EXIT FOR
  800   ENDIF
  810 NEXT i%
  820 = res%
  830
  840 DEF FNstrtok_char(RETURN s$)
  850 LOCAL res$
  860 res$ = LEFT$(s$, 1)
  870 s$ = RIGHT$(s$, LEN(s$) - 1)
  880 = res$
