   10 fd% = 0
   20 ON ERROR PROCerror
   30 DIM grid%(98, 98)
   40 maxScnScr% = 0
   50 fd% = OPENIN("/home/al/aoc_day8.in")
   60 FOR i% = 0 TO DIM(grid%(), 1)
   70   PROCinit_row(grid%(), i%)
   80 NEXT i%
   90 CLOSE#fd%
  100 PROCget_vis_trees(grid%())
  110 PRINT "Maximum scenic score:" maxScnScr%
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
  280 LOCAL i%, j%, nth%, sth%, est%, wst%, scnScr%
  290 FOR i% = 1 TO DIM(gr%(), 1) - 1
  300   FOR j% = 1 TO DIM(gr%(), 2) - 1
  310     nth% = FNcheck_north(gr%(), i%, j%): PRINT nth%
  320     sth% = FNcheck_south(gr%(), i%, j%): PRINT sth%
  330     est% = FNcheck_east(gr%(), i%, j%): PRINT est%
  340     wst% = FNcheck_west(gr%(), i%, j%): PRINT wst%
  350     scnScr% = nth% * sth% * est% * wst%: PRINT "Scenic score: "; scnScr%
  360     IF scnScr% > maxScnScr% THEN maxScnScr% = scnScr%
  370   NEXT j%
  380 NEXT i%
  390 ENDPROC
  400
  410 DEF FNcheck_north(gr%(), a%, b%)
  420 IF b% = 0 THEN = 0
  430 LOCAL j%, res%
  440 res% = 0
  450 FOR j% = b% - 1 TO 0 STEP -1
  460   res% += 1
  470   IF gr%(a%, b%) <= gr%(a%, j%) THEN EXIT FOR
  480 NEXT j%
  490 = res%
  500
  510 DEF FNcheck_south(gr%(), a%, b%)
  520 IF b% = DIM(gr%(), 2) THEN = 0
  530 LOCAL j%, res%
  540 res% = 0
  550 FOR j% = b% + 1 TO DIM(gr%(), 2)
  560   res% += 1
  570   IF gr%(a%, b%) <= gr%(a%, j%) THEN EXIT FOR
  580 NEXT j%
  590 = res%
  600
  610 DEF FNcheck_east(gr%(), a%, b%)
  620 IF a% = 0 THEN = 0
  630 LOCAL i%, res%
  640 res% = 0
  650 FOR i% = a% - 1 TO 0 STEP -1
  660   res% += 1
  670   IF gr%(a%, b%) <= gr%(i%, b%) THEN EXIT FOR
  680 NEXT i%
  690 = res%
  700
  710 DEF FNcheck_west(gr%(), a%, b%)
  720 IF a% = DIM(gr%(), 1) THEN = 0
  730 LOCAL i%, res%
  740 res% = 0
  750 FOR i% = a% + 1 TO DIM(gr%(), 1)
  760   res% += 1
  770   IF gr%(a%, b%) <= gr%(i%, b%) THEN EXIT FOR
  780 NEXT i%
  790 = res%
  800
  810 DEF FNstrtok_char(RETURN s$)
  820 LOCAL res$
  830 res$ = LEFT$(s$, 1)
  840 s$ = RIGHT$(s$, LEN(s$) - 1)
  850 = res$
