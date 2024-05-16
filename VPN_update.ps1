$fichier = "fortiClientVPNOnlineInstaller.exe"

if (-not (Test-Path "C:\temp")) {
    New-Item "C:\temp" -ItemType Directory
}

Write-Host "Mise a jour du VPN" -ForegroundColor Yellow

Write-Host "Telechargement du paquet en cours..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://links.fortinet.com/forticlient/win/vpnagent" -OutFile "C:\temp\$fichier"

Write-Host "Installation de la mise a jour..." -ForegroundColor Green
Start-Process C:\temp\$fichier -ArgumentList "/s" -wait

Stop-Process -Name "fortiClientVPNOnlineInstaller.exe"
Start-Process C:\temp\FortiClientVPN.exe -ArgumentList /quiet -wait
Remove-Item -Path "C:\temp\$fichier" -Force -Recurse
