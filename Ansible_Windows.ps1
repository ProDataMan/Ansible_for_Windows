#Get-Item WSMan:\localhost\Listener

#winrm get winrm/config

#winrm get winrm/config/client

#Not necessary for Windows Server 2022 or 2019)

#Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

#winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# Create self-signed certificate
# $cert = New-SelfSignedCertificate -DnsName "localhost" -CertStoreLocation "cert:\LocalMachine\My"

# Get the certificate thumbprint
# $thumbprint = $cert.Thumbprint

# Create a new listener using the certificate thumbprint
# New-Item -Path WSMan:\localhost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $thumbprint -Force

#Enable-PSRemoting -Force

#Create a windows defender firewall inbound rule for ports 5985,5986

#New-NetFirewallRule -DisplayName "Allow Ansible" -Direction Inbound -LocalPort 5985,5986 -Protocol TCP -Action Allow

#Restart-Service winrm
