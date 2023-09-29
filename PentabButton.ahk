#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force	;only one instance at a time running
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!+F12:: ; Control Alt Shift F12
	If WinActive("ahk_exe ONENOTE.exe") {
		If (A_PriorHotKey = "^!+F12" AND A_TimeSincePriorHotkey < 175) {
		SetTimer, DefaultF12, Off
		KeyWait, F12
		
			if GetKeyState("F24", "D") {
				Send !6 ; Alt 6
			} Else {
				Send !2 ; Alt 2
				Return
			} 
		
		} Else {
		  SetTimer, DefaultF12, -175
		  KeyWait, F12
		  Return
		}
		
		DefaultF12:
			Send !1 ; Alt 1
			Return
			
	} Else {
		Send, {RButton Down}
 		KeyWait, F12
		Send, {RButton Up}
		Return
	}

^!+F11:: ; Control Alt Shift F11
	If WinActive("ahk_exe ONENOTE.exe") {
		If (A_PriorHotKey = "^!+F11" AND A_TimeSincePriorHotkey < 175) {
		  SetTimer, DefaultF11, Off
		  KeyWait, F11
		  Send !5 ; Alt 5
		  Return
		} Else {
		  SetTimer, DefaultF11, -175
		  KeyWait, F11
		  Return
		  
		}

		DefaultF11:
			Send !3 ; Alt 3
			Return
			
		} Else {
		Send, {MButton Down}
 		KeyWait, F11
		Send, {MButton Up}
		Return
	}

^!+F10:: ; Control Alt Shift F10
	If (A_PriorHotKey = "^!+F10" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF10, Off
	  KeyWait, F10
	  Send F11
	  Return
	}Else
	  SetTimer, DefaultF10, -175
	  KeyWait, F10
	  Return

	DefaultF10:
		Run, cmd.exe /c "D:\Archive\PC\Windows\Programs\Portable Programs\display\display64.exe" /toggle /device 1 /rotate:90,,Hide
Return

^!+F9:: ; Control Alt Shift F9
	If (A_PriorHotKey = "^!+F9" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF9, Off
	  KeyWait, F9
	  Send ^n
	  Return
	}Else
	  SetTimer, DefaultF9, -175
	  KeyWait, F9
	  Return

	DefaultF9:
		Send {F14} ; F14
Return

^!+F8:: ; Control Alt Shift F8
	If (A_PriorHotKey = "^!+F8" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF8, Off
	  KeyWait, F8
	  Send !3 ; Alt 3
	  Return
	}Else
	  SetTimer, DefaultF8, -175
	  KeyWait, F8
	  Return

	DefaultF8:
		Send !4 ; Alt + 4
Return

^!+F7:: ; Control Alt Shift F7
	If (A_PriorHotKey = "^!+F7" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF7, Off
	  KeyWait, F7
	  Send !2 ; Alt + 2
	  Return
	}Else
	  SetTimer, DefaultF7, -175
	  KeyWait, F7
	  Return

	DefaultF7:
		Send !1 ; Alt + 1
Return

^!+F6:: ; Control Alt Shift F6
	If (A_PriorHotKey = "^!+F6" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF6, Off
	  KeyWait, F6
	  Send !4 ; Alt 4
	  Return
	}Else
	  SetTimer, DefaultF6, -175
	  KeyWait, F6
	  Return

	DefaultF6:
		Run, cmd.exe /c "D:\Archive\PC\Windows\Programs\Portable Programs\display\display64.exe" /toggle /device 1 /rotate:90,,Hide
Return

^!+F5:: ; Control Alt Shift F5
	If (A_PriorHotKey = "^!+F5" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF5, Off
	  KeyWait, F5
	  Send !7 ; Alt + 7
	  Return
	}Else
	  SetTimer, DefaultF5, -175
	  KeyWait, F5
	  Return

	DefaultF5:
		Send !6 ; Alt + 6
Return

^!+F4:: ; Control Alt Shift F4
	If (A_PriorHotKey = "^!+F4" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF4, Off
	  KeyWait, F4
	  Send !7 ; Alt 7
	  Return
	}Else
	  SetTimer, DefaultF4, -175
	  KeyWait, F4
	  Return

	DefaultF4:
		Send !4 ; Alt + 4
Return

^!+F3:: ; Control Alt Shift F3
	If (A_PriorHotKey = "^!+F3" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF3, Off
	  KeyWait, F3
	  Send !4 ; Alt 4
	  Return
	}Else
	  SetTimer, DefaultF3, -175
	  KeyWait, F3
	  Return

	DefaultF3:
		Send {F15} ; F15
Return

^!+F2:: ; Control Alt Shift F2
	If (A_PriorHotKey = "^!+F2" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF2, Off
	  KeyWait, F2
	  Send !4 ; Alt 4
	  Return
	}Else
	  SetTimer, DefaultF2, -175
	  KeyWait, F2
	  Return

	DefaultF2:
		Send !5 ; Alt + 5
Return

^!+F1:: ; Control Alt Shift F1
	If (A_PriorHotKey = "^!+F1" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF1, Off
	  KeyWait, F1
	  Send ^y ; Ctrl + Y
	  Return
	}Else
	  SetTimer, DefaultF1, -175
	  KeyWait, F1
	  Return

	DefaultF1:
		Send ^z ; Ctrl + Z
Return