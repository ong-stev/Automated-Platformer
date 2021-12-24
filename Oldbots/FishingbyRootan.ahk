	/*
   [F1] Get the mouse cursor coordinates (X, Y) and color, and copy.
   [F2] Start the script.
   ※The following shortcut keys will not occupy the original functions ※
   [Insert] Pause [On/Off].
   [Home] Re-read the script.
   [End] Closes the script.
   [Alt+K] Displays the history of script information and recent keystrokes and mouse clicks.
*/
;----------------------------------------------------------------------------
#MaxHotkeysPerInterval, 1000 ;Specify the rate at which the hotkey is activated with #HotkeyInterval, above which a warning dialog will be displayed.
#MenuMaskKey, vk07 ;Change the button used to disguise (mask) the Win or Alt key release event.
#SingleInstance, force ;Decide if the script is allowed to run again when it is already running.
#UseHook, on ;Forces the use of hooks to implement all or part of the keyboard hotkeys.
DetectHiddenWindows, On ;Sets whether the script can "see" hidden windows.
;Process, Priority, , High ;Perform one of the following operations on the process: Check if the process exists; Change the priority of the process; Close the process; Wait for the process to close.
Menu, Tray, Icon, Shell32.dll, 172
;----------------------------------------------------------------------------
~$*Insert::Pause ; Pause.
~$*Home::Reload ; Re-read the script.
~$*End::ExitApp ; Close the script.
~$*!k::KeyHistory ; Displays script information and history of recent keystrokes and mouse clicks.
;----------------------------------------------------------------------------
=::
  Loop {
    WinGet, bnlid, List, ahk_class LaunchUnrealUWindowsClient
    EmptyMem()

    If ( PixelColor( 1094, 979, bnlid1)=="0xC9B283" )      ;Shortcut 5 has fishing bait 
    {        
      If ( PixelColor( 1142, 701, bnlid1)=="0xE4C632" ) {    ;F key arrow up  
        ControlSend, , f, ahk_id %bnlid1%
      }
        Sleep 1000
        ControlSend, , 5, ahk_id %bnlid1%                    ;Change 5 to any shortcut you like (6, 7, 8)
    }

  }
Return
;----------------------------------------------------------------------------
F1::
  MouseGetPos, OutputVarX, OutputVarY ; Get the coordinates of the mouse, assign the X coordinate of the mouse to the variable OutputVarX, and the same OutputVarY
  PixelGetColor, OutputVar, %OutputVarX%, %OutputVarY%, RGB ; Call the PixelGetColor function to get the RGB value of the coordinates of the mouse and assign it to OutputVar
  StringRight, OutputVar, OutputVar, 8 ; Intercepts the 8 characters to the right of OutputVar (the second OutputVar) because the value obtained is this: 0x000000. Assign the intercepted value to OutputVar (the first OutputVar).
  Clipboard = %OutputVarX%, %OutputVarY% %OutputVar% ; Send the value of OutputVarX OutputVarY OutputVar to the clipboard
  ToolTip, Coordinates: %OutputVarX%、%OutputVarY% `nHexColor: %OutputVar% ; Tooltip OutputVarX OutputVarY OutputVar
  SetTimer, RemoveToolTip, -5000 ; Let the tooltip disappear after a while
Return
;----------------------------------------------------------------------------
RemoveToolTip:
  ToolTip
Return
;----------------------------------------------------------------------------
GetColor(X,Y) {
  PixelGetColor, OutputVar, X, Y, RGB
  Return OutputVar
}
;----------------------------------------------------------------------------

PixelColor(pc_x, pc_y, pc_wID)
{
  If pc_wID
  {
    pc_hDC := DllCall("GetDC", "UInt", pc_wID)
    WinGetPos, , , pc_w, pc_h, ahk_id %pc_wID%
    pc_hCDC := DllCall("CreateCompatibleDC", "UInt", pc_hDC)
    pc_hBmp := DllCall("CreateCompatibleBitmap", "UInt", pc_hDC, "Int", pc_w, "Int", pc_h)
    pc_hObj := DllCall("SelectObject", "UInt", pc_hCDC, "UInt", pc_hBmp)
    DllCall("PrintWindow", "UInt", pc_wID, "UInt", pc_hCDC, "UInt", 0)
    pc_fmtI := A_FormatInteger
    SetFormat, IntegerFast, Hex
    pc_c := DllCall("GetPixel", "UInt", pc_hCDC, "Int", pc_x, "Int", pc_y, "UInt")
    pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
    pc_c .= ""
    SetFormat, IntegerFast, %pc_fmtI%
    DllCall("DeleteObject", "UInt", pc_hBmp)
    DllCall("DeleteDC", "UInt", pc_hCDC)
    DllCall("ReleaseDC", "UInt", pc_wID, "UInt", pc_hDC)
    ;MsgBox, colour: %pc_c%
    Return pc_c
  }
}
;----------------------------------------------------------------------------
EmptyMem() {
  Return, DllCall("psapi.dll\EmptyWorkingSet", "UInt", -1)
}
Return
;----------------------------------------------------------------------------
