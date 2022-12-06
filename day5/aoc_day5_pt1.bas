   10 ON ERROR PROCerror
   20 fd% = 0
   30 DIM stack{top%, items$(56)}
   40 DIM stacks{(9)} =  stack{}
   50 DIM specs$(9)
   60 specs$(0) = "GTRW"
   70 specs$(1) = "GCHPMSVW"
   80 specs$(2) = "CLTSGM"
   90 specs$(3) = "JHDMWRF"
  100 specs$(4) = "PQLHSWFJ"
  110 specs$(5) = "PJDNFMS"
  120 specs$(6) = "ZBDFGCSJ"
  130 specs$(7) = "RTB"
  140 specs$(8) = "HNWLC"
  150 FOR i% = 0 TO 8
  160   PROCinit_stack(stacks{(i%)}, specs$(i%))
  170 NEXT i%
  180 fd% = OPENIN("/home/al/aoc_day5.in")
  190 REPEAT
  200   line$ = GET$#fd%
  210   PRINT line$
  220   mv$ = FNstrtok_str(line$)
  230   qty% = FNstrtok_int(line$)
  240   frm$ = FNstrtok_str(line$)
  250   src% = FNstrtok_int(line$)
  260   to$ = FNstrtok_str(line$)
  270   dst% = FNstrtok_int(line$)
  280   PROCdo_move(stacks{()}, qty%, src%, dst%)
  290 UNTIL EOF#fd%
  300 CLOSE#fd%
  310 FOR i% = 0 TO 8
  320   PRINT "Top "; i%
  330   PRINT stacks{(i%)}.items$(stacks{(i%)}.top%)
  340 NEXT i%
  350 END
  360
  370 DEF PROCerror
  380 IF fd% <> 0 THEN CLOSE#fd%
  390 REPORT: PRINT " at line "; ERL: END
  400 ENDPROC
  410
  420 DEF PROCinit_stack(stk{}, spec$)
  430 LOCAL i%, item$
  440 stk.top% = -1
  450 WHILE LEN(spec$) > 0
  460   item$ = FNstrtok_char(spec$)
  470   PROCpush(stk{}, item$)
  480 ENDWHILE
  490 ENDPROC
  500
  510 DEF PROCdo_move(stks{()}, qty%, src%, dst%)
  520 LOCAL item$, i%
  530 FOR i% = 1 TO qty%
  540   PRINT src%
  550   item$ = FNpop(stks{(src% - 1)})
  560   PRINT item$
  570   PROCpush(stks{(dst% - 1)}, item$)
  580 NEXT i%
  590 ENDPROC
  600
  610 DEF PROCpush(stk{}, item$)
  620 stk.top% += 1
  630 stk.items$(stk.top%) = item$
  640 ENDPROC
  650
  660 DEF FNpop(stk{})
  670 LOCAL res$
  680 IF stk.top% = -1 = " "
  690 res$ = stk.items$(stk.top%)
  700 stk.top% -= 1
  710 = res$
  720
  730 DEF FNstrtok_char(RETURN s$)
  740 LOCAL res$
  750 res$ = LEFT$(s$, 1)
  760 s$ = RIGHT$(s$, LEN(s$) - 1)
  770 = res$
  780
  790 DEF FNstrtok_str(RETURN string$)
  800 LOCAL res$
  810 res$ = LEFT$(string$, INSTR(string$, " ") - 1)
  820 string$ = MID$(string$, INSTR(string$, " ") + 1)
  830 = res$
  840
  850 DEF FNstrtok_int(RETURN intString$)
  860 LOCAL res%
  870 res% = VAL(LEFT$(intString$, INSTR(intString$, " ") - 1))
  880 intString$ = MID$(intString$, INSTR(intString$, " ") + 1)
  890 = res%
  900
