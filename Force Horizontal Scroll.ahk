#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

+WheelDown::
	If WinActive("ahk_exe WINWORD.EXE") {
 		ControlGetFocus, fcontrol, A
 		Loop 1  ; <-- Increase or decrease this value to scroll faster or slower.
 		ComObjActive("Word.application").ActiveWindow.SmallScroll(0,0,1,0)
	} else
		Send {WheelRight}
	return
+WheelUp::
	If WinActive("ahk_exe WINWORD.EXE") {
		ControlGetFocus, fcontrol, A
 		Loop 1  ; <-- Increase or decrease this value to scroll faster or slower.
 			ComObjActive("Word.application").ActiveWindow.SmallScroll(0,0,0,1)
	} else
		Send {WheelLeft}
	return