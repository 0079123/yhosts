rem 18:02 2018/4/11/����
@ECHO OFF
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows ��������
COLOR 0a

:: 1.����������֣�
::����Զ���޸�ע���
rem Remote Registry:ʹԶ���û����޸Ĵ˼�����ϵ�ע������á�����˷�����ֹ��ֻ�д˼�����ϵ��û������޸�ע�������˷��񱻽��ã��κ��������ķ����޷�������
sc config RemoteRegistry start=DISABLED
::���ô��󱨸�
rem Windows Error Reporting Service:�����ڳ���ֹͣ���л�ֹͣ��Ӧʱ������󣬲������ṩ���н��������������Ϊ��Ϻ��޸�����������־������˷���ֹͣ������󱨸潫�޷���ȷ���У����ҿ��ܲ���ʾ��Ϸ�����޸��Ľ����
sc config WerSvc start=DISABLED
::�����ռ�������Ϣ
rem Performance Logs & Alerts:������־�;�������Ԥ���õļƻ������ӱ��ػ�Զ�̼�����ռ��������ݣ�Ȼ�󽫸�����д����־�򴥷����������ֹͣ�˷��񣬽����ռ�������Ϣ��������ô˷�������ȷ�����������з����޷�������
sc stop pla
sc config pla start= disabled
::����ʹ�������Ϣ���ռ��ʹ���
rem Connected User Experiences and Telemetry:���������õĹ���֧��Ӧ�ó������û���������ӵ��û����顣���⣬����ڡ���������ϡ���������Ϻ�ʹ�������˽ѡ�����ã���˷�����Ը����¼���������Ϻ�ʹ�������Ϣ���ռ��ʹ���(���ڸĽ� Windows ƽ̨�����������)��
rem �ر����ɣ�ÿ��ϵͳ������������ж�дӲ�̹��� ��д���ܱ뵽100% �����������΢�����ڸĽ� Windows ƽ̨������������ġ�
sc stop DiagTrack
sc config DiagTrack start= disabled
::�������ѽ���ϵͳ��Ϸ���
rem Diagnostic Policy Service:��ϲ��Է��������� Windows ����������⡢���ѽ��ͽ������������÷���ֹͣ����Ͻ��������С�
sc stop DPS
sc config DPS start= disabled
rem Diagnostic Service Host:��Ϸ�����������ϲ��Է�������������Ҫ�ڱ��ط��������������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc stop WdiServiceHost
sc config WdiServiceHost start= disabled
rem Diagnostic System Host:���ϵͳ��������ϲ��Է�������������Ҫ�ڱ���ϵͳ�����������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc stop WdiSystemHost
sc config WdiSystemHost start= disabled
rem dmwappushsvc:WAP ����Ϣ·�ɷ���
net stop dmwappushservice > NUL 2>&1
sc config dmwappushservice start= disabled
rem Microsoft (R) ������ı�׼�ռ�������:������ı�׼�ռ�����������ʱ���˷�����ռ�ʵʱ ETW �¼�����������д���
net stop diagnosticshub.standardcollector.service > NUL 2>&1
sc config diagnosticshub.standardcollector.service start= disabled
::����������ʾ����
rem Disables RetailDemo service:���豸����������ʾģʽʱ��������ʾ���񽫿����豸���
net stop RetailDemo > NUL 2>&1
sc config RetailDemo start=disabled
::Data Sharing Service���ṩӦ�ó���֮������ݴ���
sc stop DsSvc
sc config DsSvc start= disabled
::����Superfetch����
rem �ر����ɣ����ܻ���ʱ��ռ�ô�����ϵͳ�ڴ�   Superfetch�������ǽ�����������ڴ���Ϊ����ʹ�õģ������4G���ϵ��ڴ���ȫ���Թرա�
rem �ӳ����� Superfetch ���� sc config "SysMain" start= delayed-auto
sc config SysMain start= disabled
::���ó������������
rem Program Compatibility Assistant Service:�˷���Ϊ�������������(PCA)�ṩ֧�֡�PCA �������û���װ�����еĳ��򣬲������֪���������⡣���ֹͣ�˷���PCA ���޷��������С�
sc stop PcaSvc
sc config PcaSvc start= disabled
::����Windows Search
rem Windows Search��Ϊ�ļ��������ʼ������������ṩ�������������Ի�������������
sc stop WSearch
sc config WSearch start= disabled
del "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" /s > NUL 2>&1
::���ò�ֹͣӲ���Զ����ŷ���
rem Shell Hardware Detection:Ϊ�Զ�����Ӳ���¼��ṩ֪ͨ��
sc stop ShellHWDetection
sc config ShellHWDetection start= disabled
::�ر��Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
::�ر�Security Center��WSCSVC(Windows ��ȫ����)������Ӳ����������ϵİ�ȫ�������á��������ð�������ǽ(��/�ر�)��������(��/�ر�/����)����������(��/�ر�/����)��Windows ����(�Զ�/�ֶ����ز���װ����)���û��ʻ�����(��/�ر�)�Լ� Internet ����(�Ƽ�/���Ƽ�)���÷���Ϊ���������Ӧ���ṩ COM API �Ա���ȫ���ķ���ע�Ტ��¼���Ʒ��״̬����ȫ��ά�� UI ʹ�ø÷����ڡ���ȫ��ά��������������ṩ systray �����Ͱ�ȫ����״����ͼ����ͼ��������ʱ���(NAP)ʹ�ø÷����� NAP ������Է���������ͻ��˵İ�ȫ����״�����Ա�������������ߡ��÷����ṩһ������ API���������ⲿ�ͻ��Ա�̷�ʽ����ϵͳ�ľۺϰ�ȫ����״����
sc stop wscsvc >nul
sc config wscsvc start= disabled>nul 2>nul
::�ر�Windows Defender Advanced Threat Protection Service��Windows Defender �߼���в��������ͨ�����Ӻͱ��������Ϸ����İ�ȫ�¼��������߼���в��
sc stop Sense >nul
sc config Sense start= disabled >nul
::�ر�Windows Defender Antivirus Network Inspection Service��������ֹ�������Э���е���֪���·��ֵ�©�������������ͼ
sc stop WdNisSvc >nul
sc config WdNisSvc start= disabled >nul
::�ر�Windows Defender Antivirus Service�������û���ֹ�������������Ǳ�ڵ����������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
sc stop WinDefend >nul
sc config WinDefend start= disabled >nul
::�ر�Windows Defender Firewall��Windows Defender ����ǽͨ����ֹδ��Ȩ�û�ͨ�� Internet �����������ļ���������������������
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
sc stop mpssvc
sc config mpssvc start= disabled
::�ر�Windows Defender ��ȫ���ķ���
sc stop SecurityHealthService
sc config SecurityHealthService start= disabled
::Geolocation Service���˷��񽫼���ϵͳ�ĵ�ǰλ�ò��������Χ��(���й����¼��ĵ���λ��)���������ô˷���Ӧ�ó����޷�ʹ�û�����йص���λ�û����Χ����֪ͨ��
sc stop lfsvc
sc config lfsvc start= disabled
::Downloaded Maps Manager����Ӧ�ó�����������ص�ͼ�� Windows ���񡣴˷����ɷ��������ص�ͼ��Ӧ�ó��������������ô˷�����ֹӦ�÷��ʵ�ͼ��
sc config MapsBroker start= disabled>nul 2>nul
::ֹͣϵͳ��ԭ�뱸��
net stop SDRSVC

echo    ���ڽ���΢��ң���������ƻ������Ժ򡭡�
SCHTASKS /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetry\AgentFallBack2016" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetry\OfficeTelemetryAgentLogOn2016" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Autochk\Proxy" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\ActivateWindowsSearch" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\ConfigureInternetTimeService" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\DispatchRecoveryTasks" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\ehDRMInit" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\InstallPlayReady" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\mcupdate" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\OCURActivate" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\OCURDiscovery" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\PBDADiscovery" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\PBDADiscoveryW1" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\PBDADiscoveryW2" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\PvrRecoveryTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\PvrScheduleTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\RegisterSearch" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\ReindexSearchRoot" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Media Center\UpdateRecordPath" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /disable>nul 2>nul
SCHTASKS /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable>nul 2>nul
cls
echo.
echo    ΢��ң���������ƻ�������ϣ�



:: 2.�Ҽ��˵��������֣�


::�Ҽ��˵����½���ǿ
reg add "HKCR\.bat" /ve /d "batfile" /f
reg add "HKCR\.bat\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.bat\ShellNew" /v "NullFile" /d "" /f
reg add "HKCR\.cmd" /ve /d "cmdfile" /f
reg add "HKCR\.cmd\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.cmd\ShellNew" /v "NullFile" /d "" /f
reg add "HKCR\lnkfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\InternetShortcut" /v "AlwaysShowExt" /d "" /f
::�����Ҽ��˵����½���Ŀ
reg delete HKEY_CLASSES_ROOT\.bmp\ShellNew /f
reg delete HKEY_CLASSES_ROOT\.rar\ShellNew /f
reg delete HKEY_CLASSES_ROOT\.zip\ShellNew /f
reg delete HKEY_CLASSES_ROOT\.xdp\AcroExch.XDPDoc\ShellNew /f
reg delete HKEY_CLASSES_ROOT\.rtf\ShellNew /f
reg delete HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew /f
rem .Briefcase ���İ�
reg delete HKEY_CLASSES_ROOT\Briefcase\ShellNew /f
rem .jnt �½��ռǱ�
reg delete HKEY_CLASSES_ROOT\.jnt\jntfile\ShellNew /f
rem .contact �½���ϵ�� 
reg delete HKEY_CLASSES_ROOT\.contact\ShellNew /f
::�����Ҽ��˵����Կ���
regsvr32 /u igfxpph.dll /s
regsvr32 /u atiacmxx.dll /s
regsvr32 /u nvcpl.dll /s
reg delete "HKCR\Directory\Background\shellex\ContextMenuHandlers\ACE" /f
reg delete "HKCR\Directory\Background\shellex\ContextMenuHandlers\NvCplDesktopContext" /f
reg delete "HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxDTCM" /f
reg delete "HKCR\Directory\Background\shellex\ContextMenuHandlers\igfxcui" /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeysCmds /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
::�����Ҽ��˵������������ѽ��
reg delete "HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\Compatibility" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f
reg delete "HKEY_CLASSES_ROOT\batfile\ShellEx\ContextMenuHandlers\Compatibility" /f
::�����Ҽ��˵�����ԭ��ǰ�İ汾
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
::�����Ҽ��˵�������������
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /f
::�����Ҽ��˵����������Ȩ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /d "" /f
::�Ҽ��˵�����ü��±���
reg add "HKEY_CLASSES_ROOT\*\shell\Noteped" /ve /d ʹ�ü��±��� /f
reg add "HKEY_CLASSES_ROOT\*\shell\Noteped\command" /ve /d "notepad.exe %%1" /f
::�Ҽ��˵����DLL/OCX�ļ��Ҽ�����(��)ע��
reg add "HKCR\Dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\Dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 /u %%1" /f
reg add "HKCR\Ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\Ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 /u %%1" /f
::�Ҽ��˵����cmd����ͨ��
reg add "HKCR\folder\shell\cmd" /ve /d "�ڴ˴�CMD" /f
reg add "HKCR\folder\shell\cmd\command" /ve /d "cmd.exe /k cd %%1" /f
::�Ҽ�ɾ��-�������ơ�����·�������ơ��ƶ�
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shell\CopyFilePath" /f
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shell\CopyFileName" /f
::�Ҽ�ɾ��SkyDrive Pro
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\SPFS.ContextMenu" /f


:: 3.����������֣�
::��������ʾ �����-��������ҵĵ��ԣ�
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
::��������ʾ �����ļ���-�û����ҵ��ĵ���
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
::��������ʾ ����
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 0
::��������ʾ ����վ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0
::���������� �������
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 1
::ȥ����ݷ�ʽ����
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t REG_BINARY /d 00000000 /f
::ɾ������վ�Ҽ��̶�����ʼ��Ļ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
::��ʾ��֪�ļ���չ��
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
reg add HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
::ȡ�����ļ�����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".bat;.reg;.vbs;.chm;.msi;.cmd;.exe;.js" /f
::�ر�����ͼ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
::���ٷ��ʲ���ʾ�����ļ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f
::����Դ����������ʱ���Զ�������Դ������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /d "1" /t REG_DWORD /f
::������Դ�������Զ�ˢ�¹���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Update" /v "UpdateMode" /d "1" /t REG_DWORD /f
::Ϊ�������Դ������������ͬ�Ľ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /d "1" /t REG_DWORD /f


:: 4.�������������֣�
::��������ʾ���ڼ�
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sLongDate" /d "yyyy'��'M'��'d'��', dddd" /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortDate" /d "yyyy/M/d/ddd" /t REG_SZ /f
::��������ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
::�������е�Cortana����Ϊ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
::ʼ������������ʾ����ͼ���֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d 0 /f
::����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d 1 /f
::��������ռ��ʱ��:���ϲ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f
::��������ʾ��ϵ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
::�������ر�С��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
::�����������������ڡ�����ΪWindows 7ģʽ
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d 0 /f
::�����������ϵİ�����ť
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState\{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d 3 /f
::���������ز�����������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /d 1 /t REG_DWORD /f


:: 5.IE�������
::����IE��ҳ
reg delete "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /f >nul
::����IE��ҳ 
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://www.baidu.com/?tn=baiduhome" /f
::����IE��ҳ
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /d 1 /f >nul
::�ر�SmartscreenӦ��ɸѡ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
::����IE�״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d 1 /f
::���ñ����Զ���ɹ���
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /d "yes" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v AutoSuggest /t REG_SZ /d no /f
::�رն��ѡ�ʱ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "WarnOnClose" /t REG_DWORD /d 0 /f
::����Internet Explorer������
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t REG_DWORD /d 1 /f
::��ͬʱ����������Ŀ������ 10
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 10 /f
::���ý������վ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 1 /f
::�ر��Զ�����
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v NoUpdateCheck /t REG_DWORD /d 1 /f
::�ر�IE����׷�ٹ���(Do Not Track)
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v DoNotTrack /t REG_DWORD /d 0 /f
::������������
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer" /v AllowServicePoweredQSA /t REG_DWORD /d 1 /f
::�رն�λ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v PolicyDisableGeolocation /t REG_DWORD /d 1 /f
::����
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "Use FormSuggest" /t REG_SZ /d no /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "FormSuggest Passwords" /t REG_SZ /d no /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" /v ShowSearchSuggestionsGlobal /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f



:: 6.΢��ƴ�����뷨����ѡ��
::΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
::�ر�΢��ƴ���Ƽ���
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
::�ر�ģ����
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f



:: 7.�ر� Windows 8/8.1/10 Ӧ���̵��Զ���װ�����Ƽ�Ӧ�ú���Ϸ
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
:: �ر����Ͱ�װ����
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f
::����Win10ϵͳ��Ӧ���ƹ㹦��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
if exist "%WinDir%\SysWOW64" reg add "HKCU\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0x00000000" /f >nul
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul
if exist "%WinDir%\SysWOW64" reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f >nul
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" >nul
Start /wait schtasks.exe /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" >nul

:: 8.ϵͳAPPĬ�����������
:: ���±���ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
:: ���±��Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f
::ȥ�������ļ�
powercfg -h off
::Win�뿪ģʽ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v AwayModeEnabled /t REG_DWORD /d 00000001 /f
::��������ɨ��ȴ�ʱ��
chkntfs /t:2
::�ر���ʾ��ǰ�ȴ�ʱ��:�Ӳ�
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
::�ر�DEP %systemroot%\system32\bcdedit.exe /timeout 3
bcdedit /set nx alwaysoff
::�رմ�����Ƭ����ƻ�
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
::��ֹWindows���ʹ��󱨸�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /d 0 /t REG_DWORD /f
::�ر�ϵͳ������ɾ����ԭ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 0 /t REG_DWORD /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /d 1 /t REG_DWORD /f
::��ֹ���м�����Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /d 0 /t REG_DWORD /f
::�رտͻ�������Ƽƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
::���̼�ס�ϴ�NumLock״̬
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /d "2" /f
::�ر�UAC
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 00000000 /f
::ȥ��UACС����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
::�˳�����ʱ�Զ������ڴ��е�DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDll /t REG_DWORD /d 00000001 /f
::ִ�йػ�ʱǿ���˳�Ӧ�ó�����ɱ��̨���ȴ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
::�ӿ�˵���������Ԥ������ʾ�ٶ�
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v MenuShowDelay /d 0 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseHoverTime /d 0 /t REG_SZ /f
::�ر�Զ��Э��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f
::����������
attrib -s -h -r "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\*.*"
attrib -s -h -r "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
attrib -s -h -r "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
del /f /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\*.*"
del /f /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
del /f /q "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*"



:: 10.�������õ��� My Opt
::��ֹ�򿪽ٳ�һЩ�޸���ҳ�ͺ�̨�����ƹ���ļ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345MiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicMiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Downloader_2345Explorer.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HaoZipHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QQPcmgrDownload.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_duba.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_ksafe.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wzdh2345.exe" /v Debugger /t REG_SZ /d "p" /f


cls
gpupdate /force >nul
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
start explorer
exit




::�Ҽ��˵���ӣ���ȡTrustedInstallerȨ��
rem ��ȡTrustedInstallerȨ��
reg add "HKCR\*\shell\runas" /ve /d "��ȡTrustedInstallerȨ��" /f
reg add "HKCR\*\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\Directory\shell\runas" /ve /d "��ȡTrustedInstallerȨ��" /f
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\Directory\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f


