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
Dim $tenguRow = 0
Dim $tenguCol = 0

Dim $shikigamiButton = "a"
Dim $yakshaButton = "x"
Dim $kishbutton = "f"
Dim $exorcistButton = "q"
Dim $hakuButton = "{PGDN}"
Dim $HSButton = ";"
Dim $YukiButton = "3";
Dim $DomainButton = "{DEL}"
Dim $shikigamiCharmButton = "c"
Dim $teleportButton = "d"
Dim $jumpButton = "w"
Dim $ninetailsButton = "2"
Dim $vanquisherButton = "e"
Dim $sharpEyesButton = "'"
Dim $balanceButton = "z"
Dim $ccButton = ","
Dim $tenguButton = "v"
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
   dcup2combo("collect")
EndFunc


Func dcup2Setup()
   For $i = 3 To 1 Step -1
	  teleport("right")
	  sleep(200)
   Next
   	  $yellowPixel = PixelSearch(49, 105, 123, 113, 0xFFdd44, 10)
   While @error
	  teleport("down")
	  $yellowPixel = PixelSearch(49, 105, 123, 113, 0xFFdd44, 10)
   WEnd
   kish()
   teleport("up")

   $yellowPixel = PixelSearch(8, 83, 61, 114, 0xFFdd44, 10)
   while @error
	  teleport("left")
	  sleep(200)
	  $yellowPixel = PixelSearch(8, 83, 61, 114, 0xFFdd44, 10)
   wend
EndFunc

Func dcup2Combo($mode = "none")
   if $mode = "none" And isoffcd($kishcol, $kishrow) Then
	  dcup2setup()
   EndIf

   tengu()
   $yellowPixel = PixelSearch(8, 83, 61, 114, 0xFFdd44, 10)
   While Not @error
	  consolewrite("leftdrop" & @LF)
	  dropdown(1000)
	  $yellowPixel = PixelSearch(8, 83, 61, 114, 0xFFdd44, 10)
   WEnd
   ;attack()
   ; teleport down until we're on the bottom right platform
   $yellowPixel = PixelSearch(179, 106, 229, 113, 0xFFdd44, 10)
   While @error
	  consolewrite("rightdrop" & @LF)
	  dropdown()
	  teleport("down")
	  $yellowPixel = PixelSearch(179, 106, 229, 113, 0xFFdd44, 10)
   WEnd
   sleep(200)
   attack()
   If $mode = "yaksha" Then
	  teleport("left")
	  sleep(300)
	  teleport("left")
	  yaksha()
   EndIf
   If $mode = "collect" Then
	  dcup2collect()
   Else
	  $yellowPixel = PixelSearch(132, 107, 229, 110, 0xFFdd44, 10)
	  While Not @error
		 consolewrite("bottomdrop" & @LF)
		 dropdown(400)
		 $yellowPixel = PixelSearch(132, 107, 229, 110, 0xFFdd44, 10)
	  WEnd
   EndIf
EndFunc

Func dcup2collect()
   If isoffcd($yukicol, $yukirow) Then
	  yuki()
   EndIf
   For $i = 2 To 1 Step -1
	  teleport("left")
	  sleep(200)
   Next
   yaksha()
   teleport("left")
   sleep(200)
   Send("{left down}")
   $yellowPixel = PixelSearch(132, 107, 139, 113, 0xFFdd44, 10)
   While @error
	  sleep(100)
	  $yellowPixel = PixelSearch(132, 107, 139, 113, 0xFFdd44, 10)
   WEnd
   Send("{left up}")
   domain()
   For $i = 2 To 1 Step -1
	  teleport("left")
	  sleep(200)
   Next
   kish()
   For $i = 1 To 1 Step -1
	  teleport("left")
	  sleep(200)
   Next
   ;walk to the left side of the bottom left platform
   Send("{left down}")
   $yellowPixel = pixelSearch(50, 104, 64, 112, 0xFFdd44, 10)
   While @error
	  sleep(100)
	  $yellowPixel = pixelSearch(50, 104, 64, 112, 0xFFdd44, 10)
   WEnd
   send("{left up}")
   tengu()
   ;drop down until we're on the upper right platform
   $yellowPixel = PixelSearch(199, 76, 212, 87, 0xFFdd44, 10)
   While @error
	  dropdown(400)
	  $yellowPixel = PixelSearch(199, 76, 212, 87, 0xFFdd44, 10)
   WEnd

   For $i = 2 To 1 Step -1
	  attack()
	  teleport("left")
   Next
   Send("{left down}")
   $yellowPixel = PixelSearch(151, 77, 158, 85, 0xFFdd44, 10)
   While @error
	  sleep(100)
	  $yellowPixel = PixelSearch(151, 77, 158, 85, 0xFFdd44, 10)
   WEnd
   Send("{left up}")

   For $i = 3 To 1 Step -1
	  attack()
	  teleport("left")
   Next
   Send("{left down}")
   $yellowPixel = PixelSearch(79, 83, 86, 88, 0xFFdd44, 10)
   While @error
	  sleep(100)
	  $yellowPixel = PixelSearch(79, 83, 86, 88, 0xFFdd44, 10)
   WEnd
   Send("{left up}")

   For $i = 3 To 1 Step -1
	  teleport("left")
	  sleep(200)
   Next
EndFunc

Func ccChickens()
   $redPixel = PixelSearch(0, 0, 200, 120, 0xFF0000, 10)
   While Not @error
	  send($ccbutton)
	  sleep(200)
	  Send("{right}")
	  sleep(200)
	  send("{enter}")
	  sleep(4000)
	  $redPixel = PixelSearch(0, 0, 200, 120, 0xFF0000, 10)
   WEnd
EndFunc

Func setPause()
   $pause = NOT $pause
   While $pause
	  sleep(100)
   Wend
EndFunc

While 1
   If $click = True Then
	  If isOffCD($hscol, $hsRow) Then
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


	  dcup2()
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

Func dcup2()
   if $start And isoffcd($kishcol, $kishrow) Then
	  dcup2setup()
	  $start = False
   EndIf
   For $i = 1 To 1 Step -1
	  dcup2Combo("yaksha")
	  For $j = 5 To 1 Step -1
		 dcup2Combo()
	  Next
   Next
   dcup2combo("collect")
   dcup2combo()
EndFunc

Func chicken()
   yuki()
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
   For $i = 2 To 1 Step -1
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

Func vanquishers()
   while isOffCD($vanquisherCol, $vanquisherRow)
	  Send("{" & $vanquisherButton & " down}")
	  sleep(200)
   WEnd
   Send("{" & $vanquisherbutton & " up}")
EndFunc

Func attack()
   Send($shikigamiButton)
   Sleep(150)
   Send($shikigamiButton)
   Sleep(150)
   Send($shikigamiButton)
   Sleep(300)
EndFunc

Func teleport($direction)
Send("{" & $direction & " down}")
sleep(100)
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

Func domain()
   While isOFFCD($domaincol, $domainrow)
	  send($domainButton)
	  sleep(150)
   WEnd
   sleep(300)
EndFunc

Func yuki()
   While isOffCD($yukicol, $yukirow)
	  Send($yukiButton)
	  sleep (200)
   Wend
EndFunc

Func yaksha()
   While isOffCD($yakshaCol, $yaksharow)
	  Send($yakshabutton)
	  sleep(200)
   WEnd
   sleep(400)
EndFunc

Func tengu()
   While isOffCD($tenguCol, $tengurow)
	  Send($tengubutton)
	  sleep(150)
   WEnd
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