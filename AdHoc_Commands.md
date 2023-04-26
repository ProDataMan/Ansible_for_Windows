#AdHoc Commands

Ping all Servers in Inventory

```
ansible all -m -i inventory win_ping
```
Ping webservers

```
ansible -i inventory webservers -m win_ping
```

```
ansible localhost -m setup
```

Server Boot Time
```
ansible -i inventory webservers -m win_command -a "systeminfo | findstr /C:\"System Boot Time\""
```
Show Server Up Time

```
ansible -i inventory webservers -m win_command -a "powershell -Command \"(Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime\""
```
