$file = "fortiClientVPNOnlineInstaller.exe"



if (-not (Test-Path "C:\temp")) {
    New-Item "C:\temp" -ItemType Directory
}

Write-Host "VPN Update`n`n" -ForegroundColor Yellow

Write-Host "Downloading the latest package..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://links.fortinet.com/forticlient/win/vpnagent" -OutFile "C:\temp\$file"

Write-Host "Installation..." -ForegroundColor Green
Start-Process C:\temp\$file -ArgumentList "/s" -wait

Stop-Process -Name "fortiClientVPNOnlineInstaller.exe"
Start-Process C:\temp\FortiClientVPN.exe -ArgumentList /quiet -wait
Remove-Item -Path "C:\temp\$file" -Force -Recurse
