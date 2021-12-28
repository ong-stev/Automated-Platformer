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

consolewrite("script activated" & @LF)
Func test()
   MTS4Collect())
EndFunc

While 1
   If $click = True Then

	  LeftClick()
	  $count += 1
   EndIf
WEnd


Func LeftClick()
MouseClick ($MOUSE_CLICK_LEFT, 531, 991, 1, 2)
sleep(1000)
Send("{ENTER}")
sleep(3000)
MouseClick ($MOUSE_CLICK_LEFT, 299, 972, 1, 2)
sleep(320000)
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

