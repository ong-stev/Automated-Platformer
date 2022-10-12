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

Dim $impaleRow = 0
Dim $impaleCol = 6
Dim $reignRow = 1
Dim $reignCol = 5
Dim $featherfloatRow = 1
Dim $featherfloatCol = 4
Dim $bloomRow = 1
Dim $bloomCol = 3
Dim $noblesummonsRow = 1
Dim $noblesummonsCol = 2
Dim $infinityRow = 1
Dim $infinityCol = 7
Dim $lucidRow = 0
Dim $lucidCol = 8
Dim $legacyRow = 0
Dim $legacyCol = 3
Dim $ruinRow = 1
Dim $ruinCol = 8
Dim $stormRow = 1
Dim $stormCol = 9
Dim $weaponauraRow = 0
Dim $weaponauraCol = 0
Dim $arachnidRow = 1
Dim $arachnidCol = 6

Dim $cleaveButton = "e"
Dim $impaleButton = "d"
Dim $rushButton = "f"
Dim $reignButton = "v"
Dim $featherfloatbutton = "c"
Dim $bloomButton = "x"
Dim $plummetButton = "q"
Dim $noblesummonsButton = "z"
Dim $infinityButton = "{DEL}"
Dim $lucidButton = "t"
Dim $legacyButton = "4"
Dim $ruinButton = "{PGUP}"
Dim $stormButton = "{PGDN}"
Dim $weaponauraButton = "1"
Dim $jumpbutton = "w"
Dim $jauntButton = "{ALT}"
Dim $arachnidButton = "b"
Dim $totemButton = "'"
Dim $huntingdecreeButton = "a"
Dim $petFood = "{F7}"

;   MINIMAP BOXES
;$yellowPixel = PixelSearch(88, 71, 143, 73, 0xFFdd44, 10); topPlat
;$yellowPixel = PixelSearch(73, 71, 84, 77, 0xFFdd44, 10); topPlat2
;$yellowPixel = PixelSearch(10, 112, 198, 121, 0xFFdd44, 10); botPlat
;$yellowPixel = PixelSearch(171, 112, 198, 121, 0xFFdd44, 10); upJump
;$yellowPixel = PixelSearch(151, 61, 198, 121, 0xFFdd44, 10); right1
;$yellowPixel = PixelSearch(87, 61, 149, 121, 0xFFdd44, 10); right2
;$yellowPixel = PixelSearch(53, 61, 85, 121, 0xFFdd44, 10); right3
;$yellowPixel = PixelSearch(12, 61, 51, 121, 0xFFdd44, 10); right4
;$yellowPixel = PixelSearch(152, 91, 198, 110, 0xFFdd44, 10); rightH1
;$yellowPixel = PixelSearch(151, 70, 198, 89, 0xFFdd44, 10); rightH2
;$yellowPixel = PixelSearch(88, 97, 148, 121, 0xFFdd44, 10); rightH3
;$yellowPixel = PixelSearch(88, 81, 148, 95, 0xFFdd44, 10); rightH4
;$yellowPixel = PixelSearch(54, 99, 84, 121, 0xFFdd44, 10); rightH5
;$yellowPixel = PixelSearch(54, 80, 84, 97, 0xFFdd44, 10); rightH6
;$yellowPixel = PixelSearch(26, 99, 50, 121, 0xFFdd44, 10); rightH7
;$yellowPixel = PixelSearch(26, 80, 50, 97, 0xFFdd44, 10); rightH8
;$yellowPixel = PixelSearch(11, 61, 25, 121, 0xFFdd44, 10); leftBound
;$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound









Global $totemTimer
Global $collectTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
		 If isOffCD($impalecol, $impalerow) Then
         Send($jumpbutton)
         Sleep(100)
			upjumpR()
			sleep(200)
			rushM("left", "up")
		 EndIf
EndFunc

While 1
   If $click = True Then
	  OIW3()
	  $count += 1
   EndIf
   WEnd


Func OIW3()
	OIW3Setup()
	OIW3Combo()
EndFunc

Func OIW3Setup()
   If isOFFCD($weaponauracol, $weaponaurarow) Then
	  weaponaura()
	  sleep(200)
   EndIf

   If isOFFCD($arachnidcol, $arachnidrow) Then
	  arachnid()
	  sleep(200)
   EndIf

   totem()
   Global $totemTimer = TimerInit()
   sleep(300)

EndFunc

Func OIW3Combo()
While TimerDiff($totemTimer) < 30000
$yellowPixel = PixelSearch(10, 112, 198, 121, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{right down}")
	$yellowPixel = PixelSearch(171, 112, 198, 121, 0xFFdd44, 10); upJump
		While @error
	    	doublejumpH()
			attack()
			huntingdecree()
			sleep(550)
			$yellowPixel = PixelSearch(171, 112, 198, 121, 0xFFdd44, 10); upJump
		WEnd
	  	Send("{right up}")
   EndIf

$yellowPixel = PixelSearch(10, 112, 198, 121, 0xFFdd44, 10); botPlat
If Not @error Then
   Send("{left down}")
	  If isOffCD($impalecol, $impalerow) Then
      Send($jumpbutton)
      Sleep(50)
		upjumpR()
		sleep(200)
		rushM("left", "up")
		sleep(200)
		EndIf
		$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
			While @error
			upJumpL()
			attack()
			sleep(350)
			$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
		WEnd
		Send("{left up}")
EndIf

$yellowPixel = PixelSearch(152, 91, 198, 110, 0xFFdd44, 10); rightH1
If Not @error Then
   Send("{left down}")
		$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
			While @error
			upJumpL()
			attack()
			sleep(450)
			$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
		WEnd
		Send("{left up}")
EndIf

	If isOFFCD($reigncol, $reignrow) Then
		reign()
	  	sleep(300)
    EndIf

$yellowPixel = PixelSearch(151, 70, 198, 89, 0xFFdd44, 10); rightH2
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(87, 61, 149, 121, 0xFFdd44, 10); right2
		While @error
	   doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(87, 61, 149, 121, 0xFFdd44, 10); right2
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(88, 97, 148, 121, 0xFFdd44, 10); rightH3
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
	  While @error
		upJumpL()
		attack()
		sleep(450)
		$yellowPixel = PixelSearch(10, 61, 198, 94, 0xFFdd44, 10); topBound
	  WEnd
	  Send("{left up}")
EndIf

$yellowPixel = PixelSearch(88, 81, 148, 95, 0xFFdd44, 10); rightH4
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(53, 61, 85, 121, 0xFFdd44, 10); right3
		While @error
	   doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(53, 61, 85, 121, 0xFFdd44, 10); right3
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(73, 71, 143, 73, 0xFFdd44, 10); topPlat
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(53, 61, 85, 121, 0xFFdd44, 10); right3
		While @error
	   doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(53, 61, 85, 121, 0xFFdd44, 10); right3
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(73, 71, 84, 77, 0xFFdd44, 10); topPlat2
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(12, 61, 51, 121, 0xFFdd44, 10); right4
		While @error
	   doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(12, 61, 51, 121, 0xFFdd44, 10); right4
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(26, 99, 84, 121, 0xFFdd44, 10); rightH5
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(10, 61, 198, 100, 0xFFdd44, 10); topBound edited
	  While @error
		upJumpL()
		attack()
		sleep(450)
		$yellowPixel = PixelSearch(10, 61, 198, 100, 0xFFdd44, 10); topBound edited
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(54, 80, 84, 97, 0xFFdd44, 10); rightH6
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(12, 61, 51, 121, 0xFFdd44, 10); right4
		While @error
	   doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(12, 61, 51, 121, 0xFFdd44, 10); right4
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(26, 99, 50, 121, 0xFFdd44, 10); rightH7
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(10, 61, 198, 100, 0xFFdd44, 10); topBound edited
	  While @error
		upJumpL()
		attack()
		sleep(450)
		$yellowPixel = PixelSearch(10, 61, 198, 100, 0xFFdd44, 10); topBound edited
	WEnd
	Send("{left up}")
EndIf

$yellowPixel = PixelSearch(26, 80, 50, 97, 0xFFdd44, 10); rightH8
If Not @error Then
   Send("{right down}")
   $yellowPixel = PixelSearch(10, 112, 198, 121, 0xFFdd44, 10); botPlat
	  While @error
		dropdown()
		sleep(200)
		Send($jumpbutton)
		sleep(50)
		attack()
		sleep(500)
		$yellowPixel = PixelSearch(10, 112, 198, 121, 0xFFdd44, 10); botPlat
	WEnd
	Send("{right up}")
EndIf


   	If isOFFCD($infinitycol, $infinityrow) Then
		infinity()
		sleep(500)
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
   Send($cleaveButton)
   sleep(100)
EndFunc

Func huntingdecree()
   Send($huntingdecreeButton)
   sleep(100)
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

Func doublejump()
   Send($jumpbutton)
   sleep(50)
   Send($jauntbutton)
EndFunc

Func doublejumpH()
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
EndFunc

Func upJump()
   Send("{up down}")
   sleep(150)
	  Send($jumpbutton)
	  sleep(100)
	  Send($jumpbutton)
	  sleep(100)
	  Send($jumpbutton)
   Send("{up up}")
   sleep(200)
EndFunc

Func upJumpR()
   Send("{up down}")
   Send("{right down}")
   sleep(150)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
   Send("{up up}")
   Send("{right up}")
   sleep(200)
EndFunc

Func upJumpL()
   Send("{up down}")
   Send("{left down}")
   sleep(150)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
   Send("{up up}")
   Send("{left up}")
   sleep(200)
EndFunc

Func rush($direction)
   Send("{" & $direction & " down}")
   sleep(50)
	  Send($impaleButton)
	  sleep(300)
	  Send($rushButton)
	  sleep(500)
   Send("{" & $direction & " up}")
   sleep(100)
EndFunc

Func rushM($direction, $direction2)
   Send("{" & $direction & " down}")
   Send("{" & $direction2 & " down}")
   sleep(50)
	  Send($impaleButton)
	  sleep(300)
	  Send($rushButton)
	  sleep(500)
   Send("{" & $direction & " up}")
   Send("{" & $direction2 & " up}")
   sleep(100)
EndFunc

Func totem()
   Send($totembutton)
   sleep(50)
   Send($totembutton)
   sleep(50)
EndFunc

Func reign()
   While isOFFCD($reigncol,$reignrow)
	  Send($reignbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func featherfloat()
   While isOFFCD($featherfloatcol,$featherfloatrow)
	  Send($featherfloatbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func bloom()
   While isOFFCD($bloomcol, $bloomrow)
	  Send($bloombutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func plummet()
   Send($plummetbutton)
   sleep(200)
EndFunc

Func noblesummons()
   While isOFFCD($noblesummonscol,$noblesummonsrow)
	  Send($noblesummonsbutton)
	  sleep(200)
   WEnd
   sleep(100)
EndFunc

Func infinity()
   While isOFFCD($infinitycol, $infinityrow)
	  Send($infinitybutton)
	  sleep(500)
   WEnd
   sleep(200)
EndFunc

Func shardbreaker()
   While isOFFCD($shardbreakercol, $shardbreakerrow)
	  Send($shardbreakerbutton)
	  sleep(300)
   WEnd
   sleep(200)
EndFunc

Func ruin()
   While isOFFCD($ruincol, $ruinrow)
	  Send($ruinbutton)
	  sleep(300)
   WEnd
   sleep(200)
EndFunc

Func storm()
   While isOFFCD($stormcol, $stormrow)
	  Send($stormbutton)
	  sleep(300)
   WEnd
   sleep(100)
EndFunc

Func legacy() ; buff
   While isOFFCD($legacycol, $legacyrow)
	  Send($legacybutton)
	  sleep(300)
   WEnd
   sleep(200)
EndFunc

Func weaponaura() ; buff
   While isOFFCD($weaponauracol, $weaponaurarow)
	  Send($weaponaurabutton)
	  sleep(500)
   WEnd
   sleep(100)
EndFunc

Func arachnid()
   While isOFFCD($arachnidcol, $arachnidrow)
	  Send($arachnidbutton)
	  sleep(300)
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