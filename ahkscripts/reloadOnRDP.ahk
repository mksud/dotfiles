; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.

Run(A_ScriptDir "\vimCaps.ahk")

Persistent
SetTimer(ReloadOnRDP, 500)

ReloadOnRDP()
{
    If WinActive("ahk_class TscShellContainerClass")
    {
        Run(A_ScriptDir "\vimCaps.ahk")
        WinWaitNotActive()
    }
}
