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
Dim $yukiRow = 1
Dim $yukiCol = 2
Dim $domainRow = 1
Dim $domainCol = 3
Dim $kishRow = 1
Dim $kishCol = 6
Dim $ninetailsRow = 1
Dim $ninetailsCol = 5
Dim $vanquisherRow = 1
Dim $vanquisherCol = 4
Dim $yakshaRow = 1
Dim $yakshaCol = 7
Dim $exorcistRow = 0
Dim $exorcistCol = 6
Dim $onilordRow = 0
Dim $onilordCol = 5
Dim $balanceRow = 0
Dim $balanceCol = 9
Dim $arachnidRow = 0
Dim $arachnidCol = 2
Dim $lucidRow = 1
Dim $lucidCol = 9

Dim $shikigamiButton = "a"
Dim $yakshaButton = "x"
Dim $kishbutton = "f"
Dim $exorcistButton = "q"
Dim $hakuButton = "{PGDN}"
Dim $YukiButton = "{PGUP}"
Dim $DomainButton = "{DEL}"
Dim $shikigamiCharmButton = "c"
Dim $teleportButton = "d"
Dim $jumpButton = "w"
Dim $ninetailsButton = "b"
Dim $vanquisherButton = "e"
Dim $maplewarriorButton = "'"
Dim $balanceButton = "z"
Dim $ccButton = ","
Dim $tenguButton = "v"
Dim $onilordButton = "6"
Dim $arachnidButton = "3"
Dim $lucidButton = "g"

; MINIMAP BOXES

#comments-start
Func topPlat()
   PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
EndFunc

Func rightPlat1()
   PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
EndFunc

Func rightPlat2()
   PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
EndFunc

Func midPlat()
   PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
EndFunc

Func groundPlat()
   PixelSearch(33, 149, 143, 156, 0xFFdd44, 10); groundPlat
EndFunc

Func defaultPostion()
   PixelSearch(106, 125, 117, 135, 0xFFdd44, 10); defaultPostion
EndFunc

Func defaultTop()
   PixelSearch(106, 114, 118, 123, 0xFFdd44, 10); defaultTop
EndFunc

Func defaultRight()
   PixelSearch(119, 114, 143, 156, 0xFFdd44, 10); defaultRight
EndFunc

Func defaultBottom()
   PixelSearch(106, 137, 117, 156, 0xFFdd44, 10); defaultBottom
EndFunc

Func defaultLeft()
   PixelSearch(74, 114, 104, 156, 0xFFdd44, 10); defaultLeft
EndFunc

Func groundLeft()
   PixelSearch(33, 143, 64, 156, 0xFFdd44, 10); groundLeft
EndFunc

Func groundRight()
   PixelSearch(106, 137, 143, 156, 0xFFdd44, 10); groundRight
EndFunc

Func midPlatBottom()
   PixelSearch(74, 148, 104, 156, 0xFFdd44, 10); midPlatBottom
EndFunc

Func rightAll()
   PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
EndFunc

Func topLeft()
   PixelSearch(61, 81, 85, 95, 0xFFdd44, 10); topLeft
EndFunc

Func topRight()
   PixelSearch(124, 81, 143, 95, 0xFFdd44, 10); topRight
EndFunc
#comments-end

Global $yakshaTimer
Global $collectTimer

;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)


Func test()
   MF2Collect()
EndFunc

While 1
   If $click = True Then
		 Send($hakuButton)
		 sleep(450)

		 send($maplewarriorButton)
		 sleep(100)

	  twoFour()
	  $count += 1
	  EndIf
   WEnd


Func twoFour()
   For $i = 3 To 1 Step -1
	  twoFourSetup()
	  twoFourCombo()
   Next
	  twoFourCollect()
EndFunc

#comments-start
   Func MF2()
   For $i = 3 To 1 Step -1
	  MF2Setup()
	  MF2Combo()
   Next
	  MF2Setup()
	  MF2Collect()
   EndFunc
#comments-end

Func twoFourSetup()
   
EndFunc

Func MF2Setup()
   $yellowPixel = PixelSearch(9, 74, 26, 129, 0xFFdd44, 10) ; (Null 3)
   If NOT @error Then
	  teleport("right")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(106, 86, 134, 92, 0xFFdd44, 10) ; (Platform 2.5)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(68, 105, 155, 115, 0xFFdd44, 10) ; (Platform 1)
   If NOT @error Then
	  teleport("left")
	  sleep(200)
	  Send("{left down}")
	  $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
	  WEnd
	  Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(68, 91, 94, 100, 0xFFdd44, 10) ; (Boss)
   If NOT @error Then
	  moveleft(25)
	  yaksha()
	  Global $yakshaTimer = TimerInit()
   EndIf

   $yellowPixel = PixelSearch(68, 91, 94, 100, 0xFFdd44, 10) ; (Boss)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
   EndIf

   If isOFFCD($kishcol, $kishrow) Then
   $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
	  arachnid()
	  $yellowPixel = PixelSearch(27, 116, 58, 126, 0xFFdd44, 10) ; (Kish)
	  While @error
		 teleport("left")
		 $yellowPixel = PixelSearch(27, 116, 58, 126, 0xFFdd44, 10) ; (Kish)
	  WEnd
	  kish()
	  sleep(300)
   EndIf
EndIf

   $yellowPixel = PixelSearch(27, 116, 58, 126, 0xFFdd44, 10) ; (Kish)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  While @error
		 teleport("right")
		 sleep(200)
		 attack()
		 $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(60, 118, 94, 127, 0xFFdd44, 10) ; (Null 1)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  While @error
		 teleport("right")
		 sleep(200)
		 attack()
		 $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(97, 118, 131, 127, 0xFFdd44, 10) ; (Bottom of Default)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
   If NOT @error Then
	  teleport("right")
	  sleep(200)
   EndIf
EndFunc

Func MF2Combo()
   While TimerDiff($yakshaTimer) < 27000
   $yellowPixel = PixelSearch(9, 74, 26, 129, 0xFFdd44, 10) ; (Null 3)
   If NOT @error Then
	  teleport("right")
	  sleep(200)
   EndIf
   $yellowPixel = PixelSearch(68, 105, 89, 115, 0xFFdd44, 10) ; (Teleport 1)
   If NOT @error Then
	  teleport("right")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(78, 87, 107, 115, 0xFFdd44, 10) ; (Left of Default)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(109, 105, 120, 115, 0xFFdd44, 10) ; (Default)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(109, 105, 120, 115, 0xFFdd44, 10) ; (Default)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(122, 105, 155, 115, 0xFFdd44, 10) ; (Right of Default)
   If NOT @error Then
	  Send("{left down}")
	  $yellowPixel = PixelSearch(109, 105, 120, 115, 0xFFdd44, 10) ; (Default)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(109, 105, 120, 115, 0xFFdd44, 10) ; (Default)
	  WEnd
	  Send("{left up}")
   EndIf

   If isoffcd($balancecol, $balancerow) Then
	  Send($balancebutton)
	  sleep(200)
   EndIf

   If isoffcd($yukicol, $yukirow) Then
	  yuki()
   EndIf
   If isoffcd($ninetailscol, $ninetailsrow) Then
	  ninetails()
   EndIf


   $yellowPixel = PixelSearch(68, 105, 155, 115, 0xFFdd44, 10) ; (Platform 1)
   If Not @error Then
	  sleep(1000)
	  exorcist()
	  attack()
   EndIf

   $yellowPixel = PixelSearch(109, 105, 120, 115, 0xFFdd44, 10) ; (Default)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(104, 86, 122, 92, 0xFFdd44, 10) ; (Attack)
   If NOT @error Then
	  moveright(10)
	  attack()
   EndIf

   $yellowPixel = PixelSearch(106, 86, 134, 92, 0xFFdd44, 10) ; (Platform 2.5)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
   EndIf


;IF KISH OFF CD
  If isOFFCD($kishcol, $kishrow) Then
   $yellowPixel = PixelSearch(106, 86, 134, 92, 0xFFdd44, 10) ; (Platform 2.5)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(68, 105, 155, 115, 0xFFdd44, 10) ; (Platform 1)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
	  Send("{left down}")
	  $yellowPixel = PixelSearch(15, 116, 37, 126, 0xFFdd44, 10) ; (Kish Mod)
	  While @error
		 teleport("left")
		 $yellowPixel = PixelSearch(15, 116, 37, 126, 0xFFdd44, 10) ; (Kish Mod)
	  WEnd
	  Send("{left up}")
	  kish()
	  sleep(300)
   EndIf
EndIf

   $yellowPixel = PixelSearch(27, 116, 58, 126, 0xFFdd44, 10) ; (Kish)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  While @error
		 teleport("right")
		 sleep(200)
		 attack()
		 $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(60, 118, 94, 127, 0xFFdd44, 10) ; (Null 1)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  While @error
		 teleport("right")
		 sleep(200)
		 attack()
		 $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(97, 118, 125, 127, 0xFFdd44, 10) ; (Bottom of Default)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf
WEnd
EndFunc


Func MF2Collect()
   $yellowPixel = PixelSearch(106, 86, 134, 92, 0xFFdd44, 10) ; (Platform 2.5)
   If NOT @error Then
	  teleport("down")
	  sleep(180)
   EndIf

   $yellowPixel = PixelSearch(68, 105, 155, 115, 0xFFdd44, 10) ; (Platform 1)
   If NOT @error Then
	  teleport("down")
	  sleep(200)
   EndIf

   If isoffcd($balancecol, $balancerow) Then
	  Send($balancebutton)
	  sleep(200)
	  EndIf

   domain()
   Send($onilordbutton)
   teleport("right")
   sleep(500)

   $yellowPixel = PixelSearch(68, 118, 155, 128, 0xFFdd44, 10) ; (Platform 2)
   If NOT @error Then
	  Send("{right down}")
	  $yellowPixel = PixelSearch(147, 118, 175, 128, 0xFFdd44, 10) ; (Collect 6)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(147, 118, 175, 128, 0xFFdd44, 10) ; (Collect 6)
	  WEnd
	  Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(68, 118, 155, 128, 0xFFdd44, 10) ; (Platform 2)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf


   $yellowPixel = PixelSearch(141, 97, 175, 128, 0xFFdd44, 10) ; (Collect 1)
   If NOT @error Then
	  attack()
	  teleport("up")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(154, 105, 178, 128, 0xFFdd44, 10) ; (Null 2)
   If NOT @error Then
	  teleport("left")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(68, 118, 155, 128, 0xFFdd44, 10) ; (Platform 2)
   If NOT @error Then
	  teleport("up")
	  sleep(200)
   EndIf

   $yellowPixel = PixelSearch(141, 97, 175, 128, 0xFFdd44, 10) ; (Collect 1)
   If NOT @error Then
	  attack()
	  teleport("up")
	  sleep(200)
   EndIf

#comments-start
   $yellowPixel = PixelSearch(68, 105, 155, 115, 0xFFdd44, 10) ; (Platform 1)
   If NOT @error Then
   Send("{right down}")
	  $yellowPixel = PixelSearch(141, 105, 175, 128, 0xFFdd44, 10) ; (Collect 1)
		 While @error
		 sleep(100)
	  $yellowPixel = PixelSearch(141, 105, 175, 128, 0xFFdd44, 10) ; (Collect 1)
   WEnd
   Send("{right up}")
EndIf
#comments-end


   $yellowPixel = PixelSearch(123, 85, 161, 92, 0xFFdd44, 10) ; (Collect 2 modified)
   If NOT @error Then
	  Send("{left down}")
	  attack()
	  $yellowPixel = PixelSearch(104, 86, 117, 92, 0xFFdd44, 10) ; (Attack modified)
	  While @error
		 sleep(100)
		 $yellowPixel = PixelSearch(104, 86, 117, 92, 0xFFdd44, 10) ; (Attack modified)
	  WEnd
   EndIf


   $yellowPixel = PixelSearch(101, 86, 123, 92, 0xFFdd44, 10) ; (Attack modified)
   If NOT @error Then
   Send($jumpbutton)
	  sleep(150)
	  teleport("left")
	  sleep(300)
   EndIf

   $yellowPixel = PixelSearch(73, 91, 97, 115, 0xFFdd44, 10) ; (Boss + Teleport 1 Mod)
   IF NOT @error Then
	  $yellowPixel = PixelSearch(24, 74, 107, 83, 0xFFdd44, 10) ; (Platform 3)
	  While @error
		 teleport("up")
		 sleep(200)
		 $yellowPixel = PixelSearch(24, 74, 107, 83, 0xFFdd44, 10) ; (Platform 3)
	  WEnd
   EndIf

   $yellowPixel = PixelSearch(24, 74, 107, 83, 0xFFdd44, 10) ; (Platform 3)
   If NOT @error Then
	  attack()
	  Send("{left down}")
	  $yellowPixel = PixelSearch(9, 74, 47, 128, 0xFFdd44, 10) ; (Platform 3 End)
	  While @error
		 teleport("left")
		 sleep(250)
		 attack()
		 $yellowPixel = PixelSearch(22, 74, 47, 83, 0xFFdd44, 10) ; (Platform 3 End)
	  WEnd
	  Send("{left up}")
	  sleep(500)
   EndIf

   $yellowPixel = PixelSearch(9, 74, 24, 129, 0xFFdd44, 10) ; (Null 3)
   If NOT @error Then
	  teleport("right")
   EndIf

   $yellowPixel = PixelSearch(22, 74, 107, 83, 0xFFdd44, 10) ; (Platform 3 End)
   IF NOT @error Then
	  teleport("down")
	  sleep(450)
	  attack()
	  EndIf

   $yellowPixel = PixelSearch(24, 91, 94, 100, 0xFFdd44, 10) ; (Platform 4)
   If NOT @error Then
	  sleep(100)
   Send("{right down}")
   $yellowPixel = PixelSearch(78, 91, 110, 115, 0xFFdd44, 10) ; (Boss)
	  While @error
		 teleport("right")
		 sleep(300)
		 attack()
		 $yellowPixel = PixelSearch(78, 91, 110, 115, 0xFFdd44, 10) ; (Boss)
		 WEnd
	  Send("{right up}")
   EndIf

      $yellowPixel = PixelSearch(9, 74, 22, 129, 0xFFdd44, 10) ; (Null 3)
   If NOT @error Then
	  teleport("right")
	  sleep(200)
   EndIf
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

Func arachnid()
   While isOffCD($arachnidcol, $arachnidrow)
	  Send($arachnidbutton)
	  sleep(300)
   WEnd
   sleep(100)
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