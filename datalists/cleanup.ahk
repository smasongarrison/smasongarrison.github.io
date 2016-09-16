#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn   ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%
Loop, *_data.csv
	FileDelete, % A_LoopFileFullPath
	
Loop, *.bak
	FileDelete, % A_LoopFileFullPath
	
; R Packages	
INPUT = %A_ScriptDir%\R_Packages_export.csv
OUTPUT = %A_ScriptDir%\R_Packages_data.csv
file := FileOpen(INPUT,"a")
if !IsObject(file)
{
	MsgBox Can't open "%INPUT%" for appending.
	return
}
fileread, contents, %INPUT% ; Read the file
fileAppend, contents, %INPUT%.bak ; Re-create the file with new contents

stringReplace, contents, contents, "<a, <a, All
stringReplace, contents, contents, >", >, All
fileAppend, %contents%, %OUTPUT% ;

; Data Collections
INPUT = %A_ScriptDir%\collections_export.csv
OUTPUT = %A_ScriptDir%\collections_data.csv

file := FileOpen(INPUT,"a")
if !IsObject(file)
{
	MsgBox Can't open "%INPUT%" for appending.
	return
}
fileread, contents, %INPUT% ; Read the file
fileAppend, contents, %INPUT%.bak ; Re-create the file with new contents

stringReplace, contents, contents, ", , All
fileAppend, %contents%, %OUTPUT% ; Re-create the file with new contents

