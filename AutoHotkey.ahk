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

; Script: Multidesktop Management

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