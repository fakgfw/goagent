
Set WshShell = WScript.CreateObject("WScript.Shell")

If WshShell.Popup("是否将goagent.exe加入到启动项？", "1234", "GoAgent 对话框", 1) = 1 Then
    strStartup = WshShell.SpecialFolders("Startup")
    Set oShellLink = WshShell.CreateShortcut(strStartup & "\goagent.lnk")
    oShellLink.TargetPath = WshShell.CurrentDirectory & "\goagent.exe"
    oShellLink.WindowStyle = 1
    oShellLink.Description = "GoAgent"
    oShellLink.WorkingDirectory = WshShell.CurrentDirectory
    oShellLink.Save

    WshShell.Environment("Process").Item("PYTHONSCRIPT") = "import sys,os,ctypes;ctypes.windll.kernel32.WritePrivateProfileStringA('listen', 'visible', ' 0', os.path.abspath('proxy.ini'))"
    WshShell.Run "proxy.exe", 0

    WshShell.Popup "成功加入GoAgent到启动项", "1234", "GoAgent 对话框", 0
End If


