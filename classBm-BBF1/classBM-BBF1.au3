
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

Dim $sweepingBlowRow = 1
Dim $sweepingBlowCol = 1
Dim $darkGenesisRow = 1
Dim $darkGenesisCol = 2
Dim $auraScytheRow = 1
Dim $auraScytheCol = 4
Dim $grimHarvestRow = 1
Dim $grimHarvestCol = 5

Dim $finishingBlowButton = "a"
Dim $altarButton = "x"
Dim $sweepingBlowButton = "q"
Dim $darkGenesisButton = "z"
Dim $auraScytheButton = "r"
Dim $grimHarvestButton = "c"
Dim $battleBurstButton = "v"
Dim $teleportButton = "d"
Dim $jumpButton = "w"

; MINIMAP BOXES

#comments-start

$yellowPixel = PixelSearch(72, 87, 110, 96, 0xFFdd44, 10); middlePlat
$yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
$yellowPixel = PixelSearch(107, 93, 156, 102, 0xFFdd44, 10); botRightPlat
$yellowPixel = PixelSearch(102, 68, 152, 77, 0xFFdd44, 10); topRightPlat
$yellowPixel = PixelSearch(27, 68, 77, 77, 0xFFdd44, 10); topLeftPlat

$yellowPixel = PixelSearch(107, 68, 127, 101, 0xFFdd44, 10); teleUpRight
$yellowPixel = PixelSearch(57, 68, 72, 101, 0xFFdd44, 10); teleUpLeft
$yellowPixel = PixelSearch(135, 68, 156, 101, 0xFFdd44, 10); endRight
$yellowPixel = PixelSearch(22, 68, 38, 101, 0xFFdd44, 10); endLeft
$yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer


#comments-end

Global $altarTimer

;$dll = DllOpen("user32.dll")

consolewrite("script activated" & @LF)


Func test()
   altar()
EndFunc

While 1
   If $click = True Then
	  BBF1()
	  $count += 1
   EndIf
   WEnd

Func BBF1()
   BBF1Setup()
	BBF1Combo()
EndFunc

Func BBF1Setup()
   $yellowPixel = PixelSearch(72, 87, 110, 96, 0xFFdd44, 10); middlePlat
   If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
		While @error
         Sleep(100)
			$yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
		WEnd
	  	Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(107, 93, 156, 102, 0xFFdd44, 10); botRightPlat
   If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(22, 68, 38, 101, 0xFFdd44, 10); endLeft
		While @error
	    	finishingBlow()
			Sleep(100)
         teleport("left")
         Sleep(200)
			$yellowPixel = PixelSearch(22, 68, 38, 101, 0xFFdd44, 10); endLeft
		WEnd
	  	Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
   If NOT @error Then
      Send($jumpbutton)
      Sleep(200)
      $yellowPixel = PixelSearch(27, 68, 77, 77, 0xFFdd44, 10); topLeftPlat
      While @error
         teleport("up")
         Sleep(200)
         $yellowPixel = PixelSearch(27, 68, 77, 77, 0xFFdd44, 10); topLeftPlat
      WEnd
   EndIf

   $yellowPixel = PixelSearch(27, 68, 77, 77, 0xFFdd44, 10); topLeftPlat
   If NOT @error Then
      Send("{left down}")
      altar()
      Global $altarTimer = TimerInit()
      Sleep(200)
	   Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(27, 68, 77, 77, 0xFFdd44, 10); topLeftPlat
   If NOT @error Then
      $yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer
      While @error
         teleport("down")
         Sleep(200)
         $yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer
      WEnd
   EndIf
EndFunc

Func BBF1Combo()
   While TimerDiff($altarTimer) < 40000

	If isOFFCD($sweepingBlowCol, $sweepingBlowRow) Then
		sweepingBlow()
	  	sleep(200)
    EndIf

	If isOFFCD($darkGenesisCol, $darkGenesisRow) Then
		darkGenesis()
	  	sleep(200)
    EndIf

	If isOFFCD($auraScytheCol, $auraScytheRow) Then
		auraScythe()
	  	sleep(200)
    EndIf

   $yellowPixel = PixelSearch(72, 87, 110, 96, 0xFFdd44, 10); middlePlat
   If Not @error Then
      moveleft(25)
      EndIf

   $yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer
   If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(22, 68, 38, 101, 0xFFdd44, 10); endLeft
		While @error
	    	finishingBlow()
			Sleep(100)
         teleport("left")
         Sleep(200)
			$yellowPixel = PixelSearch(22, 68, 38, 101, 0xFFdd44, 10); endLeft
		WEnd
	  	Send("{left up}")
   EndIf

   $yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
   If Not @error Then
	Send("{right down}")
	$yellowPixel = PixelSearch(107, 68, 127, 101, 0xFFdd44, 10); teleUpRight
		While @error
	    	finishingBlow()
			Sleep(100)
         teleport("right")
         Sleep(200)
			$yellowPixel = PixelSearch(107, 68, 127, 101, 0xFFdd44, 10); teleUpRight
		WEnd
	  	Send("{right up}")
   EndIf

	If isOFFCD($sweepingBlowCol, $sweepingBlowRow) Then
		sweepingBlow()
	  	sleep(200)
    EndIf

	If isOFFCD($darkGenesisCol, $darkGenesisRow) Then
		darkGenesis()
	  	sleep(200)
    EndIf

   $yellowPixel = PixelSearch(107, 93, 156, 102, 0xFFdd44, 10); botRightPlat
   If NOT @error Then
      Send($jumpbutton)
      Sleep(200)
      $yellowPixel = PixelSearch(102, 68, 152, 77, 0xFFdd44, 10); topRightPlat
      While @error
         teleport("up")
         Sleep(200)
         $yellowPixel = PixelSearch(102, 68, 152, 77, 0xFFdd44, 10); topRightPlat
      WEnd
   EndIf

   $yellowPixel = PixelSearch(102, 68, 152, 77, 0xFFdd44, 10); topRightPlat
   If Not @error Then
	Send("{right down}")
	$yellowPixel = PixelSearch(135, 68, 156, 101, 0xFFdd44, 10); endRight
		While @error
	    	finishingBlow()
			Sleep(100)
         teleport("right")
         Sleep(200)
			$yellowPixel = PixelSearch(135, 68, 156, 101, 0xFFdd44, 10); endRight
		WEnd
	  	Send("{right up}")
   EndIf

   $yellowPixel = PixelSearch(102, 68, 152, 77, 0xFFdd44, 10); topRightPlat
   If NOT @error Then
      $yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer
      While @error
         teleport("down")
         Sleep(200)
         $yellowPixel = PixelSearch(22, 87, 156, 101, 0xFFdd44, 10); botLayer
      WEnd
   EndIf

   finishingBlow()
   Sleep(100)
   teleport("left")
   Sleep(200)

   $yellowPixel = PixelSearch(107, 93, 156, 102, 0xFFdd44, 10); botRightPlat
   If NOT @error Then
      grimHarvest()
      sleep(200)
   EndIf  
   
   $yellowPixel = PixelSearch(107, 93, 156, 102, 0xFFdd44, 10); botRightPlat
   If Not @error Then
	Send("{left down}")
	$yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
		While @error
	    	finishingBlow()
			Sleep(100)
         teleport("left")
         Sleep(200)
			$yellowPixel = PixelSearch(22, 93, 72, 102, 0xFFdd44, 10); botLeftPlat
		WEnd
	  	Send("{left up}")
   EndIf
   WEnd
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

Func finishingBlow()
   Send($finishingBlowButton)
   Sleep(150)
EndFunc

Func teleport($direction)
Send("{" & $direction & " down}")
Send($teleportButton)
Sleep(200)
Send($teleportButton)
Sleep(200)
Send("{" & $direction & " up}")
EndFunc

Func upJump()
   send($jumpButton)
   sleep(100)
   send("{up down}")
   sleep(25)
   send($jumpButton)
   send($jumpButton)
   sleep(200)
   send("{up up}")
   sleep(25)
EndFunc

Func altar()
   Send("{down down}")
   sleep(25)
   Send($altarButton)
   sleep(100)
   Send("{down up}")
   sleep(25)
EndFunc

Func sweepingBlow()
   While isOffCD($sweepingBlowCol, $sweepingBlowRow)
      Send($sweepingBlowButton)
      Sleep(200)
   WEnd
EndFunc

Func darkGenesis()
   While isOffCD($darkGenesisCol, $darkGenesisRow)
      Send($darkGenesisButton)
      Sleep(300)
   WEnd
EndFunc

Func auraScythe()
   While isOffCD($auraScytheCol, $auraScytheRow)
      Send($auraScytheButton)
      Sleep(300)
   WEnd
EndFunc

Func grimHarvest()
   While isOffCD($grimHarvestCol, $grimHarvestRow)
      Send($grimHarvestButton)
      Sleep(300)
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