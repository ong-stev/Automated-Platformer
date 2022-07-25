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
;setup = $yellowPixel = PixelSearch(109, 141, 189, 154, 0xFFdd44, 10); setup
;leftBottom = $yellowPixel = PixelSearch(66, 141, 107, 154, 0xFFdd44, 10); leftBottom
;jumpUpRight = $yellowPixel = PixelSearch(63, 113, 96, 139, 0xFFdd44, 10); jumpupRight
;leftTop = $yellowPixel = PixelSearch(66, 84, 96, 111, 0xFFdd44, 10); leftTop
;middleTop = $yellowPixel = PixelSearch(98, 95, 130, 108, 0xFFdd44, 10); middleTop
;middleTop2 = $yellowPixel = PixelSearch(132, 82, 160, 101, 0xFFdd44, 10); middleTop2
;middleNull = $yellowPixel = PixelSearch(98, 110, 130, 139, 0xFFdd44, 10); middleNull
;middleNull2 = $yellowPixel = PixelSearch(132, 103, 160, 139, 0xFFdd44, 10); middleNull2
;rightTop = $yellowPixel = PixelSearch(162, 68, 189, 98, 0xFFdd44, 10); rightTop
;dropdownLeft = $yellowPixel = PixelSearch(162, 100, 189, 139, 0xFFdd44, 10); dropdownLeft
;bound1 = $yellowPixel = PixelSearch(63, 84, 70, 154, 0xFFdd44, 10); bound1
;bound2 = $yellowPixel = PixelSearch(66, 68, 189, 112, 0xFFdd44, 10); bound2
;bound3 = $yellowPixel = PixelSearch(176, 68, 189, 154, 0xFFdd44, 10); bound3
;pillar1 = $yellowPixel = PixelSearch(98, 95, 130, 154, 0xFFdd44, 10); pillar1
;pillar2 = $yellowPixel = PixelSearch(132, 88, 160, 154, 0xFFdd44, 10); pillar2
;collect1 = $yellowPixel = PixelSearch(132, 121, 189, 139, 0xFFdd44, 10); collect1
;collect2 = $yellowPixel = PixelSearch(66, 128, 106, 154, 0xFFdd44, 10); collect2
;collect3 = $yellowPixel = PixelSearch(66, 113, 96, 154, 0xFFdd44, 10); collect3
;collectmiddlePlat = $yellowPixel = PixelSearch(98, 126, 118, 139, 0xFFdd44, 10); collectmiddlePlat

;$yellowPixel = PixelSearch(74, 103, 184, 117, 0xFFdd44, 10); botPlat
;$yellowPixel = PixelSearch(138, 103, 184, 117, 0xFFdd44, 10); botPlatRight
;$yellowPixel = PixelSearch(103, 103, 136, 117, 0xFFdd44, 10); botPlatMid
;$yellowPixel = PixelSearch(68, 103, 87, 117, 0xFFdd44, 10); botPlatLeft
;$yellowPixel = PixelSearch(68, 103, 74, 117, 0xFFdd44, 10); leftBound
;$yellowPixel = PixelSearch(74, 86, 106, 99, 0xFFdd44, 10); midPlatLeft
;$yellowPixel = PixelSearch(108, 86, 146, 99, 0xFFdd44, 10); midPlatMid
;$yellowPixel = PixelSearch(148, 86, 177, 99, 0xFFdd44, 10); midPlatRight
;$yellowPixel = PixelSearch(148, 86, 184, 117, 0xFFdd44, 10); botMidPlatRight
;$yellowPixel = PixelSearch(87, 72, 154, 84, 0xFFdd44, 10); dropDown
;$yellowPixel = PixelSearch(74, 72, 177, 100, 0xFFdd44, 10); topBound
;$yellowPixel = PixelSearch(108, 86, 146, 117, 0xFFdd44, 10); midBound




Global $totemTimer
Global $collectTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
		 If isOffCD($impalecol, $impalerow) Then
			upjumpL()
			sleep(200)
			rushM("right", "up")
		 EndIf
EndFunc

While 1
   If $click = True Then
	  WCRB1()
	  $count += 1
   EndIf
   WEnd


Func WCRB1()
	WCRB1Setup()
	WCRB1Combo()
EndFunc

Func WCRB1Setup()
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

Func WCRB1Combo()
While TimerDiff($totemTimer) < 30000
$yellowPixel = PixelSearch(74, 103, 184, 117, 0xFFdd44, 10); botPlat
If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(68, 103, 74, 117, 0xFFdd44, 10); leftBound
		While @error
	    	doublejumpH()
			attack()
			huntingdecree()
			sleep(550)
			$yellowPixel = PixelSearch(68, 103, 74, 117, 0xFFdd44, 10); leftBound
		WEnd
	  	Send("{left up}")
   EndIf



$yellowPixel = PixelSearch(68, 103, 87, 117, 0xFFdd44, 10); botPlatLeft
If Not @error Then
   Send("{right down}")
		$yellowPixel = PixelSearch(74, 72, 177, 100, 0xFFdd44, 10); topBound
			While @error
			upJumpR()
			attack()
			sleep(450)
			$yellowPixel = PixelSearch(74, 72, 177, 100, 0xFFdd44, 10); topBound
		WEnd
		Send("{right up}")
EndIf

	If isOFFCD($reigncol, $reignrow) Then
		reign()
	  	sleep(300)
    EndIf

$yellowPixel = PixelSearch(74, 86, 106, 99, 0xFFdd44, 10); midPlatLeft
If Not @error Then
   Send("{right down}")
   $yellowPixel = PixelSearch(108, 86, 146, 117, 0xFFdd44, 10); midBound
	  While @error
	     doublejumpH()
		 attack()
		 sleep(550)
		 $yellowPixel = PixelSearch(108, 86, 146, 117, 0xFFdd44, 10); midBound
	  WEnd
	  Send("{right up}")
EndIf

$yellowPixel = PixelSearch(103, 103, 136, 117, 0xFFdd44, 10); botPlatMid
If Not @error Then
   Send("{right down}")
   $yellowPixel = PixelSearch(74, 72, 177, 100, 0xFFdd44, 10); topBound
		While @error
		upJumpR()
		attack()
		sleep(350)
		$yellowPixel = PixelSearch(74, 72, 177, 100, 0xFFdd44, 10); topBound
	WEnd
	Send("{right up}")
EndIf

$yellowPixel = PixelSearch(108, 86, 146, 99, 0xFFdd44, 10); midPlatMid
If Not @error Then
   Send("{right down}")
   $yellowPixel = PixelSearch(148, 86, 184, 117, 0xFFdd44, 10); botMidPlatRight
	  While @error
	    doublejumpH()
		attack()
		sleep(550)
		$yellowPixel = PixelSearch(148, 86, 184, 117, 0xFFdd44, 10); botMidPlatRight
	WEnd
	Send("{right up}")
EndIf


   	If isOFFCD($infinitycol, $infinityrow) Then
		infinity()
		sleep(500)
		Send($petFood)
		Send($petFood)
   	EndIf

;~ $yellowPixel = PixelSearch(130, 68, 170, 86, 0xFFdd44, 10); rightTop
;~ If Not @error Then
;~    totem()
;~    sleep(400)
;~    Send("{left down}")
;~ 	$yellowPixel = PixelSearch(22, 98, 170, 109, 0xFFdd44, 10); bottom
;~ 	  While @error
;~ 		dropdown()
;~ 		sleep(250)
;~ 		Send($jumpbutton)
;~ 		sleep(50)
;~ 		attack()
;~ 		sleep(500)
;~ 		$yellowPixel = PixelSearch(22, 98, 170, 109, 0xFFdd44, 10); bottom
;~ 	WEnd
;~ 	Send("{left up}")
;~ EndIf


$yellowPixel = PixelSearch(148, 86, 177, 99, 0xFFdd44, 10); midPlatRight
If Not @error Then
   Send("{left down}")
   $yellowPixel = PixelSearch(74, 103, 184, 117, 0xFFdd44, 10); botPlat
	  While @error
		dropdown()
		sleep(200)
		Send($jumpbutton)
		sleep(50)
		attack()
		sleep(500)
		$yellowPixel = PixelSearch(74, 103, 184, 117, 0xFFdd44, 10); botPlat
	WEnd
	Send("{left up}")
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
   sleep(100)
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