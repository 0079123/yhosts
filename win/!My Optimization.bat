@ECHO OFF
rem 17:02 2018/7/11
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 ��������
COLOR 0a

:: ��ռ�����
mshta vbscript:clipboardData.SetData("text","")(close)

:: 1.����������֣�
::����ʹ�������Ϣ���ռ��ʹ���
rem Connected User Experiences and Telemetry:���������õĹ���֧��Ӧ�ó������û���������ӵ��û����顣���⣬����ڡ���������ϡ���������Ϻ�ʹ�������˽ѡ�����ã���˷�����Ը����¼���������Ϻ�ʹ�������Ϣ���ռ��ʹ���(���ڸĽ� Windows ƽ̨�����������)��
rem �ر����ɣ�ÿ��ϵͳ������������ж�дӲ�̹��� ��д���ܱ뵽100% �����������΢�����ڸĽ� Windows ƽ̨������������ġ�
sc config DiagTrack start= disabled
::Data Sharing Service:�ṩӦ�ó���֮������ݴ���
sc config DsSvc start= disabled
::�������ѽ���ϵͳ��Ϸ���
rem Diagnostic Execution Service:Executes diagnostic actions for troubleshooting support
sc config diagsvc start= disabled
rem Diagnostic Policy Service:��ϲ��Է��������� Windows ����������⡢���ѽ��ͽ������������÷���ֹͣ����Ͻ��������С�
sc config DPS start= disabled
rem Diagnostic Service Host:��Ϸ�����������ϲ��Է�������������Ҫ�ڱ��ط��������������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc config WdiServiceHost start= disabled
rem Diagnostic System Host:���ϵͳ��������ϲ��Է�������������Ҫ�ڱ���ϵͳ�����������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc config WdiSystemHost start= disabled
rem Microsoft (R) ������ı�׼�ռ�������:������ı�׼�ռ�����������ʱ���˷�����ռ�ʵʱ ETW �¼�����������д���
sc config diagnosticshub.standardcollector.service start= disabled
::�����ռ�������Ϣ
rem Performance Logs & Alerts:������־�;�������Ԥ���õļƻ������ӱ��ػ�Զ�̼�����ռ��������ݣ�Ȼ�󽫸�����д����־�򴥷����������ֹͣ�˷��񣬽����ռ�������Ϣ��������ô˷�������ȷ�����������з����޷�������
sc config pla start= disabled

::Hyper-V
sc config AppVClient start= disabled
sc config HvHost start= disabled
sc config vmickvpexchange start= disabled
sc config vmicguestinterface start= disabled
sc config vmicshutdown start= disabled
sc config vmicheartbeat start= disabled
sc config vmicvmsession start= disabled
sc config vmictimesync start= disabled
sc config vmicvss start= disabled
sc config vmicrdv start= disabled

::Xbox
rem Xbox Accessory Management Service
sc config XboxGipSvc start= disabled
rem Xbox Game Monitoring
net stop xbgm
sc config xbgm start= disabled
rem Xbox Live �����֤������
sc config XblAuthManager start= disabled
rem Xbox Live �������
sc config XboxNetApiSvc start= disabled
rem Xbox Live ��Ϸ����
sc config XblGameSave start= disabled

::�ر�Windows Defender��ط���
rem �ر�Windows Defender Antivirus Network Inspection Service:������ֹ�������Э���е���֪���·��ֵ�©�������������ͼ
net stop WdNisSvc > NUL 2>&1
rem �ر�Windows Defender Antivirus Service:�����û���ֹ�������������Ǳ�ڵ����������
net stop WinDefend > NUL 2>&1
rem �ر�Windows Defender Advanced Threat Protection Service:Windows Defender �߼���в��������ͨ�����Ӻͱ��������Ϸ����İ�ȫ�¼��������߼���в��
sc stop Sense > NUL 2>&1
net stop Sense > NUL 2>&1


::���� WAP ����Ϣ·�ɷ���
rem dmwappushsvc:WAP ����Ϣ·�ɷ���
sc config dmwappushservice start= disabled
::���õ�ͼ���ط���
rem Downloaded Maps Manager:��Ӧ�ó�����������ص�ͼ�� Windows ���񡣴˷����ɷ��������ص�ͼ��Ӧ�ó��������������ô˷�����ֹӦ�÷��ʵ�ͼ��
sc config MapsBroker start= disabled
:: ���ô������ 
rem Fax ���ü�����������ϵĿ��ô�����Դ���ͺͽ��մ��档
sc config Fax start= disabled
::���ö�λ����
rem Geolocation Service:�˷��񽫼���ϵͳ�ĵ�ǰλ�ò��������Χ��(���й����¼��ĵ���λ��)���������ô˷���Ӧ�ó����޷�ʹ�û�����йص���λ�û����Χ����֪ͨ��
sc config lfsvc start= disabled
::���õ绰����
rem Phone Service ���豸�Ϲ���绰����״̬
sc config PhoneSvc start= disabled
::���ó������������
rem Program Compatibility Assistant Service:�˷���Ϊ�������������(PCA)�ṩ֧�֡�PCA �������û���װ�����еĳ��򣬲������֪���������⡣���ֹͣ�˷���PCA ���޷��������С�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f > NUL 2>&1
sc config PcaSvc start= disabled
::����Զ���޸�ע���
rem Remote Registry:ʹԶ���û����޸Ĵ˼�����ϵ�ע������á�����˷�����ֹ��ֻ�д˼�����ϵ��û������޸�ע�������˷��񱻽��ã��κ��������ķ����޷�������
sc config RemoteRegistry start= disabled
::������������
rem Shared PC Account Manager:Manages profiles and accounts on a SharedPC configured device
sc config shpamsvc start= disabled
::���ò�ֹͣӲ���Զ����ŷ���
rem Shell Hardware Detection:Ϊ�Զ�����Ӳ���¼��ṩ֪ͨ��
sc config ShellHWDetection start= disabled
::���ô������ռ�
rem Sensor Service һ�����ڹ�����ִ������Ĺ��ܵĴ��������񡣹��������ļ��豸����(SDO)����ʷ��¼�����ض��豸����仯���б���� SDO �����������ֹͣ������˴˷����򽫲������ SDO ����������˲��ᷢ���Զ���ת�����Դ���������ʷ��¼�ռ�Ҳ��ֹͣ��
sc config SensorService start= disabled
::����Superfetch����
rem Superfetch:�ر�����:���ܻ���ʱ��ռ�ô�����ϵͳ�ڴ�   Superfetch�������ǽ�����������ڴ���Ϊ����ʹ�õģ������4G���ϵ��ڴ���ȫ���Թرա�rem �ӳ����� Superfetch ���� sc config SysMain start= delayed-auto
sc config SysMain start= disabled
::���ô��󱨸�
rem Windows Error Reporting Service:�����ڳ���ֹͣ���л�ֹͣ��Ӧʱ������󣬲������ṩ���н��������������Ϊ��Ϻ��޸�����������־������˷���ֹͣ������󱨸潫�޷���ȷ���У����ҿ��ܲ���ʾ��Ϸ�����޸��Ľ����
sc config WerSvc start= disabled
::����WMP����
rem Windows Media Player Network Sharing Serviceʹ��ͨ�ü��弴���豸���������粥�Ż���ý���豸���� Windows Media Player ý���
sc config WMPNetworkSvc start= disabled
::����Windows Search
rem Windows Search:Ϊ�ļ��������ʼ������������ṩ�������������Ի�������������
sc config WSearch start= disabled
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb" /s > NUL 2>&1
::����ʱ��ͬ��
rem Windows Time:ά���������ϵ����пͻ��˺ͷ�������ʱ�������ͬ��������˷���ֹͣ��ʱ������ڵ�ͬ���������á�����˷��񱻽��ã��κ���ȷ�������ķ��񶼽�����������
sc config W32Time start= disabled
::����������ʾ����
rem ������ʾ����:���豸����������ʾģʽʱ��������ʾ���񽫿����豸���
sc config RetailDemo start= disabled


::��ûʲô�õķ���
rem AllJoyn Router Service:·�ɱ��� AllJoyn �ͻ��˵� AllJoyn ��Ϣ�����ֹͣ�˷���������û������·������ AllJoyn �ͻ��˽��޷����С�
sc config AJRouter start= disabled
::����UevAgentService
rem User Experience Virtualization Service:ΪӦ�ó���� OS ���������ṩ֧��
sc config UevAgentService start= disabled
::���õ���Ǯ��
rem WalletService:����Ǯ���ͻ���ʹ�õ���������
sc config WalletService start= disabled
::��������ʹ����
rem ����ʹ����:��������ʹ�������������ޣ����Ʊ������ݣ��������Ʒѵ����硣
sc config DusmSvc start= disabled
::�������ߵ�������
rem ���ߵ����ͷ���ģʽ����
sc config RmSvc start= disabled

::����ϵͳ��ԭ�뱸��
::sc config SDRSVC start= disabled
::������ҵ·�ɷ��񣨻ᵼ�²���У԰���޷�ʹ�ã�
rem Routing and Remote Access:�ھ������Լ�������������Ϊ��ҵ�ṩ·�ɷ���
::sc config RemoteAccess start= disabled

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