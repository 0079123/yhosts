@ECHO OFF
rem 14:00 2018/10/16
cd /d "%~dp0"
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows �������
COLOR 0a

:: ����������֣�WinĬ�Ͻ��õķ���AppVClient NetTcpPortSharing ssh-agent RemoteRegistry RemoteAccess shpamsvc tzautoupdate UevAgentService
::����ʹ�������Ϣ���ռ��ʹ���
::Connected User Experiences and Telemetry
sc config DiagTrack start= disabled

::Data Sharing Service
sc config DsSvc start= disabled
::Diagnostic Execution Service
sc config diagsvc start= disabled
::Diagnostic Policy Service
sc config DPS start= disabled
::Diagnostic Service Host
sc config WdiServiceHost start= disabled
::Diagnostic System Host
sc config WdiSystemHost start= disabled
::dmwappushsvc
sc config dmwappushservice start= disabled
::Microsoft (R) ������ı�׼�ռ�������
sc config diagnosticshub.standardcollector.service start= disabled
::Performance Logs & Alerts
sc config pla start= disabled
::Problem Reports and Solutions Control Panel Support
sc config wercplsupport start= disabled
::Windows Error Reporting Service(���󱨸�)
sc config WerSvc start= disabled

::Hyper-V
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
rem sc config xbgm start= demand
rem Xbox Live �����֤������
sc config XblAuthManager start= disabled
rem Xbox Live �������
sc config XboxNetApiSvc start= disabled
rem Xbox Live ��Ϸ����
sc config XblGameSave start= disabled
rem ���� XBOX GameDVR
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f > NUL 2>&1

::Fax
sc config Fax start= disabled
::Distributed Link Tracking Client
sc config TrkWks start= disabled
::Downloaded Maps Manager
sc config MapsBroker start= disabled
::Geolocation Service
sc config lfsvc start= disabled
::Phone Service
sc config PhoneSvc start= disabled
::Program Compatibility Assistant Service
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
sc config PcaSvc start= disabled
::Shell Hardware Detection
sc config ShellHWDetection start= disabled
::Remote Registry(Զ���޸�ע���)
sc config RemoteRegistry start= disabled
::Superfetch
sc config SysMain start= disabled
::Windows Media Player Network Sharing Service
sc config WMPNetworkSvc start= disabled
::Windows Search
taskkill /f /im searchui.exe > NUL 2>&1
sc config WSearch start= disabled
::������ʾ����
sc config RetailDemo start= disabled
::Ƕ��ģʽ
sc config embeddedmode start= disabled

::���ڷ���
sc config QQMusicService start= disabled
sc config QiyiService start= disabled
sc config wpscloudsvr start= disabled

:: ����ƻ�������� %windir%\system32\taskschd.msc /s
::Microsoft �ͻ�������Ƽƻ�
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Autochk\Proxy"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\WindowsActionDialog"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\Notifications"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maintenance\WinSAT"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsToastTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\RetailDemo\CleanupOfflineContent"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\WDI\ResolutionHost"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
::Windows Defender
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
::�������Ż�����Ƭ����
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
::�Զ���������
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"
::XblGameSaveTask
SCHTASKS /Change /Disable /TN "\Microsoft\XblGameSave\XblGameSaveTask"
::Adobe
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%"
::Officeң�����ĺ�̨����
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016"

echo Windows ���������ϣ�
ping -n 3 127.0.0.1>nul
END