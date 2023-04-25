Enable-PSRemoting -Force

PowerShell -Version

(Get-Command New-PSSession).ParameterSets.Name

Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

netstat -an | find "5985"

Get-Service -Name winrm

winrm get winrm/config

winrm set winrm/config/service '@{AllowUnencrypted="true"}'



New-SelfSignedCertificate -DnsName "localhost" -CertStoreLocation "cert:\LocalMachine\My"

New-Item -Path WSMan:\localhost\Listener -Transport HTTPS -Address * -CertificateThumbPrint "A3CEA98581B0F98120E0BA1413D9FE2AF0381FD3" -Force

