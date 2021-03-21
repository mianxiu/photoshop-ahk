#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; var

/*
F1::
    If WinActive("ahk_exe Photoshop.exe")
        ToolTip, create a vector group, 100, 100
    SetTimer, RemoveToolTip, -500
Return
*/

RemoveToolTip:
    ToolTip
Return

; use `%
#IfWinActive ahk_exe Photoshop.exe
F1:: 
    ToolTip, create a vector group,
    SetTimer, RemoveToolTip, -500
    Send, ^+!n
    Sleep, 1
    Send ^g
    Send v
    Send 4
    Send p
    Send {F2}
    ; group name
    Send Black Vector 40`%
    Send {Tab}
    Send 1
    Send {Enter}

Return

; select layer up or down
CapsLock & w::Send, !]
CapsLock & s::Send, ![

#If

