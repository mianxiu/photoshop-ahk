#Requires AutoHotkey v2.0
;check process


#HotIf WinActive("ahk_exe Photoshop.exe")

;doc := ps.activeDocument
Capslock & F1::{
    ps := ComObjActive("Photoshop.Application")
    ps.DoJavaScript("alert('save to jpg')")
}

CapsLock & Numpad1::{
    ps := ComObjActive("Photoshop.Application")
    ps.DoJavaScript("alert('save to jpg')")
}

#Space::{
ToolTip "Timed ToolTip`nThis will be displayed for 1 seconds.",100,150
SetTimer () => ToolTip(), -500
}


#HotIf
