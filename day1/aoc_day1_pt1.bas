    1 REM > aoc_soln
    2 ON ERROR PROCerror
    3 fd% = OPENIN("$.Home.aoc_day1")
    4 ctr% = 0
    5 maxSum% = 0
    6 REPEAT
    7   PRINT "Total calories for elf "; ctr%; ": "
    8   PROCcalc_sum
    9   ctr% += 1
   10 UNTIL EOF#fd%
   11 CLOSE#fd%
   12 PRINT "Top calories: "; maxSum%
   13 END
   14 :
   15 DEF PROCerror
   16 IF fd% <> 0 THEN CLOSE#fd%
   17 REPORT: PRINT " at line "; ERL: END
   18 ENDPROC
   19 :
   20 DEF PROCcalc_sum
   21 LOCAL sum%, inStr$
   22 sum% = 0
   23 inStr$ = GET$#fd%
   24 WHILE LEN(inStr$) <> 0
   25   sum% += VAL(inStr$)
   26   inStr$ = GET$#fd%
   27 ENDWHILE
   28 PRINT sum%
   29 IF sum% > maxSum% THEN maxSum% = sum%
   30 ENDPROC
   31
