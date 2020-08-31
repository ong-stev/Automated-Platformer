#includ	e<IE.au3>
#include <Misc.au3>
#RequireAdmin

HotKeySet("{END}" , "close")
HotKeySet("{HOME}", "startScript")
HotKeySet("{INS}", "setPause")
HotKeySet("{F10}", "test")
Dim $click = False
Dim $count = 0
Dim $looptime = 20
Dim $pause = False
Dim $totem = False

Dim $carnageButton = "6"
Dim $HSButton = "r"
Dim $domainButton = "d"
Dim $attackButton = "a"
Dim $adrenalineButton = "w"
Dim $finalBlowButton = "8"
Dim $buffButton = "q"
Dim $jumpButton = "{space}"
Dim $fjButton = "{LShift}"
Dim $BBButton = "s"
Dim $totemButton = "9"
Dim $furyButton = "f"
Dim $showerbutton = "e"

Dim $hsRow = 1
Dim $hsCol = 7
Dim $carnageRow = 0
Dim $carnageCol = 5
Dim $domainRow = 1
Dim $domainCol = 1
Dim $adrenalinecol = 5
Dim $adrenalinerow = 0
Dim $furycol = 3
Dim $furyRow = 1
Dim $showercol = 6
Dim $showerRow = 1
consolewrite("script activated" & @LF)

func test()
   send($totemButton)
   sleep(400)
   swipe()
EndFunc

Func close()
   send("{left up}")
   send("{right up}")
   send("{up up}")
   send("{down up}")
   Exit
 EndFunc

Func setPause()
   $pause = NOT $pause
   While $pause
	  sleep(100)
   Wend
EndFunc

While 1
	  If $click = True Then
		 moveleft(200)
		 If isoffCD($hscol, $hsrow) Then
			buff()
			Send($HSButton)
			Sleep(900)
		 EndIf

		 If isoffcd($adrenalinecol, $adrenalinerow) Then
			Send($adrenalineButton)
			Sleep(300)
		 ElseIf isoffcd($furycol, $furyrow) Then
			   send($furybutton)
			   sleep(500)
		 EndIf

		 If $totem Then
			send($totemButton)
			sleep(100)
			Send($totemButton)
			sleep(100)
			send($totemButton)
			sleep(100)
			Send($totemButton)
			sleep(100)
		 EndIf
		 rev2()
		 $count += 1
      EndIf
   WEnd

Func thunder()
   moveright(100)
   combo(250)
   slide()
   fj()
   combo(250)
   slide()
   fj()
   If isOffCD($carnageCol, $carnageRow) Then
	  carnage(300)
   Else
	  combo()
   EndIf

   moveleft(100)
   combo(250)
   slide()
   fj()
   combo(250)
   slide()
   fj()


   If isOffCD($domainCol, $domainRow) Then
	  domain()
   Else
	  combo()
   EndIf
EndFunc

Func startscript()
   $click = True
EndFunc

Func domain()
   Send($domainButton)
   sleep(1300)
EndFunc

Func carnage($sleeptime = 0)
   Send($carnageButton)
   sleep(400)
   sleep($sleeptime)
EndFunc

Func swipe($sleeptime = 0)
   Send("{down down}")
   Send($attackButton)
   send("{down up}")
   ;sleep(Random(10, 40, 1))
   sleep(450 + $sleeptime)
EndFunc

Func fj()
   Send("{SPACE}")
   Sleep(100)
   Send($fjButton)
   Sleep(700)
EndFunc

Func slide()
   Send($fjButton)
   Sleep(100)
   Send($fjButton)
   sleep(150)
EndFunc

Func buff()
   Send($buffButton)
   Sleep(2000)
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

Func dropdown()
   Send("{DOWN down}")
   Send($jumpbutton)
   Sleep(500)
   Send("{DOWN up}")
EndFunc

Func combo($sleepTime = 0)
   Swipe()
   For $i = 4 To 1 Step -1
	  Send($BBButton)
	  Sleep(350)
   Next
   sleep($sleeptime)
EndFunc

Func isOffCD($col, $row)
   Local $cdSkillColor = 000000
   Local $skillIconWidth = 35
   Local $toprow = 1031
   Local $firstColumn = 1574

   local $cdColor = PixelGetColor($firstcolumn + ($col * $skilliconwidth), $toprow + ($row * $skilliconWidth))
   Return $cdColor <> $cdskillcolor
EndFunc

;
;legacy maps below
;
Func Rev2()
   moveleft(100)
   swipe(250)
   slide()
   fj()

   For $i = 4 To 1 Step -1
	  swipe(250)
	  slide()
   Next

   fj()
   dropdown()

   moveRight(100)
   slide()

   For $i = 2 To 1 Step -1
	  swipe(250)
	  slide()
   Next

   If isoffcd($domaincol, $domainrow) Then
	  domain()
   ElseIf isOffcd($carnagecol, $carnagerow) Then
	  Carnage(300)
   ElseIf isoffcd($showercol, $showerrow) Then
	  send($showerbutton)
	  sleep(500)
   EndIf

   For $i = 4 To 1 Step -1
	  swipe(250)
	  slide()
   Next
   fj()

   moveLeft(50)
   slide()
   For $i = 3 To 1 Step -1
	  Send("{up}")
	  Sleep(75)
   Next
   ;$click = False
EndFunc

Func bittyBobble()
	  moveRight(150)
	  combo()
	  dash()
	  dash()
	  moveLeft(100)
	  combo()
	  moveRight(100)
	  dash()
	  combo()
	  Send("{RIGHT down}")
	  For $i = 7 To 1 Step -1
	  Sleep(75)
	  Send("{up}")
	  Next
	  Send("{RIGHT up}")
	  Sleep(100)

	  moveLeft(200)
	  combo()
	  dash()
	  dash()
	  moveRight(100)
	  combo()
	  moveLeft(100)
	  dash()
	  combo()
	  Send("{LEFT down}")
	  For $i = 7 To 1 Step -1
		 Sleep(75)
		 Send("{up}")
	  Next
	  Send("{LEFT up}")
	  Sleep(100)
	  ;$click = False
EndFunc

Func fixBitty()
   moveLeft(100)
   dash()
   dash()
   moveRight(1000)
   Send("{RIGHT down}")
   For $i = 7 To 1 Step -1
	  Send("{up}")
	  Sleep(75)
   Next
   Sleep(100)
   Send("{RIGHT up}")
   moveLeft(200)
   $fix = False
   $click = True
EndFunc


