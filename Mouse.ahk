#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force	;only one instance at a time running
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

~LButton Up::
	if f24IsPressed
		Send ^w ; Alt w
		mouseIsPressed := true
		Return

~XButton1 Up::
	if f24IsPressed
		Send ^+t ; control shift t
		mouseIsPressed := true
		Return

~F24::
	f24IsPressed := true
	KeyWait, F24
	f24IsPressed := false

	if mouseIsPressed
		mouseIsPressed := false
		Return
	
	If (A_PriorHotKey = "F24" AND A_TimeSincePriorHotkey < 175){
	  SetTimer, DefaultF24, Off
	  Send !7 ; Alt 7
	  Return
	}Else
	  SetTimer, DefaultF24, -175
	  Return

	DefaultF24:
		Send !6 ; Alt 6
		Return