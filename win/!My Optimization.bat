@ECHO OFF
rem 17:02 2018/7/11
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 ��������
COLOR 0a


echo    ���ڽ���΢��ң���������ƻ������Ժ򡭡�
SCHTASKS /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /disable
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Autochk\Proxy" /disable
SCHTASKS /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /disable
SCHTASKS /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable
SCHTASKS /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /disable
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
cls
echo.
echo    ΢��ң���������ƻ�������ϣ�


:: 4.��ȫ��ά��������ã�
::�ر�UAC
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 00000000 /f
::�ر�UACС����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
::�رմ�  ����  �ļ��ġ���ȫ���桱
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".7z;.cab;.bat;.chm;.cmd;.exe;.js;.msi;.rar;.reg;.vbs;.zip" /f
::�رմ� ������ �ļ��ġ���ȫ���桱��Internetѡ�����Ӧ�ó���Ͳ���ȫ�ļ�ʱ����ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f
::��δ��װͨ��΢��ע���ɱ�������¹ر�Windows Security Center
echo 1���������ҳ��������������в���������رա�ʵʱ��������
reg add "HKLM\SOFTWARE\Microsoft\Security Center\Feature" /v "DisableAvCheck" /t REG_DWORD /d 1 /f
::�ر�Windows Defender Antivirus Service�������û���ֹ�������������Ǳ�ڵ����������(Windows Defender ��Ϊ�ֶ�����)
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v WindowsDefender /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SecurityHealth /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /d 1 /t REG_DWORD /f
taskkill /f /im MSASCuil.exe
::�ر�Windows Defender Firewall��Windows Defender ����ǽͨ����ֹδ��Ȩ�û�ͨ�� Internet �����������ļ���������������������
sc config MpsSvc start=disabled >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
::�ر��Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
::�ر���Ƭ������Ż�������
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" > NUL 2>&1


::���ص����� ���� OneDrive  Windows10 �Դ�����
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
::ɾ��OneDrive
taskkill /f /im OneDrive.exe
taskkill /f /im explorer.exe
if exist %SYSTEMROOT%\SysWOW64\OneDriveSetup.exe (
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
) else (
%SYSTEMROOT%\System32\OneDriveSetup.exe /uninstall
)
rd  /s /q "%USERPROFILE%\OneDrive"
rd  /s /q "%LOCALAPPDATA%\Microsoft\OneDrive"
rd  /s /q "%PROGRAMDATA%\Microsoft OneDrive"
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
start explorer





:: 10.��Դ����
::��������
powercfg -h on
::�������ļ�ֱ��ѹ�����ڴ���������ͣ�����40%
powercfg -h size 40
::������Ļ�Զ��ر�ʱ��Ϊ��5����
powercfg -x -monitor-timeout-ac 5
powercfg -x -monitor-timeout-dc 5
::������Ļ�رպ��ֹ�ر�Ӳ��
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0
::����15���Ӻ�˯��
powercfg -x -standby-timeout-ac 15
powercfg -x -standby-timeout-dc 15
::˯�ߺ��ֹ����
powercfg -x -hibernate-timeout-ac 0
powercfg -x -hibernate-timeout-dc 0
::������������
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /d 1 /t REG_DWORD /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /d 1 /t REG_DWORD /f

:: 11.ϵͳ���ԣ������͹��ϻָ�
::���������ÿ�������ɨ��ȴ�ʱ��Ϊ2��
chkntfs /t:2
::���������ÿ�����ʾ����ϵͳ�б�ʱ��3�� %systemroot%\system32\bcdedit.exe /timeout 3
bcdedit /timeout 3
::ϵͳʧ�ܣ�д�������Ϣ����ֹ�ڴ�ת��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /d 0 /t REG_DWORD /f
::ϵͳʧ�ܣ���ֹ���¼�д��ϵͳ��־
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "LogEvent" /d 0 /t REG_DWORD /f
::����ϵͳ��־
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_DWORD /f
::�����˺ŵ�¼��־����
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /d "0" /f
::����WfpDiag.ETL��־
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE\Parameters\Policy\Options" /v "CollectNetEvents" /d 0 /t REG_DWORD /f
::���������ջ��Component Based Servicing���ļ�����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Configuration" /v "DisableComponentBackups" /d 1 /t REG_DWORD /f
:: 11.ϵͳ���ԣ�ϵͳ��ԭ
::�ر�ϵͳ������ɾ����ԭ��
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /d 1 /t REG_DWORD /f
:: 11.ϵͳ���ԣ��ر�Զ��Э��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f

::�ر�ϵͳ�Զ����£��ֶ����£�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f



:: 14.
::����������������ǩ����֤��
bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS
bcdedit /set TESTSIGNING ON
::����������������ǩ����֤��
::bcdedit /set loadoptions DENABLE_INTEGRITY_CHECKS
::bcdedit /set TESTSIGNING OFF

:: 15.APPע������
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "UserName" /d "����" /f
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "Registration" /d "67693a0a733a6e6c111c4e06733c6b1f" /f

reg add "HKCU\Software\WinRAR\Profiles\0" /v "RAR5" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\WinRAR\Profiles\0" /v "Default" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\WinRAR\General\Toolbar" /v "Lock" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\WinRAR\General\Toolbar" /v "Size" /t REG_DWORD /d 3 /f


echo ���²���
gpupdate /force 
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
ping -n 3 127.0.0.1>nul
cls
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
rem start explorer
exit