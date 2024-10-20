; #Warn                     ; Enable warnings to assist with detecting common errors.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.

Run(A_ScriptDir "\vimCaps.ahk")

Persistent
SetTimer(ReloadOnRDPMaximized, 500)

ReloadOnRDPMaximized()
{
    If WinActive("ahk_class TscShellContainerClass")
    {
        maxOrMin := WinGetMinMax()

        if (maxOrMin = 0) {
            WinGetPos(&PosX, &PosY)

            if (PosY = 0) {
                ; it is fully maximized therefore reload "vimCaps.ahk"
                Run(A_ScriptDir "\vimCaps.ahk")

                ; wait until window gets deactivated so you don't reload it again.
                WinWaitNotActive()

            }
        }
    }
}
