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
Dim $dashButton = "q"
Dim $upjumpButton = "d"


; Platforms
;$yellowPixel = PixelSearch(114, 95, 139, 106, 0xFFdd44, 10); reset
;$yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
;$yellowPixel = PixelSearch(84, 67, 166, 82, 0xFFdd44, 10); topPlat
;$yellowPixel = PixelSearch(84, 67, 108, 82, 0xFFdd44, 10); dashLeft
;$yellowPixel = PixelSearch(143, 67, 166, 82, 0xFFdd44, 10); dashRight
;$yellowPixel = PixelSearch(67, 86, 86, 92, 0xFFdd44, 10); leftPlat1
;$yellowPixel = PixelSearch(51, 96, 77, 101, 0xFFdd44, 10); leftPlat2
;$yellowPixel = PixelSearch(163, 87, 181, 92, 0xFFdd44, 10); rightPlat1
;$yellowPixel = PixelSearch(179, 96, 197, 101, 0xFFdd44, 10); rightPlat2
;$yellowPixel = PixelSearch(51, 76, 71, 83, 0xFFdd44, 10); nullLeft
;$yellowPixel = PixelSearch(178, 75, 198, 83, 0xFFdd44, 10); nullRight



Global $totemTimer
Global $collectTimer
consolewrite("script activated" & @LF)
Func test()
   collectL()
   collectR()
EndFunc

While 1
   If $click = True Then
	  totemtimer()
	  $count += 1
   EndIf
   WEnd

Func totemtimer()
    totemSetup()
    combo()
    collectL()
    collectR()
 EndFunc

 Func totemSetup()
	totem()
	Global $totemTimer = TimerInit()
	sleep(300)
EndFunc

Func combo()
While TimerDiff($totemTimer) < 60000

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

Func collectL()
	If isOFFCD($sengokucol, $sengokurow) Then
		sengoku()
	  	sleep(300)
    EndIf
   $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
   If NOT @error Then
      Send($upjumpButton)
      sleep(800)
   EndIf

   phantomBlade()
   Sleep(200)

   $yellowPixel = PixelSearch(84, 67, 166, 82, 0xFFdd44, 10); topPlat
   If NOT @error Then
	   Send("{left down}")
      $yellowPixel = PixelSearch(84, 67, 108, 82, 0xFFdd44, 10); dashLeft
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(84, 67, 108, 82, 0xFFdd44, 10); dashLeft
         WEnd
         Send("{left up}")
         EndIf   

   $yellowPixel = PixelSearch(84, 67, 108, 82, 0xFFdd44, 10); dashLeft
   If NOT @error Then
      Send($dashButton)
      sleep(600)
   EndIf

   $yellowPixel = PixelSearch(51, 76, 71, 83, 0xFFdd44, 10); nullLeft
   If NOT @error Then
      moveRight(50)
   EndIf

   $yellowPixel = PixelSearch(67, 86, 86, 92, 0xFFdd44, 10); leftPlat1
   If NOT @error Then
	   Send("{left down}")
      $yellowPixel = PixelSearch(51, 96, 77, 101, 0xFFdd44, 10); leftPlat2
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(51, 96, 77, 101, 0xFFdd44, 10); leftPlat2
         WEnd
         Send("{left up}")
	If isOFFCD($falconsHonorcol, $falconsHonorrow) Then
		falconsHonor()
	  	sleep(300)
    EndIf

 	If isOFFCD($instantSlicecol, $instantSlicerow) Then
		instantSlice()
	  	sleep(300)
    EndIf
    Sleep(200)
      EndIf

   $yellowPixel = PixelSearch(51, 96, 77, 101, 0xFFdd44, 10); leftPlat2
   If NOT @error Then
	   Send("{right down}")
      $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
         WEnd
         Send("{right up}")
         Sleep(600)
      EndIf    

   $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
   If NOT @error Then
	   Send("{right down}")
      $yellowPixel = PixelSearch(114, 95, 139, 106, 0xFFdd44, 10); reset
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(114, 95, 139, 106, 0xFFdd44, 10); reset
         WEnd
         Send("{right up}")
      EndIf   
EndFunc

Func collectR()
	If isOFFCD($sengokucol, $sengokurow) Then
		sengoku()
	  	sleep(300)
    EndIf
  $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
   If NOT @error Then
      Send($upjumpButton)
      sleep(800)
   EndIf

   $yellowPixel = PixelSearch(84, 67, 166, 82, 0xFFdd44, 10); topPlat
   If NOT @error Then
	   Send("{right down}")
      $yellowPixel = PixelSearch(143, 67, 166, 82, 0xFFdd44, 10); dashRight
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(143, 67, 166, 82, 0xFFdd44, 10); dashRight
         WEnd
         Send("{right up}")
         EndIf

   $yellowPixel = PixelSearch(143, 67, 166, 82, 0xFFdd44, 10); dashRight
   If NOT @error Then
      Send($dashButton)
      sleep(600)
   EndIf

   $yellowPixel = PixelSearch(178, 75, 198, 83, 0xFFdd44, 10); nullRight
   If NOT @error Then
      moveLeft(50)
   EndIf

   $yellowPixel = PixelSearch(163, 87, 181, 92, 0xFFdd44, 10); rightPlat1
   If NOT @error Then
	   Send("{right down}")
      $yellowPixel = PixelSearch(179, 96, 197, 101, 0xFFdd44, 10); rightPlat2
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(179, 96, 197, 101, 0xFFdd44, 10); rightPlat2
         WEnd
         Send("{right up}")
         Sleep(400)
      EndIf

   $yellowPixel = PixelSearch(179, 96, 197, 101, 0xFFdd44, 10); rightPlat2
   If NOT @error Then
	   Send("{left down}")
      phantomBlade()
      $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
         WEnd
         Send("{left up}")
         Sleep(600)
      EndIf    

   $yellowPixel = PixelSearch(74, 95, 176, 106, 0xFFdd44, 10); botPlat
   If NOT @error Then
	   Send("{left down}")
      $yellowPixel = PixelSearch(114, 95, 139, 106, 0xFFdd44, 10); reset
      While @error
         sleep(100)
         $yellowPixel = PixelSearch(114, 95, 139, 106, 0xFFdd44, 10); reset
         WEnd
         Send("{left up}")
      EndIf  

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

Func doublejumpH()
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
   sleep(100)
   Send($jumpbutton)
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