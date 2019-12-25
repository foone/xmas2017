DECLARE SUB drawLights ()
DIM lights(64) AS INTEGER
SCREEN 1
COLOR 0, 0
DEF SEG = &HB800
BLOAD "screen1.bsv", 0
BLOAD "screen2.bsv", 8192

GET (0, 0)-STEP(5, 7), lights
GET (5, 0)-STEP(5, 7), lights(16)
GET (10, 0)-STEP(5, 7), lights(32)
LINE (0, 0)-(15, 7), 0, BF
drawLights
LOCATE 19

'      <<<<<<<<<<<<<<<<<<<XX>>>>>>>>>>>>>>>>>>>
PRINT "            Merry Christmas"
PRINT "       from Foone & Amber Turing!"
PRINT
PRINT "   Thanks for keeping the past alive,   "
PRINT "     and keep on retro-ing in 2018!     "
'END
SLEEP 5

READ NUMNOTES
FOR i = 1 TO NUMNOTES
	READ note$
	drawLights
	PLAY note$
NEXT
SLEEP
'from https://stackoverflow.com/a/11380262
DATA 52
DATA t200l4o2mn,e,e,l2e,l4e,e,l2e,l4e,g,l3c,l8d
DATA l1e,l4f,f,l3f,l8f,l4f,e,l2e,l8e,e,l4e,d,d,e
DATA l2d,g,l4e,e,l2e,l4e,e,l2e,l4e,g,l3c,l8d,l1e
DATA l4f,f,l3f,l8f,l4f,e,l2e,l8e,f,l4g,g,f,d,l2c

SUB drawLights
SHARED lights() AS INTEGER
FOR i = 0 TO 19
	c = 16 * (INT(RND * 3))
	PUT (5 + i * 16, 0), lights(c)
NEXT

END SUB

