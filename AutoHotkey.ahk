; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;#z::Run www.autohotkey.com

;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

;DA QUI INIZIO
;# WIN
;! ALT
;^ CTRL

;#!F4 Up::run %windir%\system32\taskmgr.exe

;#^F1 Up::run D:\comandi\Hotkeys\HOTKEY_Installazione applicazioni.lnk
;#^F1 Up::run D:\Users\Francesco\Tools\ClipboardToPastie.exe

;#^F11 Up::run D:\Users\Francesco\Google Drive\OS\Tools\FDDShots.exe -autowindowshot -linkclip
;#^F12 Up::run D:\Users\Francesco\Google Drive\OS\Tools\FDDShots.exe -autoshot -linkclip


;#^\ Up::run explorer.exe %clipboard%

;!^down::Send #d

;!^up::Send {MButton}

;!^'::Send {Asc 96}
;!^\::Send {Asc 126}

;#^F2::
;   ClipTemp := Clipboard
;   Send ^c
;   Run, http://www.google.it/search?q=%Clipboard%
;   Clipboard := ClipTemp
;return

; toggle = 0
; ; Change your hotkey here
; #\::
;   DetectHiddenWindows, on
;   IfWinExist ahk_class Console_2_Main
;   {	
;     if(toggle >0) {
;       WinShow ahk_class Console_2_Main
;       WinActivate ahk_class Console_2_Main
;       toggle=0
;     }
;     else
;     {
;       WinHide ahk_class Console_2_Main
;       WinActivate ahk_class Shell_TrayWnd
;       toggle=2
;     }
;   }
;   else	
;     Run Console.exe
;   DetectHiddenWindows, off
;   return

; Change your hotkey here
; OpenShellIfNotRunning()
; {
;   Opening := False
;   DetectHiddenWindows, on
;   IfWinNotExist ahk_class mintty
;   {
;     ConsolePath := "D:\Users\Francesco\Google Drive\OS\Tools\cygwin_on_path.bat"
;     EnvGet UserProfile, UserProfile
;     Run %ConsolePath%, %UserProfile%
;     Opening := True
;     WinWaitActive ahk_class mintty
;   }
;   DetectHiddenWindows, off

;   Return Opening
; }

; ShowShell()
; {
;   WinShow ahk_class mintty
;   ; Make it topmost
;   WinSet AlwaysOnTop, on, ahk_class mintty
;   ; Delete Border
;   WinSet Style, -0xC00000, ahk_class mintty
;   ; Disable resizing
;   WinSet Style, -0x40000, ahk_class mintty
;   WinMove ahk_class mintty,, 2, 0, 1915, 472
;   WinActivate ahk_class mintty
;   ControlFocus ahk_class mintty, ahk_class mintty
; }

; HideShell()
; {
;   ; Because hiding the window won't deactivate it, activate the window
;   ; beneath this one (if any). I tried other ways, but they wound up
;   ; activating the task bar.  This way sends the active window (which is
;   ; about to be hidden) to the back of the stack, which seems best:
;   ; Send, !{esc}
;   WinHide ahk_class mintty
; }

; ; http://www.autohotkey.com/board/topic/32487-simple-minimize-to-tray/
; ; RestoreFromTrayMenu:
; ;   Menu Tray, delete, %A_ThisMenuItem%
; ;   ShowShell()
; ; Return
; ; Menu, Tray, Add, Toggle Window, GuiToggle
; ; Menu, Tray, Default, Toggle Window

; #\::
;   If (OpenShellIfNotRunning())
;   {
;     ShowShell()
;   }
;   Else
;   {
;     ; If Window Visible
;     IfWinExist ahk_class mintty
;     {
;       HideShell()
;     }
;     Else
;     {
;       ShowShell()
;     }
;   }
; Return

OpenShellIfNotRunning()
{
  Opening := False
  DetectHiddenWindows, on
  IfWinNotExist ahk_class Console_2_Main
  {
    ConsolePath := "D:\ConsoleZ\Console.exe"
    EnvGet UserProfile, UserProfile
    Run %ConsolePath%, "-d", %UserProfile%
    Opening := True
    WinWaitActive ahk_class Console_2_Main
  }
  DetectHiddenWindows, off

  Return Opening
}

ShowShell()
{
  WinShow ahk_class Console_2_Main
  WinActivate ahk_class Console_2_Main
  ControlFocus ahk_class Console_2_Main, ahk_class Console_2_Main
}

HideShell()
{
  WinHide ahk_class Console_2_Main
  MouseGetPos,,, WinUMID
  WinActivate ahk_id %WinUMID%
}

; Hotkey is Win + \
#\::
  If (OpenShellIfNotRunning())
  {
    ShowShell()
  }
  Else
  {
    ; If Window Visible
    IfWinExist ahk_class Console_2_Main
    {
      HideShell()
    }
    Else
    {
      ShowShell()
    }
  }
Return

#1::
  Send #^{F1}
  Return
#2::
  Send #^{F2}
  Return
#3::
  Send #^{F3}
  Return
#4::
  Send #^{F4}
  Return
#5::
  Send #^{F5}
  Return
#6::
  Send #^{F6}
  Return
#xbutton1::
  Send #^{F7}
  Return
#xbutton2::
  Send #^{F8}
  Return