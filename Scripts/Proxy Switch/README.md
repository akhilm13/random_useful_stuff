# Proxy Switch

This contains a cmd file to create a task scheduler in Windows to run a VBS script that enables the system proxy when you connect to LAN (any LAN) and disables it when you connect to a WiFi network. It also updates the git config with the proxy if you have git bash installed with Windows (it should be in the environment variable for this to work). Specific network identification is possible too but this is currently not done. I'll probably update it in the future. Note that the trigger is only when the system is connected to a network (the script does not care about disconnection from a network).

### Update 
The script was updated to detect if you connect specifically to the Actimage WIFI. If the name of the WiFi is "Actimage WiFi Network", it will be treated just like the LAN (as in, proxies will be enabled). For other WiFi, it will be disabled. 

## Usage
- Right click on the _switchProxy.cmd_ and choose _Run as Administrator_. 
- The system will prompt you for a password. Enter your password and press enter. 
- A message will confirm that the task has been succesfully created. 

```diff
+ Quick Tip: The vbs script can be run simply by double clicking on it. If you don't want to setup an automated task, simply run the script everytime you change network to enable or disable proxy based on if you're connected to WiFi or LAN
```
## Deleting

You can delete the task thas was created by running the deleteTask.cmd as an Administrator (right click on the file and select _Run as Administrator_)


## Viewing/Editing/Deleting Tasks in the Task Scheduler

The task can be managed in Windows Task Scheduler (simply search for _Task Scheduler_ in the Start menu). You should be able to see a folder named _ProxySwitch_ under _Task Schduler Library_. Clicking on this will show you the task and all associated details in the main window. You can disable, edit or delete the task from here.  

