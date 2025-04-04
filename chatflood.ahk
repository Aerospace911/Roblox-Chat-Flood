MaxApps := 0
x := 300
y := 500


CountRobloxClients() {
    WinGet, RobloxClients, List, ahk_exe RobloxPlayerBeta.exe
    return RobloxClients
}

SetTimer, CheckRobloxClients, 5000
return

CheckRobloxClients:
    RobloxClientCount := CountRobloxClients()

    if (RobloxClientCount > MaxApps) {
        MaxApps := RobloxClientCount
    }


return

^!b::
WinGet, robloxid, list, ahk_exe RobloxPlayerBeta.exe
Sleep 100
Loop %MaxApps%{
    Counter := MaxApps + 1 - A_Index
    robloxid := robloxid%Counter%
    IfWinExist ahk_id %robloxid%
    {
        WinActivate ahk_id %robloxid%
            Sleep %x%
        Send /
            Sleep %x%
        Send {Ctrl Down}
        Send {v}
        Send {Ctrl Up}
	sleep, 300
        Send {Enter}
            Sleep %y%
    }
}
return
