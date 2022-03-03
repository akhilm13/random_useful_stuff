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
    If isActimageWifi() = 0 Then 
        NoProxy
        status = "Proxy disabled"
    Else
        Proxy
        status = "Proxy enabled"
    End If
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

'Function to get the SSID of the wifi that is connected
Function isActimageWiFi()
    Const WshRunning = 0
    Const WshFailed = 1
    
    'Use netsh to get the SSID of the WiFi connected
    Set WshShellExec = WshShell.Exec("cmd.exe /q /C netsh wlan show interface name=""Wi-Fi"" | findstr ""SSID""")
    
    'Wait till the command is finished
    While WshShellExec.Status = WshRunning
        WScript.Sleep 50    
    Wend

    Dim output
    output = 0

    'If there were errors, output is 0
    If WshShellExec.ExitCode = WshFailed Then
        output = 0
    Else
        Dim outputs 
        outputs = Split(WshShellExec.StdOut.ReadAll,":") 
        'Check if the SSID has Actimage Wifi Network
        If UBound(outputs) > 1 Then
            If InStr(1, Trim(outputs(1)), "Actimage WiFi Network") = 1 Then
                output =  1
            Else
                output = 0
            End If
        End If
    End If
    isActimageWiFi = output 
End Function
