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
   18 LOCAL line$, elf$, you$, shape%
   19 line$ = GET$#fd%
   20 elf$ = FNstrtok_str(line$)
   21 you$ = FNstrtok_str(line$)
   22 PRINT elf$ you$
   23 IF ASC(you$) = 88 THEN
   24   shape% = 1
   25 ELSE
   26   IF ASC(you$) = 89 THEN
   27     shape% = 2
   28   ELSE
   29     IF ASC(you$) = 90 THEN
   30       shape% = 3
   31     ENDIF
   32   ENDIF
   33 ENDIF
   34 REM ties are always a difference of 23 apparently
   35 IF ASC(you$) - ASC(elf$) = 23 THEN
   36   score% = score% + shape% + 3
   37   PRINT "Draw"
   38 ELSE
   39   IF ASC(you$) - ASC(elf$) = 21 OR ASC(you$) - ASC(elf$) = 24 THEN
   40     score% = score% + shape% + 6
   41     PRINT "Win"
   42   ELSE
   43     IF ASC(you$) - ASC(elf$) = 25 OR ASC(you$) - ASC(elf$) = 22 THEN
   44       score% = score% + shape%
   45       PRINT "Loss"
   46     ENDIF
   47   ENDIF
   48 ENDIF
   49 ENDPROC
   50 :
   51 REM splits a space-separated string (like the real strtok)
   52 DEF FNstrtok_str(RETURN string$)
   53 LOCAL res$
   54 res$ = LEFT$(string$, INSTR(string$, " ") - 1)
   55 string$ = MID$(string$, INSTR(string$, " ") + 1)
   56 = res$
