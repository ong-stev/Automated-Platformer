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

Dim $worldReaverRow = 1
Dim $worldReaverCol = 0
Dim $swordIllusionRow = 1
Dim $swordIllusionCol = 4
Dim $risingRageRow = 1
Dim $risingRageCol = 2
Dim $cryValhallaRow = 0
Dim $cryValhallaCol = 2
Dim $burningSoulbladeRow = 0
Dim $burningSoulbladeCol = 3
Dim $holySymbolRow = 1
Dim $holySymbolCol = 8
Dim $sharpEyesRow = 1
Dim $sharpEyesCol = 9


Dim $ragingBlowButton = "e"
Dim $worldReaverButton = "{LCTRL}"
Dim $swordIllusionButton = "{PGUP}"
Dim $jumpButton = "w"
Dim $risingRageButton= "t"
Dim $cryValhallaButton = "3"
Dim $burningSoulbladeButton = "4"
Dim $holySymbolButton = ";"
Dim $sharpEyesButton = "."
Dim $totemButton = "'"


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
   totemBuff()
	MF3Combo()
EndFunc

Func totemBuff()
   totem()
   Global $totemTimer = TimerInit()
   sleep(300)

   If isOFFCD($holySymbolcol, $holySymbolrow) Then
	  holySymbol()
	  sleep(300)
   EndIf

   If isOFFCD($sharpEyescol, $sharpEyesrow) Then
	  sharpEyes()
	  sleep(300)
   EndIf

   If isOFFCD($cryValhallacol, $cryValhallarow) Then
	  cryValhalla()
	  sleep(300)
   EndIf

   If isOFFCD($burningSoulbladecol, $burningSoulbladerow) Then
	  burningSoulblade()
	  sleep(300)
   EndIf

EndFunc

Func MF3Combo()
While TimerDiff($totemTimer) < 30000
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


	If isOFFCD($risingRagecol, $risingRagerow) Then
		risingRage()
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

	 moveright(15)

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

	If isOFFCD($worldReavercol, $worldReaverrow) Then
	  Send($jumpbutton)
		worldReaver()
	  	sleep(200)
    EndIf


WEnd
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
   Send($ragingBlowButton)
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

Func worldReaver()
   While isOFFCD($worldReavercol,$worldReaverrow)
	  Send($worldReaverbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func swordIllusion()
   While isOFFCD($swordIllusioncol,$swordIllusionrow)
	  Send($swordIllusionbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func risingRage()
   While isOFFCD($risingRagecol,$risingRagerow)
	  Send($risingRagebutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func cryValhalla()
   While isOFFCD($cryValhallacol,$cryValhallarow)
	  Send($cryValhallabutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func burningSoulblade()
   While isOFFCD($burningSoulbladecol,$burningSoulbladerow)
	  Send($burningSoulbladebutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func holySymbol()
   While isOFFCD($holySymbolcol,$holySymbolrow)
	  Send($holySymbolbutton)
	  sleep(500)
   WEnd
   sleep(100)
EndFunc

Func sharpEyes()
   While isOFFCD($sharpEyescol,$sharpEyesrow)
	  Send($sharpEyesbutton)
	  sleep(500)
   WEnd
   sleep(100)
EndFunc

Func totem()
   Send($totembutton)
   sleep(50)
   Send($totembutton)
   sleep(50)
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