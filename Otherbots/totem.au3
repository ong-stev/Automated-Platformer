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


Global $totemTimer
Global $collectTimer

Dim $totemButton = "'"

consolewrite("script activated" & @LF)

While 1
   If $click = True Then
	  totemtimer()
	  $count += 1
   EndIf
   WEnd


Func totemtimer()
    totemSetup()
    sleep30()
 EndFunc

 Func totemSetup()
	totem()
	Global $totemTimer = TimerInit()
	sleep(300)
EndFunc

Func sleep30()
While TimerDiff($totemTimer) < 30000
   Sleep(100)
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