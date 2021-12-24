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

Dim $impaleRow = 1
Dim $impaleCol = 9
Dim $reignRow = 1
Dim $reignCol = 5
Dim $featherfloatRow = 0
Dim $featherfloatCol = 5
Dim $bloomRow = 1
Dim $bloomCol = 3
Dim $noblesummonsRow = 1
Dim $noblesummonsCol = 2
Dim $infinityRow = 1
Dim $infinityCol = 7
Dim $shardbreakerRow = 0
Dim $shardbreakerCol = 7
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
Dim $shardbreakerButton = "t"
Dim $legacyButton = "4"
Dim $ruinButton = "{PGUP}"
Dim $stormButton = "{PGDN}"
Dim $weaponauraButton = "1"
Dim $jumpbutton = "w"
Dim $jauntButton = "{ALT}"
Dim $arachnidButton = "b"
Dim $totemButton = "'"
Dim $huntingdecreeButton = "a"

Global $totemTimer
Global $collectTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
   SSS1collect()
   SSS1collect()
EndFunc

While 1
   If $click = True Then
	  SSS1()
	  $count += 1
   EndIf
   WEnd

Func SSS1()
   For $i = 2 To 1 Step -1
   SSS1setup()
   SSS1combo()
Next
   SSS1collect()
EndFunc

Func SSS1setup()

;resets if bottom right of default
$yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
	  IF NOT @error Then
		 Send("{left down}")
		 doublejump()
		 $yellowPixel = PixelSearch(59, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 While @error
			doublejump()
			sleep(100)
			$yellowPixel = PixelSearch(59, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 WEnd
		 Send("{left up}")
	  EndIf

;resets if bottom left of default
$yellowPixel = PixelSearch(29, 103, 57, 113, 0xFFdd44, 10); Extra #4
   IF NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(59, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(59, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
		 WEnd
		 Send("{right up}")
	  EndIf

;resets if left of default
$yellowPixel = PixelSearch(53, 92, 71, 98, 0xFFdd44, 10); left of default
   IF NOT @error Then
   Send("{right down}")
	  $yellowPixel = PixelSearch(73, 92, 87, 98, 0xFFdd44, 10); default
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(73, 92, 87, 98, 0xFFdd44, 10); default
	  WEnd
	  Send("{right up}")
   EndIf


   $yellowPixel = PixelSearch(59, 103, 70, 113, 0xFFdd44, 10); Rectangle 7
   IF NOT @error Then
	  upjumpR()
	  sleep(800)
   EndIf
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

Func SSS1combo()
   While TimerDiff($totemTimer) < 27000
   For $i = 3 To 1 Step -1
$yellowPixel = PixelSearch(127, 79, 149, 87, 0xFFdd44, 10); Rectangle 2
	  IF NOT @error Then
		 Send("{left down}")
		 sleep(400)
		 jumpattack()
		 sleep(1900)
		 $yellowPixel = PixelSearch(95, 90, 127, 98, 0xFFdd44, 10); Rectangle 3
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(100, 72, 119, 82, 0xFFdd44, 10); Extra#2
			IF NOT @error Then
			   dropdown()
			   EndIf
			$yellowPixel = PixelSearch(95, 90, 127, 98, 0xFFdd44, 10); Rectangle 3
		 WEnd
		 Send("{left up}")
   EndIf


   $yellowPixel = PixelSearch(95, 90, 127, 98, 0xFFdd44, 10); Rectangle 3
	  IF NOT @error Then
		 Send("{right down}")
			doublejump()
			attack()
			sleep(180)
			doublejump()
			attack()
			sleep(180)
		 $yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
			WEnd
			Send("{right up}")
   EndIf
;resets if bottom right of default
$yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
	  IF NOT @error Then
		 Send("{left down}")
		 doublejump()
		 $yellowPixel = PixelSearch(59, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 While @error
			doublejump()
			sleep(100)
			$yellowPixel = PixelSearch(59, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 WEnd
		 Send("{left up}")
		 sleep(700)
	  EndIf

;resets if bottom left of default
$yellowPixel = PixelSearch(29, 103, 57, 113, 0xFFdd44, 10); Extra #4
   IF NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(59, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(59, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
		 WEnd
		 Send("{right up}")
	  EndIf

;resets if left of default
$yellowPixel = PixelSearch(53, 92, 71, 98, 0xFFdd44, 10); left of default
   IF NOT @error Then
   Send("{right down}")
	  $yellowPixel = PixelSearch(73, 92, 87, 98, 0xFFdd44, 10); default
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(73, 92, 87, 98, 0xFFdd44, 10); default
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(59, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
   IF NOT @error Then
	  upjumpR()
	  sleep(800)
   EndIf

	  attack()
	  sleep(75)
	  jumpattackL()
	  sleep(75)
	  attack()
	  sleep(75)
	  jumpattackR()
	  sleep(200)
   Next

   If isOFFCD($reigncol, $reignrow) Then
	  reign()
	  sleep(600)
   EndIf

   If isOFFCD($infinitycol, $infinityrow) Then
	  infinity()
	  sleep(1200)
   EndIf

   If isOFFCD($shardbreakercol, $shardbreakerrow) Then
	  shardbreaker()
	  sleep(500)
   EndIf

   attack()
   sleep(75)
   jumpattackL()
   sleep(75)
   jumpattackR()
   sleep(75)
   attack()
   sleep(200)

   If isOFFCD($bloomcol, $bloomrow) Then
	  bloom()
	  sleep(600)
   EndIf
   WEnd
EndFunc

Func SSS1collect()
   Global $collectTimer = TimerInit()
   While TimerDiff($collectTimer) < 4000
   totem()
   sleep(200)
   Send($stormbutton)
   sleep(600)

   $yellowPixel = PixelSearch(68, 92, 87, 98, 0xFFdd44, 10); Rectangle 8
      IF NOT @error Then
		 Send("{left down}")
		 $yellowPixel = PixelSearch(53, 92, 65, 98, 0xFFdd44, 10); End 1
		 While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(53, 92, 65, 98, 0xFFdd44, 10); End 1
	  WEnd
	  Send("{left up}")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(33, 72, 89, 82, 0xFFdd44, 10); Rectangle 1
   While @error
	  upjumpL()
	  sleep(1000)
	  WEnd

   $yellowPixel = PixelSearch(33, 72, 89, 88, 0xFFdd44, 10); Rectangle 1
	  IF NOT @error Then
		 Send("{right down}")
		 sleep(200)
		 $yellowPixel = PixelSearch(121, 72, 162, 98, 0xFFdd44, 10); Rectangle 2 modified
		 While @error
		 doublejump()
		 attack()
		 sleep(220)
		 $yellowPixel = PixelSearch(121, 72, 162, 98, 0xFFdd44, 10); Rectangle 2 modified
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(127, 79, 149, 87, 0xFFdd44, 10); Rectangle 2
	  IF NOT @error Then
		 Send("{left down}")
		 sleep(2700)
		 $yellowPixel = PixelSearch(95, 90, 127, 113, 0xFFdd44, 10); Rectangle 3
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(109, 72, 119, 82, 0xFFdd44, 10); Extra#2
			IF NOT @error Then
			   dropdown()
			   EndIf
			$yellowPixel = PixelSearch(95, 90, 127, 113, 0xFFdd44, 10); Rectangle 3
		 WEnd
		 Send("{left up}")
   EndIf


   $yellowPixel = PixelSearch(95, 90, 127, 98, 0xFFdd44, 10); Rectangle 3
	  IF NOT @error Then
		 Send("{right down}")
			doublejump()
			attack()
			sleep(180)
			doublejump()
			attack()
			sleep(180)
		 $yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
			WEnd
			Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(79, 104, 161, 113, 0xFFdd44, 10); Rectangle 5
	  IF NOT @error Then
		 Send("{left down}")
		 $yellowPixel = PixelSearch(53, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 While @error
			doublejump()
			attack()
			sleep(180)
			$yellowPixel = PixelSearch(53, 103, 77, 113, 0xFFdd44, 10); Rectangle 7
		 WEnd
		 Send("{left up}")
		 sleep(800)
   EndIf

   $yellowPixel = PixelSearch(53, 103, 81, 113, 0xFFdd44, 10); Rectangle 7
   IF NOT @error Then
	  upjumpR()
	  sleep(800)
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

Func dropdown($sleeptime = 0)
   Send("{down down}")
   sleep(100)
   send($jumpbutton)
   sleep(150)
   send("{down up}")
   Sleep($sleeptime)
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
   Send($huntingdecreeButton)
   sleep(475)
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

Func upJump()
   Send("{up down}")
   sleep(100)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
   Send("{up up}")
   sleep(100)
EndFunc

Func upJumpR()
   Send("{up down}")
   Send("{right down}")
   sleep(100)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
	  Send($jumpbutton)
	  sleep(75)
   Send("{up up}")
   Send("{right up}")
   sleep(100)
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
   sleep(100)
EndFunc

Func rush($direction)
   Send("{" & $direction & " down}")
   sleep(100)
	  Send($impaleButton)
	  sleep(675)
	  Send($rushButton)
	  sleep(300)
   Send("{" & $direction & " up}")
   sleep(100)
EndFunc

Func rushM($direction, $direction2)
   Send("{" & $direction & " down}")
   Send("{" & $direction2 & " down}")
   sleep(100)
	  Send($impaleButton)
	  sleep(700)
	  Send($rushButton)
	  sleep(300)
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
   While isOFFCD($plummetcol,$plummetrow)
	  Send($plummetbutton)
	  sleep(200)
   WEnd
   sleep(100)
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