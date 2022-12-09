   10 REM > aoc_day2
   20 ON ERROR PROCerror
   30 fd% = OPENIN("/home/al/aoc_day2.in")
   40 score% = 0
   50 REPEAT
   60   PROCget_outcome
   70 UNTIL EOF#fd%
   80 CLOSE#fd%
   90 PRINT "Final score: "; score%
  100 END
  110 :
  120 DEF PROCerror
  130 IF fd% <> 0 THEN CLOSE#fd%
  140 REPORT: PRINT " at line "; ERL: END
  150 ENDPROC
  160 :
  170 DEF PROCget_outcome
  180 LOCAL line$, elf$, rslt$, shape%, wgt%
  190 line$ = GET$#fd%
  200 elf$ = FNstrtok_str(line$)
  210 rslt$ = FNstrtok_str(line$)
  220 PRINT elf$ rslt$
  230 IF rslt$ = "X" THEN
  240   REM loss
  250   wgt% = 0
  260   IF elf$ = "A" shape% = 3
  270   IF elf$ = "B" shape% = 1
  280   IF elf$ = "C" shape% = 2
  290 ELSE IF rslt$ = "Y" THEN
  300     REM draw
  310     wgt% = 3
  320     IF elf$ = "A" shape% = 1
  330     IF elf$ = "B" shape% = 2
  340     IF elf$ = "C" shape% = 3
  350   ELSE IF rslt$ = "Z" THEN
  360       wgt% = 6
  370       IF elf$ = "A" shape% = 2
  380       IF elf$ = "B" shape% = 3
  390       IF elf$ = "C" shape% = 1
  400     ENDIF
  410   ENDIF
  420 ENDIF
  430 score% += shape% + wgt%
  440 ENDPROC
  450 :
  460 REM splits a space-separated string (like the real strtok)
  470 DEF FNstrtok_str(RETURN string$)
  480 LOCAL res$
  490 res$ = LEFT$(string$, INSTR(string$, " ") - 1)
  500 string$ = MID$(string$, INSTR(string$, " ") + 1)
  510 = res$
