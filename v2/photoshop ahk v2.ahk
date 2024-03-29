﻿#Requires AutoHotkey v2.0
OnError LogError
i := Integer("cause_error")

LogError(exception, mode) {
    FileAppend "Error on line " exception.Line ": " exception.Message "`n"
        , "errorlog.txt"
    return true
}


#HotIf WinActive("ahk_exe Photoshop.exe")

;doc := ps.activeDocument
Capslock & F1::{
    ps := ComObjActive("Photoshop.Application")
    ps.DoJavaScript("alert('save to jpg')")
}

F5::{
    ps := ComObjActive("Photoshop.Application")
    char :="
    (
        var descriptor = app.ActionDescriptor
        //to smartobject
        var a = app.stringIDToTypeID("newPlacedLayer")
        var b =app.stringIDToTypeID("placedLayerConvertToLayers")
        executeAction(a,descriptor)
    )"
    ps.DoJavaScript(char)
}



#Space::{
ToolTip "Timed ToolTip`nThis will be displayed for 1 seconds.",100,150
SetTimer () => ToolTip(), -500
}


#HotIf
