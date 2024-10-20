; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.

SetCapsLockState("AlwaysOff")

;================================================================================================
; Remap copilot key to Right Control key
;================================================================================================
<+<#f23::Send "{Blind}{LShift Up}{LWin Up}{RControl Down}"
<+<#f23 Up::Send "{RControl Up}"

;================================================================================================
; Hot keys with CapsLock modifier for vim like arrow keys etc
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
{
    CapsLockState := GetKeyState("CapsLock", "T")
    if CapsLockState = 1
        SetCapsLockState("AlwaysOff")
    else
        SetCapsLockState("AlwaysOn")
    KeyWait("``")
}


