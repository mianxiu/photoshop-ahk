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
CapsLock & g::
    GetKeyState, state, Shift
    if state = D
        Send, !lya
    Else
        Send, !lyg

Return
;todo tab+ 窗口并排等
; scroll
Tab::Tab
Tab & w::
    MouseClick,WheelUp,,,10,0,D,R
return
Tab & s::
    MouseClick,WheelDown,,,10,0,D,R
return
/*
replace text
*/
::t::top
::b::bottom
::l::left
::r::right
::f::front
::s::side
::m::mid
::e::edge
::bg::background
::bk::back
::h::highlight
;
::ll::line
::ol::outline
::is::inside
::mk::mask
;

#If

