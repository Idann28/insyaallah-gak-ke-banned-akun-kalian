@echo off

del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul
net config server /srvcomment:"Windows Server 2019 By Oshekher" >nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user administrator @HarChanel /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul

echo Successfully Installed! If the RDP is Dead, Please Rebuild Again!
echo IP:
tasklist | find /i "lt.exe" >nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Tidak bisa mendapatkan Localtunnel, pastikan subdomain dan instalasi Localtunnel berjalan dengan benar. Mungkin VM Anda sebelumnya masih berjalan."
echo Username: administrator
echo Password: @HarChanel
echo Silahkan Login Ke RDP Anda!!

ping -n 10 127.0.0.1 >nul
