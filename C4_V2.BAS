DIM colorfor(-1 TO 1) AS INTEGER
colorfor(-1) = 4
colorfor(1) = 7
player% = 1
SCREEN 12
Newgame: moves$ = ""
Showmoves: COLOR colorfor(player%)
LOCATE 28, 24
PRINT "\1\     \2\     \3\     \4\     \5\     \6\     \7\", "Moves= "; moves$;
Getinput: LOCATE 1, 1
INPUT entry%
SELECT CASE entry%
  CASE IS >= 1000: CLS
                   GOTO Newgame
  CASE 1 TO 7: i% = entry% * 65 + 125
               FOR j% = 385 TO 5 STEP -65
                 IF POINT(i%, j%) = 0 THEN
                   player% = -player%
                   moves$ = moves$ + CHR$(entry% + 48)
                   CIRCLE (i%, j%), 28, 13
                   PAINT (i%, j%), , 13
                   GOTO Showmoves
                 END IF
               NEXT
  CASE IS < 0: END
END SELECT
GOTO Getinput
