#include<IE.au3>
#include <Misc.au3>
#RequireAdmin
Opt('TrayIconDebug',1)

HotKeySet("{F10}" , "close")
HotKeySet("{F11}", "startScript")
HotKeySet("{F9}", "setPause")
;~ HotKeySet ("{INS}", "test")
Dim $click = False
Dim $start = False
Dim $count = 0
Dim $looptime = 30
$pause = False
Dim $leftdown = False
Dim $rightdown = True

Dim $falconsHonorRow = 1
Dim $falconsHonorCol = 1
Dim $instantSliceRow = 1
Dim $instantSliceCol = 2
Dim $summonRow = 1
Dim $summonCol = 3
Dim $sengokuRow = 0
Dim $sengokuCol = 3



Dim $totemButton = "'"
Dim $falconsHonorButton = "z"
Dim $instantSliceButton = "x"
Dim $summonButton = "{PGUP}"
Dim $sengokuButton = "4"
Dim $phantomBladeButton = "f"
Dim $jumpButton = "w"


Global $totemTimer
Global $collectTimer
consolewrite("script activated" & @LF)

While 1
   If $click = True Then
	  totemtimer()
	  $count += 1
   EndIf
   WEnd

Func totemtimer()
    totemSetup()
    combo()
 EndFunc

 Func totemSetup()
	totem()
	Global $totemTimer = TimerInit()
	sleep(300)
EndFunc

Func combo()
While TimerDiff($totemTimer) < 30000

	If isOFFCD($falconsHonorcol, $falconsHonorrow) Then
		falconsHonor()
	  	sleep(600)
    EndIf

 	If isOFFCD($instantSlicecol, $instantSlicerow) Then
		instantSlice()
	  	sleep(500)
    EndIf

   Sleep(4000)
	If isOFFCD($summoncol, $summonrow) Then
		summon()
	  	sleep(300)
    EndIf
   moveRight(75)
   Send($jumpbutton)
   sleep(150)
   phantomBlade()
   Sleep(400)
   moveLeft(75)
   Send($jumpbutton)
   sleep(150)
   phantomBlade()



	If isOFFCD($sengokucol, $sengokurow) Then
		sengoku()
	  	sleep(300)
    EndIf

   Sleep(3000)
   WEnd
   EndFunc


; functions
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

Func isOffCD($col, $row)
   Local $cdSkillColor = 000000
   Local $skillIconWidth = 35
   Local $toprow = 1031
   Local $firstColumn = 1574

   local $cdColor = PixelGetColor($firstcolumn + ($col * $skilliconwidth), $toprow + ($row * $skilliconWidth))
   Return $cdColor <> $cdskillcolor
EndFunc

Func totem()
   Send($totembutton)
   sleep(50)
   Send($totembutton)
   sleep(50)
EndFunc

Func falconsHonor()
   While isOFFCD($falconsHonorcol,$falconsHonorrow)
	  Send($falconsHonorbutton)
	  sleep(300)
   WEnd
EndFunc

Func summon()
   While isOFFCD($summoncol,$summonrow)
	  Send($summonbutton)
	  sleep(400)
   WEnd
EndFunc

Func sengoku()
   While isOFFCD($sengokucol,$sengokurow)
	  Send($sengokubutton)
	  sleep(300)
   WEnd
EndFunc

Func instantSlice()
   While isOFFCD($instantSlicecol,$instantSlicerow)
	  Send($instantSlicebutton)
	  sleep(300)
   WEnd
EndFunc

Func phantomBlade()
	Send($phantomBladeButton)
	sleep(500)
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