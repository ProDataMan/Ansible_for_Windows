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

```
ansible -i inventory webservers -m win_command -a "uptime"
```
