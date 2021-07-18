#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState, alwaysoff
;================================================================================================
;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
;================================================================================================
; Must double tap CapsLock to toggle CapsLock mode on or off.
;CapsLock::
;    KeyWait, CapsLock                                                   ; Wait forever until Capslock is released.
;    KeyWait, CapsLock, D T0.2                                           ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
;    if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") )                 ; Is a double tap on CapsLock?
;        {
;        SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"  ; Toggle the state of CapsLock LED
;        }
;return
;


;================================================================================================
; CapsLock sends escape instead
;================================================================================================
CapsLock::Send, {ESC}

;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
CapsLock & h:: Left 
CapsLock & j:: Down
CapsLock & k:: Up
CapsLock & l:: Right
CapsLock & y:: Home
CapsLock & u:: PgDn
CapsLock & i:: PgUp
CapsLock & o:: End
CapsLock & m:: Del


;================================================================================================
; Change caplock state by caplock + `
;================================================================================================
CapsLock & `::
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return


