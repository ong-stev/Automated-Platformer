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


Dim $impaleButton = "e"
Dim $jumpbutton = "w"
Dim $eyeShockButton = "q"
Dim $nightShadeButton = "r"


;   MINIMAP BOXES
;$yellowPixel = PixelSearch(9, 89, 57, 108, 0xFFdd44, 10); left
;$yellowPixel = PixelSearch(205, 89, 233, 108, 0xFFdd44, 10); right
;$yellowPixel = PixelSearch(9, 95, 233, 107, 0xFFdd44, 10); botPlat



Global $totemTimer
Global $collectTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
   dJumpAttack()
EndFunc

While 1
   If $click = True Then
	  BoC()
	  $count += 1
   EndIf
   WEnd


Func BoC()
	BoCCombo()
EndFunc

Func BoCCombo()
$yellowPixel = PixelSearch(9, 95, 233, 107, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{right down}")
	$yellowPixel = PixelSearch(205, 89, 233, 108, 0xFFdd44, 10); right
		While @error
	      doublejumpH()
		   attack()
		   sleep(550)
			$yellowPixel = PixelSearch(205, 89, 233, 108, 0xFFdd44, 10); right
		WEnd
	  	Send("{right up}")
   EndIf

$yellowPixel = PixelSearch(9, 95, 233, 107, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(9, 89, 57, 108, 0xFFdd44, 10); left
		While @error
	      doublejumpH()
		   attack()
		   sleep(550)
			$yellowPixel = PixelSearch(9, 89, 57, 108, 0xFFdd44, 10); left
		WEnd
	  	Send("{left up}")

	If isOFFCD($eyeShockcol, $eyeShockrow) Then
		eyeShock()
	  	sleep(200)
    EndIf

	If isOFFCD($nightShadecol, $nightShaderow) Then
		nightShade()
	  	sleep(300)
    EndIf
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