


::��������վ�Ҽ����̶�����ʼ��Ļ
reg delete "HKLM\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
::�����ļ������������Ȩ�ޡ�����������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /d "" /f > NUL 2>&1
::�����ļ������������ѽ��
reg delete "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
::�����ļ����̶�����ʼ��Ļ
reg delete "HKCR\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
::�����ļ�������
reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f > NUL 2>&1
::�����ļ�����ԭ��ǰ�İ汾
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
::��������Ŀ¼���ļ��С����ж��󡢵ġ�ʼ���ѻ����á�
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\Offline Files" /f > NUL 2>&1
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Offline Files" /f > NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f > NUL 2>&1
::���������ļ��У�������Bitlocker���Ҽ��˵�
reg delete "HKCR\Drive\shell\encrypt-bde" /f > NUL 2>&1
reg delete "HKCR\Drive\shell\encrypt-bde-elev" /f > NUL 2>&1
::���������ļ��У����̶������ٷ��ʡ�
reg delete "HKCR\Folder\shell\pintohome" /f > NUL 2>&1
::���������ļ��У������������С�
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /f > NUL 2>&1
::����ͼƬ/�����Ҽ��˵��еġ�Windows Media Player��ѡ��
reg delete "HKCR\SystemFileAssociations\audio\shell" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shell" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shell" /f > NUL 2>&1
::�����ļ���ͼƬ��ʹ�û�ͼ3D���б༭
reg delete "HKCR\SystemFileAssociations\.bmp\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\Shell\3D Edit" /f > NUL 2>&1
::�����ļ���ͼƬ������������ת
reg delete "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.psd\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
::�����ļ���ͼ����Ƶ����Ƶ��������ʽ�Ҽ������ŵ��豸
reg delete "HKCR\SystemFileAssociations\image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mkv\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mp4\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.m4v\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1



::���أ�ͼƬ�Ҽ����༭�����ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\image\shell\edit" /v "Extended" /d "" /f
::���أ�ͼƬ�Ҽ�������Ϊ���汳�������ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\.jpg\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.png\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.tif\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.gif\Shell\setdesktopwallpaper" /v "Extended" /d "" /f
::���أ������ļ���ʽ���Ҽ�����ӡ�����ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\image\shell\print" /v "Extended" /d "" /f
reg add "HKCR\batfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\cmdfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\regfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\txtfile\shell\print" /v "Extended" /d "" /f

:: �Ӿ����ҵĵ��ԡ��ļ��С��ļ���Դ�������������֣�

::�ҵĵ���ȡ����ʾ7���ļ���
rem "3D����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > NUL 2>&1
rem "��Ƶ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f > NUL 2>&1
rem "ͼƬ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f > NUL 2>&1
rem "�ĵ�"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f > NUL 2>&1


::���ļ���Դ������ʱ ��Ϊ���ҵĵ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
::�ڱ���������ʾ����·��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f
::���ڡ����ٷ��ʡ�����ʾ���ʹ�õ��ļ���ɾ�����ʼ�¼��
del /f /s /q "%userprofile%\recent\*.*" > NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
::���ڡ����ٷ��ʡ�����ʾ�����ļ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f








::��ֹ �����ظ��ָ�Ĭ������
rem Microsoft.3DBuilder��File Types: .stl, .3mf, .obj, .wrl, .ply, .fbx, .3ds, .dae, .dxf, .bmp, .jpg, .png, .tga
reg add "HKCU\SOFTWARE\Classes\AppXvhc4p7vz4b485xfp46hhk3fq3grkdgjg" /v "NoOpenWith" /d "" /f
rem Microsoft Edge��File Types: .htm, .html
reg add "HKCU\SOFTWARE\Classes\AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9" /v "NoOpenWith" /d "" /f
rem File Types: .pdf
reg add "HKCU\SOFTWARE\Classes\AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" /v "NoOpenWith" /d "" /f
rem File Types: .svg
reg add "HKCU\SOFTWARE\Classes\AppXde74bfzw9j31bzhcvsrxsyjnhhbq66cs" /v "NoOpenWith" /d "" /f
rem File Types: .xml
reg add "HKCU\SOFTWARE\Classes\AppXcc58vyzkbjbs4ky0mxrmxf8278rk9b3t" /v "NoOpenWith" /d "" /f
rem Microsoft Photos File Types: .3g2,.3gp, .3gp2, .3gpp, .asf, .avi, .m2t, .m2ts, .m4v, .mkv, .mov, .mp4, mp4v, .mts, .tif, .tiff, .wmv
reg add "HKCU\SOFTWARE\Classes\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt" /v "NoOpenWith" /d "" /f
rem File Types: Most Image File Types
reg add "HKCU\SOFTWARE\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc" /v "NoOpenWith" /d "" /f
rem File Types: .raw, .rwl, .rw2 and others
reg add "HKCU\SOFTWARE\Classes\AppX9rkaq77s0jzh1tyccadx9ghba15r6t3h" /v "NoOpenWith" /d "" /f
rem Zune Music��File Types: .aac, .adt, .adts ,.amr, .flac, .m3u, .m4a, .m4r, .mp3, .mpa, .wav, .wma, .wpl, .zpl
reg add "HKCU\SOFTWARE\Classes\AppXqj98qxeaynz6dv4459ayz6bnqxbyaqcs" /v "NoOpenWith" /d "" /f
rem Zune Video��File Types: .3g2,.3gp, .3gpp, .avi, .divx, .m2t, .m2ts, .m4v, .mkv, .mod, .mov, .mp4, mp4v, .mpe, .mpeg, .mpg, .mpv2, .mts, .tod, .ts, .tts, .wm, .wmv, .xvid
reg add "HKCU\SOFTWARE\Classes\AppX6eg8h5sxqq90pv53845wmnbewywdqq5h" /v "NoOpenWith" /d "" /f

sc config WSearch start=disabled



net stop WSearch




:: ����������֣�WinĬ�Ͻ��õķ���AppVClient NetTcpPortSharing ssh-agent RemoteRegistry RemoteAccess shpamsvc tzautoupdate UevAgentService
::����ʹ�������Ϣ���ռ��ʹ���
::Connected User Experiences and Telemetry
net stop DiagTrack
sc config DiagTrack start=disabled
echo Data Sharing Service
sc config DsSvc start=disabled
echo Diagnostic Execution Service
sc config diagsvc start=disabled
echo ������Ϸ��� Diagnostic Policy Service
net stop DPS
sc config DPS start=disabled
echo ����Զ���޸�ע���
sc config RemoteRegistry start=disabled
echo ���ó������������ Program Compatibility Assistant Service
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f >nul 2>nul
sc config PcaSvc start=disabled
::Diagnostic Service Host
sc config WdiServiceHost start=disabled
::Diagnostic System Host
sc config WdiSystemHost start=disabled
::dmwappushsvc
sc config dmwappushservice start=disabled
::Microsoft (R) ������ı�׼�ռ�������
sc config diagnosticshub.standardcollector.service start=disabled
::Performance Logs & Alerts
sc config pla start=disabled
::Problem Reports and Solutions Control Panel Support
sc config wercplsupport start=disabled


::Hyper-V
sc config HvHost start=disabled
sc config vmickvpexchange start=disabled
sc config vmicguestinterface start=disabled
sc config vmicshutdown start=disabled
sc config vmicheartbeat start=disabled
sc config vmicvmsession start=disabled
sc config vmictimesync start=disabled
sc config vmicvss start=disabled
sc config vmicrdv start=disabled

::Xbox
rem Xbox Accessory Management Service
sc config XboxGipSvc start=disabled
rem Xbox Game Monitoring
rem sc config xbgm start= demand
rem Xbox Live �����֤������
sc config XblAuthManager start=disabled
rem Xbox Live �������
sc config XboxNetApiSvc start=disabled
rem Xbox Live ��Ϸ����
sc config XblGameSave start=disabled
rem ���� XBOX GameDVR
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f > NUL 2>&1

::Fax
sc config Fax start=disabled
::Distributed Link Tracking Client
sc config TrkWks start=disabled
::Downloaded Maps Manager
sc config MapsBroker start=disabled
::Geolocation Service
sc config lfsvc start=disabled
::Phone Service
sc config PhoneSvc start=disabled


::Shell Hardware Detection
sc config ShellHWDetection start=disabled
::Remote Registry(Զ���޸�ע���)
sc config RemoteRegistry start=disabled
::Superfetch
net stop SysMain
sc config SysMain start=disabled
::Windows Media Player Network Sharing Service
sc config WMPNetworkSvc start=disabled
::Windows Search
taskkill /f /im SearchUI.exe > NUL 2>&1
sc config WSearch start=disabled
::������ʾ����
sc config RetailDemo start=disabled

::���ڷ���
sc config QQMusicService start=disabled > NUL 2>&1
sc config QiyiService start=disabled > NUL 2>&1
sc config wpscloudsvr start=disabled > NUL 2>&1

:: ����ƻ�������� %windir%\system32\taskschd.msc /s
::Microsoft �ͻ�������Ƽƻ�
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
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
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\Notifications"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\WindowsActionDialog"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maintenance\WinSAT"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsToastTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\RetailDemo\CleanupOfflineContent"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\WDI\ResolutionHost"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
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
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%" > NUL 2>&1
::Officeң�����ĺ�̨����
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" > NUL 2>&1

:: ϵͳ ������
::�����͹��ϻָ������������ÿ�������ɨ��ȴ�ʱ��Ϊ1��
chkntfs /t:1
::�����͹��ϻָ������������ÿ�����ʾ����ϵͳ�б�ʱ��2��
bcdedit /timeout 2
::�������ÿ�����F8��ֱ�ӽ��밲ȫģʽ�˵�
bcdedit /set {default} bootmenupolicy legacy

::ϵͳ-��Դ��˯��
::�ر�����
powercfg -h off
::������������
::powercfg -hibernate on
::reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /d 1 /t REG_DWORD /f
::reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /d 1 /t REG_DWORD /f
::���õ�Դ�ƻ��������ܡ�
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
::��ӵ�Դ�ƻ���׿Խ���ܡ���1803�Ժ���Ҫ����ӣ�
::powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
::���õ�Դ�ƻ���׿Խ���ܡ�
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
::������Ļ�Զ��ر�ʱ��Ϊ��5����
powercfg -x -monitor-timeout-ac 5

::����������
attrib -s -h -r "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
attrib -s -h -r "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" 1>nul 2>nul
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.lnk" 1>nul 2>nul
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.lnk" 1>nul 2>nul
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\*.url" 1>nul 2>nul
::������������Զ���desktop.ini
attrib +s +h "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\desktop.ini" 1>nul 2>nul
attrib +s +h "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\desktop.ini" 1>nul 2>nul
::���Ĭ��������
::reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f

TITLE ж�� WindowsApps
::ϵͳ-֪ͨ�Ͳ��������º�������ʾ����ӭʹ��Windows���顱�������ҵ�½ʱͻ����ʾ�������ݺͽ��������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
::ϵͳ-֪ͨ�Ͳ�������ʹ��Windowsʱ��ȡ��ʾ���ɺͽ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
::��ֹ ż���ڿ�ʼ�˵�����ʾ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
::��ֹ �����������ϻ�ȡ��������ʾ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
::��ֹ�Զ���װ��Ϸ��Ӧ��(�ر�Microsoft����������)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
::��ֹ�Զ���װ�Ƽ���Ӧ�ó���(�ر����õĹ�桢��ʾ��Ӧ���Ƽ�)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
::�ر��̵�Ӧ���ƹ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f >nul 2>nul

::�ر� ��δ֪�ļ���ʽʱ ��Ӧ���̵�ѡ������Ӧ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f
:: ʹ�ã�ʱ�������-���������-���Һ͵�����
::����Ϊ �й�
::reg add "HKCU\Control Panel\International\Geo" /v "Nation" /d "45" /f
::reg add "HKCU\Control Panel\International\Geo" /v "Name" /d "CN" /f
::����Ϊ �¼���
::reg add "HKCU\Control Panel\International\Geo" /v "Nation" /d "215" /f >nul 2>nul
::reg add "HKCU\Control Panel\International\Geo" /v "Name" /d "SG" /f >nul 2>nul
::����Ϊ ����
reg add "HKCU\Control Panel\International\Geo" /v "Nation" /d "244" /f >nul 2>nul
reg add "HKCU\Control Panel\International\Geo" /v "Name" /d "US" /f >nul 2>nul

:: ʹ�ã�΢���̵�MetroӦ�� %ProgramFiles%\WindowsApps ɾ����������Desktop App Installer��Store Purchase App��Ǯ����Ӧ���̵꣩   
::Xbox�����֤Ӧ�ã�xbox identity provider https://www.microsoft.com/zh-cn/store/p/xbox-identity-provider/9wzdncrd1hkw
::����ע��ȫ�� PowerShell Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
::�����ǣ�һ��ж�����еĲ���ҪӦ�ã� 
::PowerShell "Get-AppxPackage | Remove-AppxPackage"(��ǰ�û��� 
::Get-AppxPackage -User username | Remove-AppxPackage(�ƶ��û��� 
::Get-AppxPackage -AllUsers | Remove-AppxPackage(�����û���

::�����ж��ָ����Ӧ�ã� 
::Get-AppxPackage *AppName* | Remove-AppxPackage(��ǰ�û���ָ���û��������û�����������Ĵ��룩
::ж���̵�
::PowerShell "get-appxpackage Microsoft.DesktopAppInstaller | remove-appxpackage"
::PowerShell "get-appxpackage Microsoft.StorePurchaseApp | remove-appxpackage"
::PowerShell "get-appxpackage Microsoft.WindowsStore | remove-appxpackage"
::3DBuilder
::PowerShell "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
::��ͼ�Ͳ�ͼ
::PowerShell "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"

call Appx.bat

TITLE ж�� OneDrive
taskkill /f /im OneDrive.exe > NUL 2>&1
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd /s /q "%UserProfile%\OneDrive" > NUL 2>&1
rd /s /q "%LocalAppData%\Microsoft\OneDrive" > NUL 2>&1
rd /s /q "%ProgramData%\Microsoft OneDrive" > NUL 2>&1
rd /s /q "C:\OneDriveTemp" > NUL 2>&1
REG Delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
REG Delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
REG delete "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run" /f > NUL 2>&1
::start %systemroot%\explorer


::�ر�ϵͳ������ɾ����ԭ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /d 1 /t REG_DWORD /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f > NUL 2>&1

:: ϵͳ ������
::����ͼ�껺�� �� 4MB
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /d "4096" /f

::����ʾ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f


:: ϵͳ - ���ºͰ�װ
::���� �豸��������Ĵ���ǩ��
reg add "HKLM\SOFTWARE\Microsoft\Driver Signing" /v "Policy" /t REG_BINARY /d "00" /f
::�ر������Զ����£���ֹ���£�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f
::�ر�ϵͳ�Զ����£��ֶ����£�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f

:: ϵͳ - Զ�����棨�ر�Զ��Э����
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /d 0 /t REG_dword /f

:: ϵͳ - ���ºͰ�ȫ-�����Ż�
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /T REG_DWORD /V "DODownloadMode" /D 0 /F

::�ر� Windows �ͻ�������Ƽƻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
:: ϵͳ - ��˽-WindowsȨ��-����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /T REG_DWORD /V "Enabled" /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /d "1001" /f
:: ϵͳ - ��˽-WindowsȨ��-���棨������վͨ�������ҵ������б����ṩ����������ݣ�
Reg Add "HKCU\Control Panel\International\User Profile" /T REG_DWORD /V "HttpAcceptLanguageOptOut" /D 1 /F
:: ϵͳ - ��˽-WindowsȨ��-ī����д�ͼ�����Ի�
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
:: ϵͳ - ��˽-WindowsȨ��-��Ϻͷ���
Reg Add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "AllowTelemetry" /D 0 /F
:: ϵͳ - ��˽-WindowsȨ��-��Ϻͷ���-����Ƶ��-�Ӳ�
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /d "0" /f
::WLAN ��֪

:: ϵͳ - ��˽-Ӧ��Ȩ��
::�˻���Ϣ
Reg Add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /T REG_DWORD /V "LetAppsAccessAccountInfo" /D 2 /F



:: ʹ�ã�APPע������


::�����洴���������п�ݷ�ʽ if not exist %lnkdir% md %lnkdir%
::set lnkdir="%USERPROFILE%\Desktop"
::echo [InternetShortcut] >%lnkdir%\����ֱ��.url
::echo URL="http://www.cietv.com/live/" >>%lnkdir%\����ֱ��.url
::echo [InternetShortcut] >%lnkdir%\����ֱ��.url
::echo URL="http://tv.cctv.com/live/" >>%lnkdir%\����ֱ��.url
::echo [InternetShortcut] >%lnkdir%\���Ӱ��.url
::echo URL="https://www.mianbao99.com/" >>%lnkdir%\���Ӱ��.url

::ͣ�ðٶȸ��Ի����ù������� ��ʷ��¼������Ҫ��½��https://www.baidu.com/duty/privacysettings.html
::start iexplore.exe https://www.baidu.com/duty/safe_control.html

::�Դ�����ǽAPP����
::BCompare
::netsh advfirewall firewall add rule name="BCompare" dir=out program="C:\Program Files\Beyond Compare 4\BCompare.exe" action=block

cls
echo ���²���
gpupdate /force 
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
ping -n 3 127.0.0.1>nul
rem �ر�explorer.exe
taskkill /f /im explorer.exe > NUL 2>&1
rem ����ϵͳͼ�껺�����ݿ�
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
del /f "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*" > NUL 2>&1
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db" > NUL 2>&1
rem ���� ϵͳ���̼����ͼ��
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams > NUL 2>&1
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream > NUL 2>&1
rem ��explorer
start explorer
pause

::OEM��Ϣ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Manufacturer" /d "Sky Eiga Inc." /f
copy /y "%~dp0OEMLOGO.bmp" "%SystemRoot%\System32"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "logo" /d "C:\Windows\System32\OEMLOGO.bmp" /f
net config server /srvcomment:"�ҵĹ���վ"
::reg add HKLM\SYSTEM\ControlSet001\Services\LanmanServer\Parameters /v srvcomment /t REG_SZ /d "�ҵĵ���"
::ASUS
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model" /d "ASUS TUF X470-PLUS + SAPPHIRE RX580 8G D5 + KLEVV DDR4 2800(3000)" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportPhone" /d "ASUS  400-620-6655" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /d "https://www.asus.com.cn/supportonly/TUF X470-PLUS GAMING/HelpDesk_Download/" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportHours" /d "ASUS  00:00  -  24:00   /  ��һ������" /f
pause
::MSI-OEM��Ϣ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Model" /d "Intel i7-7700 + GTX 1060 6GB GDDR5 + 16G DDR4 2133HMz" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportPhone" /d "MSI  400-828-8588" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportURL" /d "https://cn.msi.com/Desktop/support/Trident-3/" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" /v "SupportHours" /d "MSI  9:00   -   18:00   /  ��һ������" /f
exit
