' Initial stuff to get Network stuff
strComputer = "."
Set objWMIService = GetObject(_
    "winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * From Win32_NetworkConnection")
Set WSHShell = CreateObject("WScript.Shell")


ethernet = False
wifi = False

'Get networks and check if WiFi is being used
For Each oAdapter In objWMIService.InstancesOf("Win32_NetworkAdapter")
    If (oAdapter.NetConnectionStatus = 2) Then
        If (oAdapter.NetConnectionId = "Wi-Fi") Then
            wifi = True
        End If
        If (oAdapter.NetConnectionId = "Ethernet") Then
            ethernet = True
        End If
    End If
Next

status = ""
If (ethernet = True AND wifi = False) Then 
    Proxy
    status = "Proxy enabled"
Else 
    NoProxy
    status = "Proxy disabled"
End If

'Subroutine to Toggle Proxy Setting to ON
Sub Proxy
'Comment the below line if you don't want to change system proxy settings
'WSHShell.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable", 1, "REG_DWORD"
WSHShell.run "cmd.exe /q /C git config --global http.proxy http://logan.actimage.int:80 & git config --global https.proxy http://logan.actimage.int:80"
End Sub

'Subroutine to Toggle Proxy Setting to OFF
Sub NoProxy
'Comemnt the below line if you don't want to change system proxy settings
'WSHShell.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable", 0, "REG_DWORD"
WSHShell.run "cmd.exe /q /C git config --global --unset http.proxy & git config --global --unset https.proxy"
End Sub
