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
Dim $shardbreakerRow = 0
Dim $shardbreakerCol = 8
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
	  DC4()
	  $count += 1
   EndIf
   WEnd

Func DC4()
   DC4setup()
   DC4combo()
EndFunc

Func DC4setup()
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

Func DC4combo()
While TimerDiff($totemTimer) < 60000

setup()
If Not @error Then
   Send("{left down}")
   bound1()
	  While @error
		 doublejump()
		 attack()
		 sleep(180)
		 bound1()
	  WEnd
	  Send("{left up}")
   EndIf

leftBottom()
If Not @error Then
   Send("{right down}")
   bound2()
	  While @error
		 If isOffCD($impalecol, impalerow) Then
			rushM(right, up)
		 EndIf
		 upJumpR()
		 attack()
		 sleep(800)
		 bound2()
	  WEnd
	  Send("{right up}")
   EndIf

#comments-start
   If isOFFCD($reigncol, $reignrow) Then
	  reign()
	  sleep(600)
   EndIf
#comments-end

jumpupRight()
If Not @error Then
   Send("{right down}")
   bound2()
	  While @error
		 upJumpR()
		 attack()
		 sleep(800)
		 bound2()
	  WEnd
	  Send("{right up}")
   EndIf

#comments-start
   If isOFFCD($shardbreakercol, $shardbreakerrow) Then
	  shardbreaker()
	  sleep(500)
   EndIf
#comments-end

leftTop()
If Not @error Then
   Send("{right down}")
   pillar1()
	  While @error
		 doublejump()
		 attack()
		 sleep(180)
		 pillar1()
	  WEnd
	  Send("{right up}")
   EndIf

middleNull()
If Not @error Then
   Send("{right down}")
   bound2()
	  While @error
		 If isOffCD($impalecol, impalerow) Then
			rushM(right, up)
		 EndIf
		 upJumpR()
		 attack()
		 sleep(800)
		 bound2()
WEnd
Send("{right up}")
EndIf

middleNull2()
If Not @error Then
   Send("{right down}")
   bound2()
   While @error
   	  If isOffCD($impalecol, impalerow) Then
		 rushM(right, up)
	  EndIf
   upJumpR()
   attack()
   sleep(800)
   bound2()
WEnd
Send("{right up}")
EndIf

#comments-start
   If isOFFCD($infinitycol, $infinityrow) Then
	  infinity()
	  sleep(1200)
   EndIf
#comments-end

middleTop()
If Not @error Then
   Send("{right down}")
   pillar2()
   While @error
   doublejump()
   attack()
   sleep(180)
   pillar2()
WEnd
Send("{right up}")
EndIf

middleTop2()
If Not @error Then
   Send("{right down}")
   bound3()
   While @error
   doublejump()
   attack()
   sleep(180)
   bound3()
WEnd
Send("{right up}")
EndIf

#comments-start
   If isOFFCD($bloomcol, $bloomrow) Then
	  bloom()
	  sleep(600)
   EndIf
#comments-end


rightTop()
If Not @error Then
   Send("{left down}")
   setup()
   While @error
   dropdown()
   Send($plummetButton)
   attack()
   sleep(200)
   setup()
WEnd
Send("{left up}")
EndIf

dropdownLeft()
If Not @error Then
   Send("{left down}")
   setup()
   While @error
   dropdown()
   Send($plummetButton)
   attack()
   sleep(200)
   setup()
WEnd
Send("{left up}")
EndIf
WEnd
EndFunc









;   MINIMAP BOXES
$setup() = $yellowPixel = PixelSearch(85, 141, 189, 154, 0xFFdd44, 10)


leftBottom()
   $yellowPixel = PixelSearch(66, 141, 83, 154, 0xFFdd44, 10)


jumpUpRight()
   $yellowPixel = PixelSearch(63, 113, 96, 139, 0xFFdd44, 10)


Func leftTop()
   $yellowPixel = PixelSearch(66, 84, 96, 111, 0xFFdd44, 10)
EndFunc

Func middleTop()
   $yellowPixel = PixelSearch(98, 95, 130, 108, 0xFFdd44, 10)
EndFunc

Func middleTop2()
   $yellowPixel = PixelSearch(132, 82, 160, 101, 0xFFdd44, 10)
EndFunc

Func middleNull()
   $yellowPixel = PixelSearch(98, 110, 130, 139, 0xFFdd44, 10)
EndFunc

Func middleNull2()
   $yellowPixel = PixelSearch(132, 103, 160, 139, 0xFFdd44, 10)
EndFunc

Func rightTop()
   $yellowPixel = PixelSearch(162, 68, 189, 98, 0xFFdd44, 10)
EndFunc

Func dropdownLeft()
   $yellowPixel = PixelSearch(62, 100, 189, 139, 0xFFdd44, 10)
EndFunc

Func bound1()
   $yellowPixel = PixelSearch(66, 84, 83, 154, 0xFFdd44, 10)
EndFunc

Func bound2()
   $yellowPixel = PixelSearch(66, 68, 189, 112, 0xFFdd44, 10)
EndFunc

Func bound3()
   $yellowPixel = PixelSearch(176, 68, 189, 154, 0xFFdd44, 10)
EndFunc

Func pillar1()
   $yellowPixel = PixelSearch(98, 95, 130, 154, 0xFFdd44, 10)
EndFunc

Func pillar2()
   $yellowPixel = PixelSearch(132, 88, 160, 154, 0xFFdd44, 10)
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