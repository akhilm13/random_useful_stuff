@echo off
setlocal enabledelayedexpansion
REM GET SID
for /f "delims= " %%a in ('"wmic path win32_useraccount where name='%UserName%' get sid"') do (
   if not "%%a"=="SID" (          
      set SID=%%a
      goto :loop_end
   )   
)

:loop_end

REM Generate XML file for task
echo ^<?xml version="1.0" encoding="UTF-16"?^> ^<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^> ^<RegistrationInfo^> ^<Date^>2021-03-04T15:23:02.0082579^</Date^> ^<Author^>!computername!\!username!^</Author^> ^<Description^>Enable or disable proxy based on if you connect to a LAN network or Wi-Fi^</Description^> ^<URI^>\ProxyEvent\Switch Proxy^</URI^> ^</RegistrationInfo^> ^<Triggers^> ^<EventTrigger^> ^<Enabled^>true^</Enabled^> ^<Subscription^>^&lt;QueryList^&gt;^&lt;Query Id="0" Path="Microsoft-Windows-NetworkProfile/Operational"^&gt;^&lt;Select Path="Microsoft-Windows-NetworkProfile/Operational"^&gt;*[System[Provider[@Name='Microsoft-Windows-NetworkProfile'] and EventID=10000]]^&lt;/Select^&gt;^&lt;/Query^&gt;^&lt;/QueryList^&gt;^</Subscription^> ^</EventTrigger^> ^</Triggers^> ^<Principals^> ^<Principal id="Author"^> ^<UserId^>!SID!^</UserId^> ^<LogonType^>S4U^</LogonType^> ^<RunLevel^>LeastPrivilege^</RunLevel^> ^</Principal^> ^</Principals^> ^<Settings^> ^<MultipleInstancesPolicy^>StopExisting^</MultipleInstancesPolicy^> ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^> ^<StopIfGoingOnBatteries^>true^</StopIfGoingOnBatteries^> ^<AllowHardTerminate^>true^</AllowHardTerminate^> ^<StartWhenAvailable^>false^</StartWhenAvailable^> ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^> ^<IdleSettings^> ^<StopOnIdleEnd^>true^</StopOnIdleEnd^> ^<RestartOnIdle^>false^</RestartOnIdle^> ^</IdleSettings^> ^<AllowStartOnDemand^>true^</AllowStartOnDemand^> ^<Enabled^>true^</Enabled^> ^<Hidden^>false^</Hidden^> ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^> ^<DisallowStartOnRemoteAppSession^>false^</DisallowStartOnRemoteAppSession^> ^<UseUnifiedSchedulingEngine^>true^</UseUnifiedSchedulingEngine^> ^<WakeToRun^>false^</WakeToRun^> ^<ExecutionTimeLimit^>PT1H^</ExecutionTimeLimit^> ^<Priority^>7^</Priority^> ^</Settings^> ^<Actions Context="Author"^> ^<Exec^> ^<Command^>C:\Windows\System32\cscript.exe^</Command^> ^<Arguments^>proxyswitch.vbs^</Arguments^> ^<WorkingDirectory^>%~dp0^</WorkingDirectory^> ^</Exec^> ^</Actions^> ^</Task^> >ProxySwitch.xml

schtasks /create /xml "%CD%\ProxySwitch.xml" /tn "\ProxySwitch\SwitchProxy" /ru "%computername%\%username%"

echo You should recieve a task created succesfully message above if this was succesful ^(too lazy to check for error codes^). Press any key to exit.
pause > nul
