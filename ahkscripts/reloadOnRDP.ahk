#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Run "autohotkey" "vimCaps.ahk"

#Persistent
SetTimer, ReloadOnRDPMaximized, 500
return

ReloadOnRDPMaximized:
If WinActive("ahk_class TscShellContainerClass")
{
    WinGet, maxOrMin, MinMax, ahk_class TscShellContainerClass

    if (maxOrMin = 0) {
        WinGetPos, PosX, PosY, WinWidth, WinHeight, ahk_class TscShellContainerClass

        if (PosY = 0) {
            ; it is fully maximized therefore reload "vimCaps.ahk"
            Run "autohotkey" "vimCaps.ahk"

            ; wait until window gets deactivated so you don't reload it again.
            WinWaitNotActive, ahk_class TscShellContainerClass

        }
    }
}
return
