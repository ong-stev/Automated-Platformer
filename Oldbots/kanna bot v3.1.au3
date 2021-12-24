#include<IE.au3>
#include <Misc.au3>
#RequireAdmin

HotKeySet("{F10}" , "close")
HotKeySet("{F11}", "startScript")
HotKeySet("{F9}", "setPause")
Dim $click = False
Dim $count = 0
Dim $looptime = 30
Dim $pause = False
Dim $leftdown = False
Dim $rightdown = True

Dim $cdSkillColor = 000000
Dim $skillIconWidth = 35
Dim $toprow = 1031
Dim $firstColumn = 1574

Dim $yukiRow = 0
Dim $yukiCol = 3
Dim $domainRow = 1
Dim $domainCol = 1
Dim $kishRow = 1
Dim $kishCol = 2
Dim $hsrow = 1
Dim $hscol = 8
Dim $ninetailsRow = 0
Dim $ninetailsCol = 2
Dim $sharpEyesRow = 1
Dim $sharpEyesCol = 6
Dim $vanquisherRow = 1
Dim $vanquisherCol = 0
Dim $yakshaRow = 0
Dim $yakshaCol = 8
Dim $kishRow = 1
Dim $kishcol = 2


Dim $shikigamiButton = "a"
Dim $yakshaButton = "x"
Dim $kishbutton = "f"
Dim $exorcistButton = "q"
Dim $hakuButton = "{PGDN}"
Dim $HSButton = ";"
Dim $YukiButton = "3"
Dim $DomainButton = "{DEL}"
Dim $shikigamiCharmButton = "c"
Dim $teleportButton = "d"
Dim $jumpButton = "w"
Dim $ninetailsButton = "2"
Dim $vanquisherButton = "e"
Dim $sharpEyesButton = "'"
Dim $balanceButton = "z"
;$dll = DllOpen("user32.dll")

Func setPause()
   $pause = NOT $pause
   While $pause
	  sleep(100)
   Wend
EndFunc
While 1
	  If $click = True Then
		 If isOffCD($hscol, $hsRow) Then
			;ConsoleWrite("hs color: " & $hscd)
			ConsoleWrite("hs triggered" & @LF)
			Send($hakuButton)
			sleep(600)
			Send($HSButton)
			Sleep(200)
			Send($HSButton)
			Sleep(1000)
		 EndIf

		 If isOffCD($sharpEyesCol, $sharpEyesRow) Then
			consolewrite("sharp eyes triggered" & @LF)
			send($sharpeyesButton)
			sleep(200)
			send($sharpeyesButton)
			sleep(700)
		 EndIf

		 While isOffCD($yukicol, $yukirow)
			consolewrite("yuki triggered" & @LF)
			Send($yukiButton)
			sleep(200)
		 Wend
		 chicken()
		 $count += 1
      EndIf
   WEnd

Func close()
   send("{left up}")
   send("{right up}")
   send("{up up}")
   send("{down up}")
   Exit
EndFunc

Func chicken()
   send("{left down}")
   $leftdown = True
   sleep(100)
   For $i = 4 To 1 Step -1
	  If $i = 3 And isOffCD($kishcol, $kishrow) Then
		 ConsoleWrite("kish triggered" & @LF)
		 kish()
	  EndIf
	  attack()
	  send($teleportButton)
	  sleep(400)
   Next
   send("{left up}")
   moveright(100)
   yaksha()

   If isOffCD($domaincol, $domainrow) And isOffCD($vanquishercol, $vanquisherRow) Then
	  ConsoleWrite("domain triggered" & @LF)
	  While isOFFCD($domaincol, $domainrow)
		 send($domainButton)
		 sleep(150)
	  WEnd

	  upjump()
	  send($balanceButton)
	  sleep(200)
	  vanquishers()
   Else
	  send("{left down}")
	  sleep(100)
	  For $i = 2 To 1 Step -1
		 attack()
		 send($teleportButton)
		 sleep(400)
	  Next
	  send("{left up}")

	  upjump()
	  teleport("right")

	  If isOffCD($ninetailscol, $ninetailsrow) Then
		 consolewrite("ninetails triggered" & @LF)
		 send($ninetailsbutton)
		 sleep(200)
	  EndIf
	  For $i = 3 To 1 Step -1
		 send($exorcistButton)
		 sleep(150)
		 send($exorcistButton)
		 sleep(300)
		 teleport("up")
		 teleport("up")
		 moveright(150)
		 attack()
		 teleport("down")
		 attack()
	  Next
   EndIf

   teleport("right")
   attack()
   teleport("up")
   teleport("down")
   teleport("right")
   attack()
   teleport("right")
   attack()
   teleport("down")
   teleport("right")
   ;attack()
   teleport("right")
EndFunc


Func bitty()
   Send($shikigamicharmbutton)
   sleep(800)
   teleport("right")
   kish()
   If  Mod($count, Ceiling(100/$looptime)) = 0 Then
	  sleep(300)
   EndIf
   teleport("down")

   For $i = 2 To 1 Step -1
	  attack()
	  teleport("right")
   Next

   send($jumpButton)
   sleep(400)
   yaksha()
   send($ninetailsbutton)
   sleep(200)
   attack()

   Send("{DOWN down}")
   Sleep(150)
   Send($jumpbutton)
   Sleep(150)
   Send("{DOWN up}")

   Send("{RIGHT down}")
   sleep(150)
   send($teleportButton)
   sleep(400)
   attack()
   Send("{RIGHT up}")

   If  Mod($count, Ceiling(220/$looptime)) = 0 Then
	  send($domainButton)
	  sleep(150)
	  send($domainButton)
	  sleep(150)
   EndIf

   Send("{RIGHT down}")
   sleep(150)
   send($teleportButton)
   sleep(400)
   attack()
   Send("{RIGHT up}")

   Send($shikigamicharmbutton)
   sleep(800)
   teleport("left")
   attack()
   teleport("down")

   send("{left down}")
   sleep(100)
   For $i = 5 To 1 Step -1
	  attack()
	  send($teleportButton)
	  sleep(400)
   Next
   send("{left up}")
   sleep(150)

EndFunc

Func soul()
   moveright(100)
   yaksha()
   teleport("up")
   kish()
   teleport("down")

   send("{left down}")
   For $i = 3 To 1 Step -1
	  send($teleportButton)
	  sleep(400)
	  attack()
   Next
   send("{left up}")

   teleport("down")

   If  Mod($count, Ceiling(220/$looptime)) = 0 Then
	  send($domainButton)
	  sleep(300)
   EndIf

   send("{right down}")
   For $i = 5 To 1 Step -1
	  send($teleportButton)
	  sleep(400)
	  attack()
   Next
   send("{right up}")
   teleport("up")

   moveleft(100)
   send("{left down}")
   For $i = 3 To 1 Step -1
	  send($teleportButton)
	  sleep(400)
	  attack()
   Next
   send("{left up}")
EndFunc

Func startScript()
   $click = True
EndFunc

Func dropdown()
   Send("{down down}")
   sleep(150)
   send($jumpbutton)
   sleep(200)
   send("{down up}")
   Sleep(150)
EndFunc

Func isOffCD($col, $row)
   local $cdColor = PixelGetColor($firstcolumn + ($col * $skilliconwidth), $toprow + ($row * $skilliconWidth))
   Return $cdColor <> $cdskillcolor
EndFunc

Func vanquishers()
   while isOffCD($vanquisherCol, $vanquisherRow)
	  Send("{" & $vanquisherButton & " down}")
	  sleep(200)
   WEnd
   Send("{" & $vanquisherbutton & " up}")
EndFunc

Func attack()
   Send($shikigamiButton)
   Sleep(200)
   Send($shikigamiButton)
   Sleep(200)
   Send($shikigamiButton)
   Sleep(400)
EndFunc

Func teleport($direction)
Send("{" & $direction & " down}")
sleep(150)
Send($teleportButton)
Sleep(150)
Send($teleportButton)
Sleep(150)
Send("{" & $direction & " up}")
Sleep(100)
EndFunc

Func upJump()
   send($shikigamicharmbutton)
   sleep(200)
   send($shikigamicharmbutton)
   sleep(600)
EndFunc

Func kish()
   While isOffCD($kishcol, $kishrow)
	  Send($kishbutton)
	  sleep(200)
   WEnd
   sleep(400)
EndFunc

Func yaksha()
   While isOffCD($yakshaCol, $yaksharow)
	  Send($yakshabutton)
	  sleep(200)
   WEnd
   sleep(400)
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