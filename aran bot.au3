#include<IE.au3>
#include <Misc.au3>
#RequireAdmin

HotKeySet("{END}" , "close")
HotKeySet("{HOME}", "setfix")
HotKeySet("{F10}", "thunder")
Dim $click = False
Dim $fix = False
Dim $count = 0
Dim $looptime = 20

Dim $carnageButton = "6"
Dim $holysymbolbutton = "r"
Dim $domainButton = "d"

$dll = DllOpen("user32.dll")

Func carnage()
   Send($carnageButton)
   	  sleep(100)
EndFunc
Func close()
    Exit
EndFunc

Func Thunder()
   moveright(100)
   Swipe()
   slide()
   dash()

   swipe()
   slide()
   dash()

   swipe()
   dash()

   swipe()
   slide()
   dash()

   swipe()
   dash()

   moveleft(100)
   swipe()
   slide()
   dash()

   swipe()
   slide()

   swipe()
   slide()

   swipe()
   slide()

   swipe()
   slide()

   swipe()
   slide()
   dash()
EndFunc

Func setfix()
   $fix = True
EndFunc

Func superCombo()
   Send("{8}")
   Send("{s}")
   sleep(900)
   slide()

   Send("{s}")
   sleep(400)
   Send("{s}")
   sleep(550)
   slide()
   sleep(100)

   Send("{s}")
   sleep(500)
   slide()
EndFunc

Func swipe()
   Send("{down down}")
   Send("a")
   sleep(100)
   send("{down up}")
   ;sleep(Random(10, 40, 1))
   sleep(250)
   Send("s")
   sleep(550)
EndFunc

Func dash()
   Send("{SPACE}")
   Sleep(100)
   Send("{LSHIFT}")
   Sleep(700)
EndFunc

Func slide()
   Send("{LSHIFT}")
   Sleep(250)
EndFunc

Func buff()
   Send("q")
   Sleep(2300)
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

Func Rev2A()
   moveleft(100)
   swipe()
   slide()
   dash()

   For $i = 4 To 1 Step -1
	  swipe()
	  slide()
   Next

   dash()

   Send("{DOWN down}")
   Send("{SPACE}")
   Sleep(500)
   Send("{DOWN up}")
   moveRight(100)
   slide()

   For $i = 2 To 1 Step -1
	  swipe()
	  slide()
   Next

   If  Mod ($count, Ceiling(150/$looptime)) = 0 Then
	  Send($domainButton)
	  Sleep(1300)
   Else
	  swipe()
	  sleep(1100)
	  Carnage()
    EndIf

   For $i = 4 To 1 Step -1
	  swipe()
	  slide()
   Next
   dash()

   moveLeft(50)
   slide()
   For $i = 3 To 1 Step -1
	  Send("{up}")
	  Sleep(75)
   Next
   ;$click = False
EndFunc

Func fixRev()
   moveRight(50)
   slide()
   dash()
   moveLeft(50)
   slide()
   For $i = 3 To 1 Step -1
	  Send("{up}")
	  Sleep(75)
   Next
   $fix = False
   $click = True
EndFunc

While 1
	  If $click = True Then

		 If  Mod($count, Ceiling(180/$looptime)) = 0 Then
			moveLeft(50)
			buff()
			Send($HolySymbolButton)
			Sleep(900)
		 EndIf

		 If Mod($count, Ceiling(240/$looptime)) = 2 Then
			Send("{w}")
			Sleep(300)
		 EndIf
		 rev2A()
		 $count += 1
      EndIf
	  If $fix = True Then
		 fixRev()
	  EndIf
WEnd

Func combo()
   ;Send("{DOWN down}")
   Send("{8}")
   ;Send("{DOWN up}")
   ;Sleep(100)
   For $i = 5 To 1 Step -1
	  Send("{s}")
	  Sleep(300)
   Next
   Sleep(600)
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


