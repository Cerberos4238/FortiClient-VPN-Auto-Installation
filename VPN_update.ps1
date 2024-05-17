$file = "fortiClientVPNOnlineInstaller.exe"
$DwlPath = "C:\temp\$file"
$vpnexec = "C:\Program Files\Fortinet\FortiClient\FortiClient.exe"


if (-not (Test-Path "C:\temp")) {
    New-Item "C:\temp" -ItemType Directory
}

Write-Host "VPN Update`n" -ForegroundColor Yellow

try {
    Write-Host "Downloading the latest package..." -ForegroundColor Green
    Invoke-WebRequest -Uri "https://links.fortinet.com/forticlient/win/vpnagent" -OutFile $DwlPath -ErrorAction SilentlyContinue

    Write-Host "Installation...`n" -ForegroundColor Green

if (-not (Test-Path $vpnexec)) {
    try {
        Start-Process $DwlPath -ArgumentList /quiet -wait -ErrorAction SilentlyContinue
        Write-Host "Installation Complete`n" -ForegroundColor Green
        Remove-Item -Path $DwlPath -Force -Recurse -ErrorAction SilentlyContinue
        exit
    } catch {
            Write-Host "An error has occured. The program has to close prematurely`n" -ForegroundColor Red
            Start-Sleep -Seconds 1
            Write-Host "Goodbye!" -ForegroundColor Yellow
            Remove-Item -Path $DwlPath -Force -Recurse -ErrorAction SilentlyContinue
            throw
    }
} else {
        Write-Host "Vpn is already installed. No installation needed`n" -ForegroundColor Yellow 
        Start-Sleep -Seconds 1
        Write-Host "Goodbye!" -ForegroundColor Yellow
        Remove-Item -Path $DwlPath -Force -Recurse -ErrorAction SilentlyContinue
        exit
}} 
catch {
        Write-Host "An error has occured. The program has to close prematurely`n" -ForegroundColor Red
        Start-Sleep -Seconds 1
        Write-Host "Goodbye!" -ForegroundColor Yellow
        Remove-Item -Path $DwlPath -Force -Recurse -ErrorAction SilentlyContinue
        exit
}
