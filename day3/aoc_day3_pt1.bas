    1 REM > aoc_day3_pt1
    2 fd% = 0
    3 ON ERROR PROCerror
    4 fd% = OPENIN("$.Home.aoc_day3/in")
    5 line$ = ""
    6 lft$ = ""
    7 rgt$ = ""
    8 sum% = 0
    9 REPEAT
   10   line$ = GET$#fd%
   11   lft$ = LEFT$(line$, LEN(line$) DIV 2)
   12   rgt$ = RIGHT$(line$, LEN(line$) DIV 2)
   13   PRINT line$
   14   PRINT "left part: " lft$
   15   PRINT "right part: " rgt$
   16   PROCfind_common_item
   17   PRINT "-----"
   18 UNTIL EOF#fd%
   19 CLOSE#fd%
   20 PRINT "Sum of priorities: " sum%
   21 END
   22 :
   23 DEF PROCerror
   24 IF fd% <> 0 THEN CLOSE#fd%
   25 REPORT: PRINT " at line "; ERL: END
   26 ENDPROC
   27 :
   28 DEF PROCfind_common_item
   29 LOCAL curChar$
   30 curChar$ = FNstrtok_char(lft$)
   31 WHILE INSTR(rgt$, curChar$) = 0
   32   curChar$ = FNstrtok_char(lft$)
   33 ENDWHILE
   34 PRINT "Common char: " curChar$
   35 PROCget_priority(curChar$)
   36 ENDPROC
   37 :
   38 DEF PROCget_priority(char$)
   39 CASE char$ OF
   40   WHEN "a" : sum% += 1
   41   WHEN "b" : sum% += 2
   42   WHEN "c" : sum% += 3
   43   WHEN "d" : sum% += 4
   44   WHEN "e" : sum% += 5
   45   WHEN "f" : sum% += 6
   46   WHEN "g" : sum% += 7
   47   WHEN "h" : sum% += 8
   48   WHEN "i" : sum% += 9
   49   WHEN "j" : sum% += 10
   50   WHEN "k" : sum% += 11
   51   WHEN "l" : sum% += 12
   52   WHEN "m" : sum% += 13
   53   WHEN "n" : sum% += 14
   54   WHEN "o" : sum% += 15
   55   WHEN "p" : sum% += 16
   56   WHEN "q" : sum% += 17
   57   WHEN "r" : sum% += 18
   58   WHEN "s" : sum% += 19
   59   WHEN "t" : sum% += 20
   60   WHEN "u" : sum% += 21
   61   WHEN "v" : sum% += 22
   62   WHEN "w" : sum% += 23
   63   WHEN "x" : sum% += 24
   64   WHEN "y" : sum% += 25
   65   WHEN "z" : sum% += 26
   66   WHEN "A" : sum% += 27
   67   WHEN "B" : sum% += 28
   68   WHEN "C" : sum% += 29
   69   WHEN "D" : sum% += 30
   70   WHEN "E" : sum% += 31
   71   WHEN "F" : sum% += 32
   72   WHEN "G" : sum% += 33
   73   WHEN "H" : sum% += 34
   74   WHEN "I" : sum% += 35
   75   WHEN "J" : sum% += 36
   76   WHEN "K" : sum% += 37
   77   WHEN "L" : sum% += 38
   78   WHEN "M" : sum% += 39
   79   WHEN "N" : sum% += 40
   80   WHEN "O" : sum% += 41
   81   WHEN "P" : sum% += 42
   82   WHEN "Q" : sum% += 43
   83   WHEN "R" : sum% += 44
   84   WHEN "S" : sum% += 45
   85   WHEN "T" : sum% += 46
   86   WHEN "U" : sum% += 47
   87   WHEN "V" : sum% += 48
   88   WHEN "W" : sum% += 49
   89   WHEN "X" : sum% += 50
   90   WHEN "Y" : sum% += 51
   91   WHEN "Z" : sum% += 52
   92 ENDCASE
   93 ENDPROC
   94 :
   95 DEF FNstrtok_char(RETURN s$)
   96 LOCAL res$
   97 res$ = LEFT$(s$, 1)
   98 s$ = RIGHT$(s$, LEN(s$) - 1)
   99 = res$
