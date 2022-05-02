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

$yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
$yellowPixel = PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
$yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
$yellowPixel = PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
$yellowPixel = PixelSearch(33, 149, 143, 156, 0xFFdd44, 10); groundPlat
$yellowPixel = PixelSearch(110, 125, 117, 135, 0xFFdd44, 10); defaultPostion
$yellowPixel = PixelSearch(110, 114, 118, 123, 0xFFdd44, 10); defaultTop
$yellowPixel = PixelSearch(119, 114, 143, 156, 0xFFdd44, 10); defaultRight
$yellowPixel = PixelSearch(110, 137, 117, 156, 0xFFdd44, 10); defaultBottom
$yellowPixel = PixelSearch(74, 114, 104, 156, 0xFFdd44, 10); defaultLeft
$yellowPixel = PixelSearch(110, 114, 117, 156, 0xFFdd44, 10); defaultAll
$yellowPixel = PixelSearch(33, 143, 64, 156, 0xFFdd44, 10); groundLeft
$yellowPixel = PixelSearch(33, 123, 68, 141, 0xFFdd44, 10); groundLeftUp
$yellowPixel = PixelSearch(110, 137, 143, 156, 0xFFdd44, 10); groundRight
$yellowPixel = PixelSearch(74, 148, 104, 156, 0xFFdd44, 10); midPlatBottom
$yellowPixel = PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
$yellowPixel = PixelSearch(61, 81, 95, 95, 0xFFdd44, 10); topLeft
$yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
$yellowPixel = PixelSearch(33, 114, 124, 156, 0xFFdd44, 10); leftBound
$yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
$yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
$yellowPixel = PixelSearch(94, 138, 106, 157, 0xFFdd44, 10); midPlatBound
$yellowPixel = PixelSearch(130, 137, 143, 157, 0xFFdd44, 10); rightBound

#comments-end

Global $yakshaTimer
Global $collectTimer

;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)


Func test()
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

Func twoFourSetup()

   $yellowPixel = PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
   If NOT @error Then
      teleport("down")
      sleep(200)
   EndIf

   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
   If NOT @error Then
      teleport("down")
      sleep(200)
   EndIf

   $yellowPixel = PixelSearch(106, 137, 143, 156, 0xFFdd44, 10); groundRight
   If NOT @error Then
      teleport("left")
      sleep(200)
   EndIf

   $yellowPixel = PixelSearch(33, 114, 124, 156, 0xFFdd44, 10); leftBound
   If NOT @error Then
	   moveleft(25)
	   yaksha()
	   Global $yakshaTimer = TimerInit()
   EndIf

   teleport("right")
   sleep(200)

   $yellowPixel = PixelSearch(33, 114, 124, 156, 0xFFdd44, 10); leftBound
   If NOT @error Then
	  Send("{right down}")
	   $yellowPixel = PixelSearch(130, 137, 143, 157, 0xFFdd44, 10); rightBound
	   While @error
		   sleep(100)
		   $yellowPixel = PixelSearch(130, 137, 143, 157, 0xFFdd44, 10); rightBound
	   WEnd
	   Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(110, 137, 143, 156, 0xFFdd44, 10); groundRight
   If NOT @error Then
      teleport("up")
      sleep(200)  
   EndIf

   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
   If NOT @error Then
      teleport("up")
      sleep(200)
   EndIF

   If isOFFCD($kishcol, $kishrow) Then
   $yellowPixel = PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
      If NOT @error Then
         Send($jumpbutton)
	      sleep(150)
	      teleport("up")
	      sleep(300)
         kish()
         sleep(300)
         EndIf

      $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
         If NOT @error Then
            teleport("left")
            sleep(200)
         EndIf

      $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
         If Not @error Then
            Send("{left down}")
            $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
            While @error
               sleep(100)
               $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
               WEnd
               Send("{left up}")
         EndIf

      $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
         If Not @error Then
            lucid()
            sleep(600)
            EndIf
      EndIf

   $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
      If NOT @error Then
         Send("{right down}")
         $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
         While @error
            teleport("right")
		      sleep(200)
		      attack()
		      $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
	      WEnd
	      Send("{right up}")
      EndIf

   $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
      If NOT @error Then
         Send("{left down}")
         $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
         While @error
            sleep(100)
            $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
            WEnd
            Send("{left up}")
            EndIf
   
   $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
   If NOT @error Then
      $yellowPixel = PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
      While @error
         dropdown()
         sleep(200)
         teleport("down")
         sleep(200)
         $yellowPixel = PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
      WEnd
   EndIf
EndFunc

Func twoFourCombo()
   While TimerDiff($yakshaTimer) < 27000


   $yellowPixel = PixelSearch(74, 114, 104, 156, 0xFFdd44, 10); defaultLeft
   If NOT @error Then
	   Send("{right down}")
	   $yellowPixel = PixelSearch(110, 114, 117, 156, 0xFFdd44, 10); defaultAll
	   While @error
		   sleep(100)
		   $yellowPixel = PixelSearch(110, 114, 117, 156, 0xFFdd44, 10); defaultAll
	   WEnd
	   Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(119, 114, 143, 156, 0xFFdd44, 10); defaultRight
   If NOT @error Then
	   Send("{left down}")
	   $yellowPixel = PixelSearch(110, 114, 117, 156, 0xFFdd44, 10); defaultAll
	   While @error
		   sleep(100)
		   $yellowPixel = PixelSearch(110, 114, 117, 156, 0xFFdd44, 10); defaultAll
	   WEnd
	   Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(74, 148, 104, 156, 0xFFdd44, 10); midPlatBottom
   If NOT @error Then
      teleport("up")
      sleep(200)
      EndIf

   $yellowPixel = PixelSearch(110, 114, 118, 123, 0xFFdd44, 10); defaultTop
   If NOT @error Then
      teleport("down")
      sleep(200)
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

   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
      If NOT @error Then
	      sleep(500)
	      exorcist()
	      attack()
      EndIf

   ;IF KISH OFF CD
   If isOFFCD($kishcol, $kishrow) Then

   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
   If NOT @error Then
      teleport("up")
      sleep(200)
   EndIf

   $yellowPixel = PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
      If NOT @error Then
         Send($jumpbutton)
	      sleep(150)
	      teleport("up")
	      sleep(300)
         kish()
         sleep(300)
         EndIf

     $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
         If NOT @error Then
            teleport("left")
            sleep(200)
         EndIf

      $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
         If Not @error Then
            Send("{left down}")
            $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
            While @error
               sleep(100)
               $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
               WEnd
               Send("{left up}")
         EndIf

      $yellowPixel = PixelSearch(61, 81, 77, 95, 0xFFdd44, 10); topLeftBound
         If Not @error Then
            lucid()
            sleep(600)
            EndIf
      EndIf

   $yellowPixel = PixelSearch(61, 81, 143, 95, 0xFFdd44, 10); topPlat
      If NOT @error Then
         Send("{right down}")
         $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
         While @error
            teleport("right")
		      sleep(200)
		      attack()
		      $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
	      WEnd
	      Send("{right up}")
      EndIf

   $yellowPixel = PixelSearch(111, 81, 143, 95, 0xFFdd44, 10); topRight
      If NOT @error Then
         Send("{left down}")
         $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
         While @error
            sleep(100)
            $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
            WEnd
            Send("{left up}")
            EndIf
   
   $yellowPixel = PixelSearch(103, 81, 137, 95, 0xFFdd44, 10); leftOfRope
   If NOT @error Then
      $yellowPixel = PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
      While @error
         dropdown()
         sleep(200)
         teleport("down")
         sleep(200)
         $yellowPixel = PixelSearch(99, 114, 143, 135, 0xFFdd44, 10); rightAll
      WEnd
   EndIf

   WEnd
   EndFunc

Func twoFourCollect()
   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
   If NOT @error Then
      teleport("up")
      sleep(200)
      attack()
      sleep(500)
   EndIf

   $yellowPixel = PixelSearch(99, 114, 143, 123, 0xFFdd44, 10); rightPlat1
   If NOT @error Then
      teleport("right")
      sleep(200)
      teleport("down")
      sleep(200)
   EndIf

   $yellowPixel = PixelSearch(106, 125, 143, 135, 0xFFdd44, 10); rightPlat2
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

   $yellowPixel = PixelSearch(33, 149, 143, 156, 0xFFdd44, 10); groundPlat
   If NOT @error Then
	   Send("{left down}")
      $yellowPixel = PixelSearch(33, 143, 64, 156, 0xFFdd44, 10); groundLeft
      While @error
         teleport("left")
         sleep(250)
         attack()
         $yellowPixel = PixelSearch(33, 143, 64, 156, 0xFFdd44, 10); groundLeft
         WEnd
         Send("{left up}")
         sleep(500)
         EndIf

   $yellowPixel = PixelSearch(33, 143, 64, 156, 0xFFdd44, 10); groundLeft
   If Not @error Then
      teleport("up")
      sleep(200)
      EndIf
   
   $yellowPixel = PixelSearch(33, 123, 68, 141, 0xFFdd44, 10); groundLeftUp
   If Not @error Then
      Send("{right down}")
      $yellowPixel = PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
      While @error
         teleport("right")
         sleep(200)
         attack()
         $yellowPixel = PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
         WEnd
         Send("{right up}")
         sleep(500)
         EndIf

   $yellowPixel = PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
   If Not @error Then
      Send("{right down}")
      $yellowPixel = PixelSearch(94, 138, 106, 157, 0xFFdd44, 10); midPlatBound
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(94, 138, 106, 157, 0xFFdd44, 10); midPlatBound
         WEnd
         Send("{right up}")
      EndIf

   $yellowPixel = PixelSearch(73, 138, 108, 147, 0xFFdd44, 10); midPlat
   If Not @error Then
      teleport("down")
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

Func lucid()
   Send($lucidButton)
   sleep(200)
EndFunc

Func yaksha()
   While isOffCD($yakshaCol, $yaksharow)
	  Send($yakshabutton)
	  sleep(200)
   WEnd
   sleep(400)
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