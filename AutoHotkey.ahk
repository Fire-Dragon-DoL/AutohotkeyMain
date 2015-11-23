;DA QUI INIZIO
;# WIN
;! ALT
;^ CTRL

; Script: Yakuake Console

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

;RESIZING
#^F9::
  WinSet, Style, -0xC00000,a ; remove the titlebar and border(s)
  WinMove, a, , 0, 0, 1920, 1080 ; move the window to 0,0 and resize it to 1920X1080
  Return

#^F8::
  WinGet, currentWindow, ID, A
  WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
  If (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
    Winset, AlwaysOnTop, off, ahk_id %currentWindow%
  Else
    WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
  Return
