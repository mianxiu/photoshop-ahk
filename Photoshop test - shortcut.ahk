#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; var

/*
this scripts is only change Photoshop shortcut
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
    LWin::RButton
F1:: 
    ToolTip, create a vector group,
    SetTimer, RemoveToolTip, -500
    Send, ^+!n
    Sleep, 1
    Send ^gvp{F2}
    ; group name
    Send Black Vector
    Send {Tab}1{Enter}

Return
;F2 is rename
F3::
    Send, ^+!n
Return

; select or move layer up or down
CapsLock & w::
    GetKeyState, state, Ctrl
    if state = D
        Send, ^]
    Else
        Send, !]
Return

CapsLock & s::
    GetKeyState, state, Ctrl
    if state = D
        Send, ^[
    Else
        Send, ![
Return

; open layer blending options - gradient overlay
CapsLock & f::
    GetKeyState, state, Shift
    if state = D
        Send, !lya
    Else
        Send, !lyn
Return

CapsLock & c::
    Send, !lyc
Return

CapsLock & v::
    Send, !lyp
Return

CapsLock & x::
    send, !lo
Return

;todo tab+ 窗口并排等
; scroll
Tab::Tab
Tab & w::
    MouseClick,WheelUp,,,6,0,D,R
return
Tab & s::
    MouseClick,WheelDown,,,6,0,D,R
return

Tab & e::
    Send, !waw
    Send, !wa{Down}{Down}{Down}{Enter}
    Sleep, 1000
    Send, !w2{Enter}
Return
;capslock + ` + 1-6 执行转line
CapsLock & `::
    ToolTip, convert vector to 1-6 px line,
    Input, UserInput,V T5 L4 C,*,1,2,3,4,5,6,7,8,9
    if (ErrorLevel = "Max")
    {
        ToolTip, You entered "%UserInput%", which is the maximum length of text
        SetTimer, RemoveToolTip, -120
        return
    }
    if (ErrorLevel = "Timeout")
    {
        ToolTip, You entered "%UserInput%" at which time the input timed out.
        SetTimer, RemoveToolTip, -120
        return
    }
    if (ErrorLevel = "NewInput")
        return
    If InStr(ErrorLevel, "EndKey:")
    {
        ToolTip, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
        SetTimer, RemoveToolTip, -120
        return
    }
    ; 否则，找到了匹配。
    if (UserInput = "1")
        ToolTip, 1,
    else if (UserInput = "2")
        ToolTip, 2,
    else if (UserInput = "3")
        ToolTip, 3,
    else if (UserInput = "4")
        ToolTip, 4,
    else if (UserInput = "5")
        ToolTip, 5,
    else if (UserInput = "6")
        ToolTip, 6,
    else if (UserInput = "7")
        ToolTip, 7,
    else if (UserInput = "8")
        ToolTip, 8,
    else if (UserInput = "9")
        ToolTip, 9,

    SetTimer, RemoveToolTip, -120
Return


#If

