# Create a new AWS EC2 Ubuntu Instance
1. ### Launch an Amazon EC2 instance running a Linux operating system such as Ubuntu. 
    You can use this instance as your Ansible control node.

2. ### Install Ansible on the Linux instance using pip. 
    For example, if you're using Ubuntu, you can run the following command:

```
sudo apt-get update
```

Install Python

```
sudo apt-get install -y python3-pip
```

Install Ansible using pip3
```
pip3 install ansible
```

Install Win RM
```
pip3 install "pywinrm>=0.3.0"
```

Install boto3 and botocore

```
pip3 install boto3 botocore
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

Inventory in ini format
In ini format all host attributes for each individual host must be on a single 
``` ini
[webservers]
winserver ansible_host=<PUBLIC_IP_ADDRESS> ansible_user=Administrator ansible_password=JustM300 ansible_connection=winrm ansible_winrm_transport=ntlm ansible_winrm_server_cert_validation=ignore
```

Inventory in yaml format
In yaml format each host attribute can be on its own line making the attributes more human readable
```yanl
webservers:
  hosts:
    webserver:
      ansible_host: 13.57.29.93
      ansible_user: Administrator
      ansible_password: JustM300
      ansible_connection: winrm
      ansible_winrm_transport: ntlm
      ansible_winrm_server_cert_validation: ignore
```
Run the Ansible playbook using the ansible-playbook command. Make sure to specify the inventory file using the -i option. 
For example, you can run the following command to execute the win_iis.yml playbook on the Windows Server 2019 instance:

```ansible
ansible-playbook -i inventory win_iis.yml
```
Update the Ansible Cofiguration to use the new Inventory.yml by default
```
	[defaults]
	  INVENTORY = inventory.yml
```
Dynamic Inventory
```
ansible-playbook -i inventory DynamicInventory.yml
```
Get AWS EC2 Instances
```
ANSIBLE_STDOUT_CALLBACK=yaml 
```
Create vault/credentials.yml file in the vault direcotry
```
windows_user: Administrator
windows_password: JustM300

```
encrypt creditials.yml in the vault directory

```
ansible-vault encrypt vault/credentials.yml
```

update the inventory file and replace the ansible_user and ansible_password lines with a referecen to the vault

```
          ansible_user: "{{ vault_windows_user }}"
          ansible_password: "{{ vault_windows_password }}"
```
Create a vault_pass file in the vault directory and add a single line to the file with the vault password ILoveAnsible
```
ILoveAnsible

```

Execute playbook using vault credentials

```
ansible-playbook AddWebFiles.yml --ask-vault-pass
```

Update the ansible cfg file to include the path to the vault_pass file
```
	[defaults]
	  INVENTORY = inventory.yml
  	  vault_password_file = ~/vault/vault_pass
```
