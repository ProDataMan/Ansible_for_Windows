#Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

#winrm set winrm/config/service '@{AllowUnencrypted="true"}'

#New-SelfSignedCertificate -DnsName "localhost" -CertStoreLocation "cert:\LocalMachine\My"

#New-Item -Path WSMan:\localhost\Listener -Transport HTTPS -Address * -CertificateThumbPrint "A3CEA98581B0F98120E0BA1413D9FE2AF0381FD3" -Force

#Enable-PSRemoting -Force

#Create a windows defender firewall inbound rule for ports 5985,5986

#New-NetFirewallRule -DisplayName "Allow Ansible" -Direction Inbound -LocalPort 5985,5986 -Protocol TCP -Action Allow

#Restart-Service winrm
