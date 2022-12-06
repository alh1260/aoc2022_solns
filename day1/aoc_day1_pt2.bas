    1 REM > aoc_soln
    2 ON ERROR PROCerror
    3 fd% = OPENIN("$.Home.aoc_day1")
    4 ctr% = 0
    5 DIM sums%(260)
    6 sumsLen% = DIM(sums%(), 1) - 1
    7 REPEAT
    8   PRINT "Total calories for elf "; ctr%; ": "
    9   PROCcalc_sum
   10   ctr% += 1
   11 UNTIL EOF#fd%
   12 CLOSE#fd%
   13 PROCqsort(sums%(), 0, sumsLen%)
   14 PRINT "Top 3 calories:"; sums%(sumsLen%); SPC1; sums%(sumsLen% - 1); SPC1; sums%(sumsLen% - 2)
   15 PRINT "Total:"; sums%(sumsLen%) + sums%(sumsLen% - 1) + sums%(sumsLen% - 2)
   16 END
   17 :
   18 DEF PROCerror
   19 IF fd% <> 0 THEN CLOSE#fd%
   20 REPORT: PRINT " at line "; ERL: END
   21 ENDPROC
   22 :
   23 DEF PROCcalc_sum
   24 LOCAL sum%, inStr$
   25 sum% = 0
   26 inStr$ = GET$#fd%
   27 WHILE LEN(inStr$) <> 0
   28   sum% += VAL(inStr$)
   29   inStr$ = GET$#fd%
   30 ENDWHILE
   31 PRINT sum%
   32 sums%(ctr%) = sum%
   33 ENDPROC
   34 :
   35 DEF PROCqsort(s%(), a%, b%)
   36 LOCAL pos%
   37 IF a% < b% THEN
   38   pos% = FNpartition(s%(), a%, b%)
   39   REM Who said BASIC can't do recursion? It so can!
   40   PROCqsort(s%(), a%, pos% - 1)
   41   PROCqsort(s%(), pos% + 1, b%)
   42 ENDIF
   43 ENDPROC
   44 :
   45 DEF FNpartition(s%(), a%, b%)
   46 LOCAL pividx%, idx%, pivot%, mid%
   47 mid% = (a% + b%) DIV 2
   48 pivot% = s%(mid%)
   49 SWAP s%(mid%), s%(b%)
   50 pividx% = a%
   51 idx% = a%
   52 WHILE idx% <> b%
   53   IF s%(idx%) < pivot% THEN
   54     SWAP s%(pividx%), s%(idx%)
   55     pividx% += 1
   56   ENDIF
   57   idx% += 1
   58 ENDWHILE
   59 SWAP s%(pividx%), s%(b%)
   60 = pividx%
