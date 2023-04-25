# Create a new AWS EC2 Ubuntu Instance
1. ### Launch an Amazon EC2 instance running a Linux operating system such as Ubuntu. 
    You can use this instance as your Ansible control node.

2. ### Install Ansible on the Linux instance using the package manager for your operating system. 
    For example, if you're using Ubuntu, you can run the following command:
```
sudo apt-get update
sudo apt-get install ansible
```
3. ### Create an IAM role in AWS that grants permissions to access the Windows Server 2019 instance. 
The role should have permissions to perform the following actions on the Windows Server 2019 instance:

```
Run PowerShell scripts
Install software
Start and stop services
```

Assign the IAM role to the Linux instance that will act as the Ansible control node. 
You can do this by attaching the IAM role to the instance in the AWS Management Console.

4. ### Launch a Windows Server 2019 instance in AWS. Make sure it is in the same VPC as the Linux instance.

5. ### Configure the Windows Server 2019 instance to enable PowerShell remoting by running the following command in a PowerShell session:

```powershell
Enable-PSRemoting -Force
```

6. ### Create a new Ansible playbook or modify an existing one to include tasks that target the Windows Server 2019 instance. 
For example, you can create a playbook called win_iis.yml with the following content:

```yaml
- name: Install IIS on Windows Server 2019
  hosts: windows
  gather_facts: no
  tasks:
    - name: Install IIS
      win_feature:
        name: Web-Server
        state: present
```

7. ### Create an inventory file that includes the Windows Server 2019 instance. For example, you can create a file called inventory with the following content:

```ini
[windows]
<IP address or hostname of the Windows Server 2019 instance>
```
Run the Ansible playbook using the ansible-playbook command. Make sure to specify the inventory file using the -i option. 
For example, you can run the following command to execute the win_iis.yml playbook on the Windows Server 2019 instance:
```ansible
ansible-playbook -i inventory win_iis.yml
```
