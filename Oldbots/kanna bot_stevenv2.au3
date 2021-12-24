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
Dim $exorcistRow = 1
Dim $exorcistCol = 5
Dim $onilordRow = 0
Dim $onilordCol = 8

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
Dim $onilordButton = "6"

Global $yakshaTimer
;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)
Func test()
   MTS4Collect())
EndFunc

While 1
   If $click = True Then
		 Send($hakuButton)
		 sleep(600)

	  If isOffCD($sharpEyesCol, $sharpEyesRow) Then
		 consolewrite("sharp eyes triggered" & @LF)
		 send($sharpeyesButton)
		 sleep(200)
		 send($sharpeyesButton)
		 sleep(700)
	  EndIf

	  MTS4()
	  $count += 1
   EndIf
   WEnd

Func MTS4()
   For $i = 3 To 1 Step -1
   MTS4setup() ; rerun setup (drops yaksha drops kishin)
   MTS4Combo()
Next
   MTS4Collect()
EndFunc

; goals
   ;take out attacks to make better efficiency
   ;fix end of collect

Func MTS4setup()
   $yellowPixel = PixelSearch(117, 107, 154, 114, 0xFFdd44, 10) ; (Setup#1)
	  IF NOT @error Then
		 teleport("left")
		 sleep(200)
	  EndIf

   $yellowPixel = PixelSearch(85, 117, 102, 128, 0xFFdd44, 10) ; (Extra#5)
	  IF NOT @error Then
		 teleport("up")
		 sleep(200)
	  EndIf

   $yellowPixel = PixelSearch(96, 96, 122, 104, 0xFFdd44, 10) ; (Setup#2)
	  IF NOT @error Then
		 teleport("left")
		 sleep(200)
	  EndIf

   Send("{left down}")
   $yellowPixel = PixelSearch(63, 104, 80, 113, 0xFFdd44, 10) ; (Setup#3)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(63, 104, 80, 113, 0xFFdd44, 10) ; (Setup#3)
	  WEnd
	  Send("{left up}")
	  yaksha()
	  Global $yakshaTimer = TimerInit()

   $yellowPixel = PixelSearch(51, 118, 94, 128, 0xFFdd44, 0) ; (Rectangle 1)
	  While @error
		 teleport("down")
		 $yellowPixel = PixelSearch(51, 118, 94, 128, 0xFFdd44, 0) ; (Rectangle 1)
	  WEnd
	  kish()

#comments-start
   For $i = 2 To 1 Step -1
	  teleport ("left")
	  sleep(200)
   Next
	  yaksha()
	  Global $yakshaTimer = TimerInit()
	  $yellowPixel = PixelSearch(51, 118, 94, 128, 0xFFdd44, 0) ; (Rectangle 1)
   While @error
	  teleport("down")
	  $yellowPixel = PixelSearch(51, 118, 94, 128, 0xFFdd44, 0) ; (Rectangle 1)
   WEnd
   kish()
#comments-end

   $yellowPixel = PixelSearch(121, 118, 146, 128, 0xFFdd44, 10) ; (Rectangle 2)
   while @error
	  teleport("right")
	  sleep(200)
	  attack()
	  $yellowPixel = PixelSearch(121, 118, 146, 128, 0xFFdd44, 10) ; (Rectangle 2)
   WEnd

   $yellowPixel = PixelSearch(111, 96, 150, 115, 0xFFdd44, 10) ; (Rectangle 3)
   While @error
	  teleport("up")
	     $yellowPixel = PixelSearch(111, 96, 150, 115, 0xFFdd44, 10) ; (Rectangle 3)
	  WEnd

   Send("{left down}")
   $yellowPixel = PixelSearch(116, 96, 120, 115, 0xFFdd44, 10) ; (Rectangle 4)
   While @error
	  sleep(100)
	  $yellowPixel = PixelSearch(116, 96, 120, 115, 0xFFdd44, 10) ; (Rectangle 4)
	  WEnd
   Send("{left up}")
EndFunc


Func MTS4Combo()
   While TimerDiff($yakshaTimer) < 27000
	  $yellowPixel = PixelSearch(99, 119, 122, 128, 0xFFdd44, 10); {Rectangle 1) if you fall down left of rope
	  IF NOT @error Then
		 teleport("right")
		 sleep(200)
		 EndIf
	  $yellowPixel = PixelSearch(126, 118, 154, 128, 0xFFdd44, 10); (Rectangle 2) teleport right of rope
	  IF NOT @error Then
		 teleport("up")
		 EndIf
	  $yellowPixel = PixelSearch(126, 99, 150, 113, 0xFFdd44, 10); (Rectangle 3) right side of the correct position
	  IF NOT @error Then
		 Send("{left down}")
	  $yellowPixel = PixelSearch(116, 108, 122, 115, 0xFFdd44, 10); (Rectangle 4)correct position
	  while @error
		 sleep(100)
		 $yellowPixel = PixelSearch(116, 108, 122, 115, 0xFFdd44, 10); (Rectangle 4) correct position
	  WEnd
	  Send("{left up}")
	  EndIf
	  exorcist()
	  sleep(300)
	  attack()
	  If isoffcd($yukicol, $yukirow) Then
		 yuki()
	  EndIf
	  If isoffcd($ninetailscol, $ninetailsrow) Then
		 ninetails()
	  EndIf
   WEnd
EndFunc

Func MTS4Collect()
   $yellowPixel = PixelSearch(113, 120, 130, 128, 0xFFdd44, 10); (Rectangle 1)
   While @error
	  teleport("down")
	  $yellowPixel = PixelSearch(113, 120, 130, 128, 0xFFdd44, 10); (Rectangle 1)
   WEnd

   $yellowPixel = PixelSearch(141, 117, 172, 128, 0xFFdd44, 10); (Extra#7)
   While @error
	  teleport("right")
	  sleep(200)
	  attack()
	  $yellowPixel = PixelSearch(141, 117, 172, 128, 0xFFdd44, 10); (Extra#7)
   WEnd

   $yellowPixel = PixelSearch(60, 116, 87, 128, 0xFFdd44, 10); (Rectangle 2)
   While @error
	  teleport("left")
	  sleep(200)
	  $yellowPixel = PixelSearch(60, 116, 87, 128, 0xFFdd44, 10); (Rectangle 2)
   WEnd
   kish()
   domain()
   Send($onilordbutton)
   teleport("left")

   Send("{left down}")
   attack()
   $yellowPixel = PixelSearch(37, 117, 40, 128, 0xFFdd44, 10) ; (Rectangle 3)
   While @error
	  sleep(100)
	  $yellowPixel = PixelSearch(37, 117, 40, 128, 0xFFdd44, 10) ; (Rectangle 3)
	  WEnd
   Send("{left up}")

   $yellowPixel = PixelSearch(32, 107, 44, 113, 0xFFdd44, 10) ; (Rectangle 4)
   While @error
	  teleport("up")
	  $yellowPixel = PixelSearch(32, 107, 44, 113, 0xFFdd44, 10) ; (Rectangle 4)
   WEnd
   exorcist()
   sleep(200)

   $yellowPixel = PixelSearch(44, 117, 58, 128, 0xFFdd44, 10) ; (Rectangle 5)
	  IF NOT @error Then

	  Send("{left down}")
		 $yellowPixel = PixelSearch(37, 117, 40, 128, 0xFFdd44, 10) ; (Rectangle 3)
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(37, 117, 40, 128, 0xFFdd44, 10) ; (Rectangle 3)
		 WEnd
		 Send("{left up}")
	  EndIf

   $yellowPixel = PixelSearch(32, 85, 49, 94, 0xFFdd44, 10) ; (Rectangle 6)
   While @error
	  teleport("up")
	  $yellowPixel = PixelSearch(32, 85, 49, 94, 0xFFdd44, 10) ; (Rectangle 6)
   WEnd
   sleep(100)

   Send("{right down}")
	  $yellowPixel = PixelSearch(47, 85, 52, 94, 0xFFdd44, 10) ; (Rectangle 7)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(47, 85, 52, 94, 0xFFdd44, 10) ; (Rectangle 7)
		 WEnd
	  Send("{right up}")
	  sleep(100)

   $yellowPixel = PixelSearch(47, 85, 52, 94, 0xFFdd44, 10) ; (Rectangle 7); start at the top left platform then teleport down (big plat. or small plat.)
   IF NOT @error Then
	  teleport("down")
	  sleep(100)
   EndIf
   $yellowPixel = PixelSearch(45, 97, 64, 105, 0xFFdd44, 10) ; (Extra#1)
   IF NOT @error Then
	  teleport("right")
	  sleep(100)
   EndIf
   $yellowPixel = PixelSearch(51, 112, 59, 119, 0xFFdd44, 10) ; (Extra#3)
   IF NOT @error Then
	  teleport("right")
	  sleep(100)
   EndIf

#comments-start
   $yellowPixel = PixelSearch(45, 97, 64, 105, 0xFFdd44, 10) ; (Extra#1)
	  While @error
		 teleport("down")
		 $yellowPixel = PixelSearch(45, 97, 64, 105, 0xFFdd44, 10) ; (Extra#1)
	  WEnd
	  sleep(300)
#comments-end

   $yellowPixel = PixelSearch(77, 106, 83, 113, 0xFFdd44, 10) ; (Rectangle 8)
	  While @error
		 Send("{right down}")
			$yellowPixel = PixelSearch(77, 106, 83, 113, 0xFFdd44, 10) ; (Rectangle 8)
			   While @error
				  sleep(100)
				  $yellowPixel = PixelSearch(77, 106, 83, 113, 0xFFdd44, 10) ; (Rectangle 8)
			   WEnd
			   Send("{right up}")
			WEnd
	  moveleft(100)
	  yaksha()

#comments-start
   $yellowPixel = PixelSearch(45, 97, 64, 105, 0xFFdd44, 10) ; (Extra#1)
	  While @error
		 teleport("left")
		 $yellowPixel = PixelSearch(45, 97, 64, 105, 0xFFdd44, 10) ; (Extra#1)
	  WEnd
	  exorcist()
	  sleep(500)
#comments-end

   $yellowPixel = PixelSearch(72, 106, 85, 113, 0xFFdd44, 10) ; (Extra#4)
	  IF NOT @error Then
		 teleport("left")
		 attack()
		 sleep(200)
	  EndIf
   $yellowPixel = PixelSearch(51, 112, 59, 119, 0xFFdd44, 10) ; (Extra#3)
	  IF NOT @error Then
		 teleport("up")
		 sleep(200)
	  EndIf
   $yellowPixel = PixelSearch(85, 117, 102, 128, 0xFFdd44, 10) ; (Extra#5)
	  IF NOT @error Then
		 Send("{left down}")
	  $yellowPixel = PixelSearch(37, 117, 56, 128, 0xFFdd44, 10); (Extra#2)
	  while @error
		 sleep(100)
		 $yellowPixel = PixelSearch(37, 117, 56, 128, 0xFFdd44, 10); (Extra#2)
		 WEnd
		 Send("{left up}")
	  EndIf

   $yellowPixel = PixelSearch(44, 84, 75, 94, 0xFFdd44, 10) ; (Rectangle 9)
	  While @error
		 teleport("up")
		 sleep(300)
		 $yellowPixel = PixelSearch(44, 84, 75, 94, 0xFFdd44, 10) ; (Rectangle 9)
	  WEnd

   Send("{right down}")
	  sleep(100)
	  attack()
	  $yellowPixel = PixelSearch(76, 96, 86, 104, 0xFFdd44, 10) ; (Rectangle 10)
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(76, 96, 86, 104, 0xFFdd44, 10) ; (Rectangle 10)
		 WEnd
		 Send("{right up}")

   $yellowPixel = PixelSearch(102, 95, 123, 104, 0xFFdd44, 10) ; (Rectangle 11)
	  While @error
		 teleport("right")
		 $yellowPixel = PixelSearch(102, 95, 123, 104, 0xFFdd44, 10) ; (Rectangle 11)
	  WEnd
	  exorcist()
	  sleep(300)

   $yellowPixel = PixelSearch(136, 104, 150, 113, 0xFFdd44, 10) ; (Rectangle 12)
	  While @error
		 Send("{right down}")
		 $yellowPixel = PixelSearch(136, 104, 150, 113, 0xFFdd44, 10) ; (Rectangle 12)
			While @error
			   sleep(100)
			   $yellowPixel = PixelSearch(136, 104, 150, 113, 0xFFdd44, 10) ; (Rectangle 12)
			WEnd
			Send("{right up}")
			sleep(200)
	  WEnd

   $yellowPixel = PixelSearch(152, 117, 172, 128, 0xFFdd44, 10) ; (Extra#6)
	  IF NOT @error Then
		 teleport("left")
		 sleep(200)
	  Send("{left down}")
		 $yellowPixel = PixelSearch(113, 116, 130, 128, 0xFFdd44, 10); (Rectangle 1)
		 While @error
			sleep(100)
			$yellowPixel = PixelSearch(113, 116, 130, 128, 0xFFdd44, 10); (Rectangle 1)
		 WEnd
		 Send("{left up}")
	  EndIf


   $yellowPixel = PixelSearch(127, 79, 150, 88, 0xFFdd44, 10) ; (Rectangle 13)
	  While @error
		 teleport("up")
		 sleep(200)
		 $yellowPixel = PixelSearch(127, 79, 150, 88, 0xFFdd44, 10) ; (Rectangle 13)
	  WEnd

   Send ("{left down}")
	  attack()
	  $yellowPixel = PixelSearch(115, 80, 121, 88, 0xFFdd44, 10) ; (Rectangle 14)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(115, 80, 121, 88, 0xFFdd44, 10) ; (Rectangle 14)
	  WEnd
	  Send("{left up}")
	  sleep(300)

   $yellowPixel = PixelSearch(111, 122, 134, 128, 0xFFdd44, 10) ; (Extra #9)
	  While @error
		 teleport("down")
		 sleep(200)
		 $yellowPixel = PixelSearch(111, 122, 134, 128, 0xFFdd44, 10) ; (Extra #9)
	  WEnd

   $yellowPixel = PixelSearch(122, 115, 124, 117, 0xFFdd44, 10) ; (Extra #8)
	  IF NOT @error Then
		 teleport("down")
		 sleep(200)
		 $yellowPixel = PixelSearch(122, 115, 124, 117, 0xFFdd44, 10) ; (Extra #8)
	  EndIf

   $yellowPixel = PixelSearch(99, 119, 122, 128, 0xFFdd44, 10); {Rectangle 1) if you fall down left of rope
	  IF NOT @error Then
		 teleport("right")
		 sleep(200)
		 EndIf
   $yellowPixel = PixelSearch(126, 118, 154, 128, 0xFFdd44, 10); (Rectangle 2) teleport right of rope
	  IF NOT @error Then
		 teleport("up")
		 EndIf
   $yellowPixel = PixelSearch(126, 99, 150, 113, 0xFFdd44, 10); (Rectangle 3) right side of the correct position
	  IF NOT @error Then
		 Send("{left down}")
   $yellowPixel = PixelSearch(116, 108, 122, 115, 0xFFdd44, 10); (Rectangle 4)correct position
	  while @error
		 sleep(100)
		 $yellowPixel = PixelSearch(116, 108, 122, 115, 0xFFdd44, 10); (Rectangle 4) correct position
	  WEnd
	  Send("{left up}")
   EndIf

#comments-start
   $yellowPixel = PixelSearch(114, 95, 122, 114, 0xFFdd44, 10) ; (Rectangle 15)
	  While @error
		 teleport("down")
		 $yellowPixel = PixelSearch(114, 95, 122, 114, 0xFFdd44, 10) ; (Rectangle 15)
	  WEnd
	  exorcist()
	  sleep(500)
#comments-end

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

Func ninetails()
   While isOffCD($ninetailscol, $ninetailsrow)
	  Send($ninetailsButton)
	  Sleep (200)
   WEnd
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

Func exorcist()
   While isOffCD($exorcistCol, $exorcistRow)
	  Send($exorcistbutton)
	  sleep(800)
   WEnd
EndFunc

Func onilord()
   While isOffCD($onilordCol, $onilordRow)
	  Send($onilordbutton)
	  sleep(200)
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