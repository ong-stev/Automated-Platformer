#include<IE.au3>
#include <Misc.au3>
#RequireAdmin
Opt('TrayIconDebug',1)

HotKeySet("{F10}" , "close")
HotKeySet("{F11}", "startScript")
HotKeySet("{F9}", "setPause")
HotKeySet ("{INS}", "test")
Dim $click = False
Dim $start = False
Dim $count = 0
Dim $looptime = 30
$pause = False
Dim $leftdown = False
Dim $rightdown = True

Dim $eyeShockRow = 1
Dim $eyeShockCol = 0
Dim $nightShadeRow = 1
Dim $nightShadeCol = 1
Dim $spearOfDarknessRow = 1
Dim $spearOfDarknessCol = 2


Dim $impaleButton = "e"
Dim $jumpbutton = "w"
Dim $eyeShockButton = "q"
Dim $nightShadeButton = "r"
Dim $spearOfDarknessButton = "z"


;   MINIMAP BOXES
;$yellowPixel = PixelSearch(9, 70, 41, 105, 0xFFdd44, 10); left
;$yellowPixel = PixelSearch(9, 76, 41, 83, 0xFFdd44, 10); leftTop
;$yellowPixel = PixelSearch(182, 70, 214, 105, 0xFFdd44, 10); right
;$yellowPixel = PixelSearch(182, 86, 214, 83, 0xFFdd44, 10); rightTop
;$yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat



Global $totemTimer
Global $collectTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()

EndFunc

While 1
   If $click = True Then
	  MF3()
	  $count += 1
   EndIf
   WEnd


Func MF3()
	MF3Combo()
EndFunc

Func MF3Combo()
$yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{right down}")
	$yellowPixel = PixelSearch(182, 70, 214, 105, 0xFFdd44, 10); right
		While @error
	      doublejumpH()
		   attack()
		   sleep(550)
			$yellowPixel = PixelSearch(182, 70, 214, 105, 0xFFdd44, 10); right
		WEnd
	  	Send("{right up}")
	 EndIf

	 moveleft(15)

$yellowPixel = PixelSearch(182, 86, 214, 83, 0xFFdd44, 10); rightTop
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
	  While @error
		dropdown()
		sleep(200)
		$yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
	WEnd
	Send("{left up}")
	EndIf

	If isOFFCD($spearOfDarknesscol, $spearOfDarknessrow) Then
		spearOfDarkness()
	  	sleep(200)
    EndIf


	If isOFFCD($nightShadecol, $nightShaderow) Then
		nightShade()
	  	sleep(300)
    EndIf

$yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(9, 70, 41, 105, 0xFFdd44, 10); left
		While @error
	      doublejumpH()
		   attack()
		   sleep(550)
			$yellowPixel = PixelSearch(9, 70, 41, 105, 0xFFdd44, 10); left
		WEnd
	  	Send("{left up}")
   EndIf

$yellowPixel = PixelSearch(9, 76, 41, 83, 0xFFdd44, 10); leftTop
If Not @error Then
   Send("{right down}")
   $yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
	  While @error
		dropdown()
		sleep(200)
		$yellowPixel = PixelSearch(9, 88, 214, 105, 0xFFdd44, 10); botPlat
	WEnd
	Send("{right up}")
 EndIf

   moveright(15)

	If isOFFCD($spearOfDarknesscol, $spearOfDarknessrow) Then
		spearOfDarkness()
	  	sleep(200)
    EndIf

	If isOFFCD($eyeShockcol, $eyeShockrow) Then
	   Send($jumpbutton)
	   sleep(100)
		eyeShock()
	  	sleep(200)
    EndIf



EndFunc




;	FUNCTIONS

Func setPause()
   $pause = NOT $pause
   While $pause
	  sleep(100)
   Wend
EndFunc

Func close()
   send("{left up}")
   send("{right up}")
   send("{up up}")
   send("{down up}")
   Exit
EndFunc

Func startScript()
   $click = True
   $start = True
EndFunc

Func dropdown()
   Send("{down down}")
   sleep(100)
   send($jumpbutton)
   sleep(150)
   send("{down up}")
EndFunc

Func isOffCD($col, $row)
   Local $cdSkillColor = 000000
   Local $skillIconWidth = 35
   Local $toprow = 1031
   Local $firstColumn = 1574

   local $cdColor = PixelGetColor($firstcolumn + ($col * $skilliconwidth), $toprow + ($row * $skilliconWidth))
   Return $cdColor <> $cdskillcolor
EndFunc

Func attack()
   Send($impaleButton)
   sleep(100)
EndFunc

Func doublejumpH()
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
EndFunc

Func jumpattack()
   Send($jumpbutton)
   attack()
EndFunc

Func jumpattackR()
   moveright(15)
   Send($jumpbutton)
   sleep(200)
   attack()
EndFunc

Func jumpattackL()
   moveleft(15)
   Send($jumpbutton)
   sleep(200)
   attack()
EndFunc


;~ Func upJump()
;~    Send("{up down}")
;~    sleep(150)
;~ 	  Send($jumpbutton)
;~ 	  sleep(100)
;~ 	  Send($jumpbutton)
;~ 	  sleep(100)
;~ 	  Send($jumpbutton)
;~    Send("{up up}")
;~    sleep(200)
;~ EndFunc

Func eyeShock()
   While isOFFCD($eyeShockcol,$eyeShockrow)
	  Send($eyeshockbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func nightShade()
   While isOFFCD($nightShadecol,$nightShaderow)
	  Send($nightShadebutton)
	  sleep(400)
   WEnd
   sleep(100)
EndFunc

Func spearOfDarkness()
   While isOFFCD($spearOfDarknesscol,$spearOfDarknessrow)
	  Send($spearofDarknessbutton)
	  sleep(400)
   WEnd
   sleep(100)
EndFunc



Func moveLeft($distance)
   Send("{LEFT down}")
   Sleep($distance)
   Send("{LEFT up}")
EndFunc

Func moveRight($distance)
   Send("{RIGHT down}")
   Sleep($distance)
   Send("{RIGHT up}")
EndFunc