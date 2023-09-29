;---[some general setup flags and best-practice optimizations]---
#NoEnv	;for performance/compatibility
#SingleInstance, Force	;only one instance at a time running
SetWorkingDir %A_ScriptDir%	;work in the same folder the script is in
ListLines,  Off ;should help performance
SetTitleMatchMode, 2 ;'containing'

;---[declare some globals for tidyness/ease of later editing]---
global config_gameArea := "D:\Pentab Settings\Osu\tabletconfig.ini"
global config_defaultArea := "C:\PenTabletDriver\tabletconfig.ini"
global config_defaultAreaBackup := "C:\PenTabletDriver\tabletconfig_backup.ini"

global path_TabletDriver := "C:\PenTabletDriver\TabletDriver.exe"
global path_game := "D:\osu\osu!.exe"	; game path

;---[functions used above]---	
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

enable_gameArea() {
	DetectHiddenWindows, on	;probably needs this to work
	
	;rename the existing config file (instead of deleting/overwriting - this lets us revert back when done)
	FileMove, %config_defaultArea%, %config_defaultAreaBackup%, 1
	
	;now bring in the new 'game area' file, right where the other one just was:
	FileCopy, %config_gameArea%, %config_defaultArea%, 1
	
	;close TabletDriver;
	Process, Close, TabletDriver.exe		;hopefully this actually kills the app, if not we can escalate

	;finally, relaunch TabletDriver:
	Run, %path_TabletDriver%, , TD_PID

	Sleep, 1000
	
	If ProcessExist("TabletDriver.exe")
		Return
	If !ProcessExist("TabletDriver.exe")
		enable_gameArea()
}

disable_gameArea() {
	DetectHiddenWindows, on	;probably needs this to work
	
	;undo our previous work - overwrite the game mode config with our backup
	FileMove, %config_defaultAreaBackup%, %config_defaultArea%, 1

	;close TabletDriver:	
	Process, Close, TabletDriver.exe	
	
	;relaunch TabletDriver
	Run, %path_TabletDriver% , TD_PID
	
	Sleep, 1000
	
	If ProcessExist("TabletDriver.exe")
		Return
	If !ProcessExist("TabletDriver.exe")
		disable_gameArea()

}

;---[actual meat of the script]---

;change to 'game mode color'
enable_gameArea()	;note: you can safely move this to before launching the game if that timing works better

;launch the game:
Run, %path_game%, , , GAME_PID
WinWait, ahk_pid %GAME_PID%

;wait for the game to close:
WinWaitClose, ahk_pid %GAME_PID%		;this WILL wait indefinitely

;once it's closed, revert to pre-gamemode state:
disable_gameArea()

return	
;---[end of script]---
