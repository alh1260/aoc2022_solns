    1 REM > aoc_day2
    2 ON ERROR PROCerror
    3 fd% = OPENIN("$.Home.aoc_day2/in")
    4 score% = 0
    5 REPEAT
    6   PROCget_outcome
    7 UNTIL EOF#fd%
    8 CLOSE#fd%
    9 PRINT "Final score: "; score%
   10 END
   11 :
   12 DEF PROCerror
   13 IF fd% <> 0 THEN CLOSE#fd%
   14 REPORT: PRINT " at line "; ERL: END
   15 ENDPROC
   16 :
   17 DEF PROCget_outcome
   18 LOCAL line$, elf$, rslt$, shape%, wgt%
   19 line$ = GET$#fd%
   20 elf$ = FNstrtok_str(line$)
   21 rslt$ = FNstrtok_str(line$)
   22 PRINT elf$ rslt$
   23 IF rslt$ = "X" THEN
   24   REM loss
   25   wgt% = 0
   26   IF elf$ = "A" shape% = 3
   27   IF elf$ = "B" shape% = 1
   28   IF elf$ = "C" shape% = 2
   29 ELSE IF rslt$ = "Y" THEN
   30     REM draw
   31     wgt% = 3
   32     IF elf$ = "A" shape% = 1
   33     IF elf$ = "B" shape% = 2
   34     IF elf$ = "C" shape% = 3
   35   ELSE IF rslt$ = "Z" THEN
   36       wgt% = 6
   37       IF elf$ = "A" shape% = 2
   38       IF elf$ = "B" shape% = 3
   39       IF elf$ = "C" shape% = 1
   40     ENDIF
   41   ENDIF
   42 ENDIF
   43 score% += shape% + wgt%
   44 ENDPROC
   45 :
   46 REM splits a space-separated string (like the real strtok)
   47 DEF FNstrtok_str(RETURN string$)
   48 LOCAL res$
   49 res$ = LEFT$(string$, INSTR(string$, " ") - 1)
   50 string$ = MID$(string$, INSTR(string$, " ") + 1)
   51 = res$
