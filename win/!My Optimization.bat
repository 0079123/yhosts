rem ver: 21:43 2018/4/27/����
@ECHO OFF
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 ��������
COLOR 0a

:: ��ռ�����
mshta vbscript:clipboardData.SetData("text","")(close)

:: 1.����������֣�
::����Զ���޸�ע���
rem Remote Registry:ʹԶ���û����޸Ĵ˼�����ϵ�ע������á�����˷�����ֹ��ֻ�д˼�����ϵ��û������޸�ע�������˷��񱻽��ã��κ��������ķ����޷�������
sc config RemoteRegistry start= disabled
::���ô��󱨸�
rem Windows Error Reporting Service:�����ڳ���ֹͣ���л�ֹͣ��Ӧʱ������󣬲������ṩ���н��������������Ϊ��Ϻ��޸�����������־������˷���ֹͣ������󱨸潫�޷���ȷ���У����ҿ��ܲ���ʾ��Ϸ�����޸��Ľ����
sc config WerSvc start= disabled
::�����ռ�������Ϣ
rem Performance Logs & Alerts:������־�;�������Ԥ���õļƻ������ӱ��ػ�Զ�̼�����ռ��������ݣ�Ȼ�󽫸�����д����־�򴥷����������ֹͣ�˷��񣬽����ռ�������Ϣ��������ô˷�������ȷ�����������з����޷�������
sc stop pla > NUL
sc config pla start= disabled
::����ʹ�������Ϣ���ռ��ʹ���
rem Connected User Experiences and Telemetry:���������õĹ���֧��Ӧ�ó������û���������ӵ��û����顣���⣬����ڡ���������ϡ���������Ϻ�ʹ�������˽ѡ�����ã���˷�����Ը����¼���������Ϻ�ʹ�������Ϣ���ռ��ʹ���(���ڸĽ� Windows ƽ̨�����������)��
rem �ر����ɣ�ÿ��ϵͳ������������ж�дӲ�̹��� ��д���ܱ뵽100% �����������΢�����ڸĽ� Windows ƽ̨������������ġ�
sc stop DiagTrack > NUL
sc config DiagTrack start= disabled
::�������ѽ���ϵͳ��Ϸ���
rem Diagnostic Policy Service:��ϲ��Է��������� Windows ����������⡢���ѽ��ͽ������������÷���ֹͣ����Ͻ��������С�
sc stop DPS > NUL
sc config DPS start= disabled
rem Diagnostic Service Host:��Ϸ�����������ϲ��Է�������������Ҫ�ڱ��ط��������������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc stop WdiServiceHost > NUL
sc config WdiServiceHost start= disabled
rem Diagnostic System Host:���ϵͳ��������ϲ��Է�������������Ҫ�ڱ���ϵͳ�����������е���ϡ����ֹͣ�÷����������ڸ÷�����κ���Ͻ��������С�
sc stop WdiSystemHost > NUL
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
sc config RetailDemo start= disabled
::Data Sharing Service���ṩӦ�ó���֮������ݴ���
sc stop DsSvc > NUL
sc config DsSvc start= disabled
::����Superfetch����
rem �ر����ɣ����ܻ���ʱ��ռ�ô�����ϵͳ�ڴ�   Superfetch�������ǽ�����������ڴ���Ϊ����ʹ�õģ������4G���ϵ��ڴ���ȫ���Թرա�rem �ӳ����� Superfetch ���� sc config SysMain start= delayed-auto
sc config SysMain start= disabled
::���ó������������
rem Program Compatibility Assistant Service:�˷���Ϊ�������������(PCA)�ṩ֧�֡�PCA �������û���װ�����еĳ��򣬲������֪���������⡣���ֹͣ�˷���PCA ���޷��������С�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
sc stop PcaSvc > NUL
sc config PcaSvc start= disabled
::����Windows Search
rem Windows Search��Ϊ�ļ��������ʼ������������ṩ�������������Ի�������������
sc stop WSearch > NUL
sc config WSearch start= disabled
del "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" /s > NUL 2>&1
::����Windows Media Player Network Sharing Service
rem ʹ��ͨ�ü��弴���豸���������粥�Ż���ý���豸���� Windows Media Player ý���
sc stop WMPNetworkSvc > NUL
sc config WMPNetworkSvc start= disabled
::���ò�ֹͣӲ���Զ����ŷ���
rem Shell Hardware Detection:Ϊ�Զ�����Ӳ���¼��ṩ֪ͨ��
sc stop ShellHWDetection > NUL
sc config ShellHWDetection start= disabled
::�ر�Security Center��WSCSVC(Windows ��ȫ����)������Ӳ����������ϵİ�ȫ�������á��������ð�������ǽ(��/�ر�)��������(��/�ر�/����)����������(��/�ر�/����)��Windows ����(�Զ�/�ֶ����ز���װ����)���û��ʻ�����(��/�ر�)�Լ� Internet ����(�Ƽ�/���Ƽ�)���÷���Ϊ���������Ӧ���ṩ COM API �Ա���ȫ���ķ���ע�Ტ��¼���Ʒ��״̬����ȫ��ά�� UI ʹ�ø÷����ڡ���ȫ��ά��������������ṩ systray �����Ͱ�ȫ����״����ͼ����ͼ��������ʱ���(NAP)ʹ�ø÷����� NAP ������Է���������ͻ��˵İ�ȫ����״�����Ա�������������ߡ��÷����ṩһ������ API���������ⲿ�ͻ��Ա�̷�ʽ����ϵͳ�ľۺϰ�ȫ����״����
sc stop wscsvc > NUL
sc config wscsvc start= disabled
::Geolocation Service���˷��񽫼���ϵͳ�ĵ�ǰλ�ò��������Χ��(���й����¼��ĵ���λ��)���������ô˷���Ӧ�ó����޷�ʹ�û�����йص���λ�û����Χ����֪ͨ��
sc stop lfsvc > NUL
sc config lfsvc start= disabled
::Downloaded Maps Manager����Ӧ�ó�����������ص�ͼ�� Windows ���񡣴˷����ɷ��������ص�ͼ��Ӧ�ó��������������ô˷�����ֹӦ�÷��ʵ�ͼ��
sc config MapsBroker start= disabled
::ֹͣϵͳ��ԭ�뱸��
net stop SDRSVC > NUL 2>&1
::�ر�Windows Defender Antivirus Network Inspection Service��������ֹ�������Э���е���֪���·��ֵ�©�������������ͼ
net stop WdNisSvc > NUL
::�ر�Windows Defender Antivirus Service�������û���ֹ�������������Ǳ�ڵ����������
net stop WinDefend > NUL
::�ر�Windows Defender Advanced Threat Protection Service��Windows Defender �߼���в��������ͨ�����Ӻͱ��������Ϸ����İ�ȫ�¼��������߼���в��
sc stop Sense
net stop Sense

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
::�Ҽ��˵����:��ʾ/�����ļ�
>"%windir%\SuperHidden.vbs" echo Dim WSHShell
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = WScript.CreateObject("WScript.Shell")
>>"%windir%\SuperHidden.vbs" echo sTitle1 = "SSH=0"
>>"%windir%\SuperHidden.vbs" echo sTitle2 = "SSH=1"
>>"%windir%\SuperHidden.vbs" echo if WSHShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden") = 1 then
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "2", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo else
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo end if
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = Nothing
>>"%windir%\SuperHidden.vbs" echo WScript.Quit(0)
reg add "HKCR\Directory\Background\shell\SuperHidden" /ve /d "��ʾ/�����ļ�"(H)"" /f
reg add "HKCR\Directory\Background\shell\SuperHidden\Command" /ve /d "WScript.exe C:\windows\SuperHidden.vbs" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 2 /f
::�Ҽ��˵���ӣ���ȡ��������ԱȨ��(��ȡTrustedInstallerȨ��)
reg add "HKCR\*\shell\runas" /ve /d "��ȡ��������ԱȨ��" /f
reg add "HKCR\*\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\*\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\Directory\shell\runas" /ve /d "��ȡ��������ԱȨ��" /f
reg add "HKCR\Directory\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\Directory\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\exefile\shell\runas2" /ve /d "��ȡ��������ԱȨ��" /f
reg add "HKCR\exefile\shell\runas2" /v "HasLUAShield" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\exefile\shell\runas2\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\exefile\shell\runas2\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
::�Ҽ��˵����½���ǿ
reg add "HKCR\.bat" /ve /d "batfile" /f
reg add "HKCR\.bat\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.bat\ShellNew" /v "NullFile" /d "" /f
reg add "HKCR\.cmd" /ve /d "cmdfile" /f
reg add "HKCR\.cmd\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.cmd\ShellNew" /v "NullFile" /d "" /f
reg add "HKCR\lnkfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\InternetShortcut" /v "AlwaysShowExt" /d "" /f
::�Ҽ��˵���ӣ��ü��±���
reg add "HKEY_CLASSES_ROOT\*\shell\Noteped" /ve /d �ü��±��� /f
reg add "HKEY_CLASSES_ROOT\*\shell\Noteped\command" /ve /d "notepad.exe %%1" /f
::�Ҽ��˵���ӣ�DLL/OCX�ļ��Ҽ�����(��)ע��
reg add "HKCR\Dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\Dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 /u %%1" /f
reg add "HKCR\Ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\Ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 /u %%1" /f
::�Ҽ��˵���ӣ�cmd����ͨ��
reg add "HKCR\folder\shell\cmd" /ve /d "��������ʾ��" /f
reg add "HKCR\folder\shell\cmd\command" /ve /d "cmd.exe /k cd %%1" /f

::�����Ҽ��˵����½���Ŀ
rem .BMP�ļ�
reg delete HKEY_CLASSES_ROOT\.bmp\ShellNew /f > NUL 2>&1
rem .Briefcase ���İ�
reg delete HKEY_CLASSES_ROOT\Briefcase\ShellNew /f > NUL 2>&1
rem .Contact �½���ϵ�� 
reg delete HKEY_CLASSES_ROOT\.contact\ShellNew /f > NUL 2>&1
rem .jnt �½��ռǱ�
reg delete HKEY_CLASSES_ROOT\.jnt\jntfile\ShellNew /f > NUL 2>&1
rem .rtf�ļ�
reg delete HKEY_CLASSES_ROOT\.rtf\ShellNew /f > NUL 2>&1
rem .ZIP/RAR�ļ�
reg delete HKEY_CLASSES_ROOT\.rar\ShellNew /f > NUL 2>&1
reg delete HKEY_CLASSES_ROOT\.zip\ShellNew /f > NUL 2>&1
reg delete HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew /f > NUL 2>&1
::�����Ҽ��˵����Կ���
regsvr32 /u igfxpph.dll /s
regsvr32 /u atiacmxx.dll /s
regsvr32 /u nvcpl.dll /s
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeysCmds /f > NUL 2>&1
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f > NUL 2>&1
::�����Ҽ��˵���������Կ��˵�
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\ACE" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\NvCplDesktopContext" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxDTCM" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxOSP" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxcui" /f > NUL 2>&1
::�����Ҽ��˵������������ѽ��
reg delete "HKCR\Msi.Package\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\batfile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\cmdfile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\exefile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\lnkfile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
::�����Ҽ��˵������̵ġ�����Bitlocker���Ҽ��˵�
reg delete "HKCR\Drive\shell\encrypt-bde" /f > NUL 2>&1
reg delete "HKCR\Drive\shell\encrypt-bde-elev" /f > NUL 2>&1
::�����Ҽ��˵������̵ġ��Ա�Яʽ��ʽ�򿪡��Ҽ��˵�
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{D6791A63-E7E2-4fee-BF52-5DED8E86E9B8}" /f > NUL 2>&1
::�����Ҽ��˵������̵ġ����ƴ��̡��Ҽ��˵�
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{59099400-57FF-11CE-BD94-0020AF85B590}" /f > NUL 2>&1
::�����Ҽ��˵�����ԭ��ǰ�İ汾
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
::�����Ҽ��˵������ô��̵ġ���¼�����̡�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{fbeb8a05-beee-4442-804e-409d6c4515e9}" /f > NUL 2>&1
::�����Ҽ��˵�������Ŀ¼���ļ��С����ж��󡢵ġ�ʼ���ѻ����á�
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\Offline Files" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Offline Files" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f > NUL 2>&1
::�����Ҽ��˵������̶������ٷ��ʡ�
reg delete "HKCR\Folder\shell\pintohome" /f > NUL 2>&1
::�����Ҽ��˵����ļ��еġ����������С�
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /f > NUL 2>&1
::�����Ҽ��˵����ļ���Ŀ¼�����桢���ж���ġ������ļ��С�
reg delete "HKCR\*\shellex\ContextMenuHandlers\WorkFolders" /f > NUL 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\WorkFolders" /f > NUL 2>&1
reg delete "HKCR\Directory\background\shellex\ContextMenuHandlers\WorkFolders" /f > NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shell\LaunchWorkfoldersControl" /f > NUL 2>&1
::�����Ҽ��˵����������Ȩ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /d "" /f
::�����Ҽ��˵���ɾ��-�������ơ�����·�������ơ��ƶ�
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shell\CopyFilePath" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\AllFilesystemObjects\shell\CopyFileName" /f > NUL 2>&1
::�����Ҽ��˵���ɾ��SkyDrive Pro
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\SPFS.ContextMenu" /f > NUL 2>&1



:: 3.�ҵĵ��ԡ��ļ��е������֣�
::���ҵĵ���ȡ����ʾ7���ļ���
rem "3D����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > NUL 2>&1
rem "��Ƶ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f > NUL 2>&1
rem "�ĵ�"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f > NUL 2>&1
rem "����"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f > NUL 2>&1
rem "ͼƬ"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f > NUL 2>&1
::���ٷ��ʲ���ʾ�����ļ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f
::���ٷ��ʲ���ʾ���ʹ�õ��ļ�
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
::Ϊ�������Դ������������ͬ�Ľ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /d "1" /t REG_DWORD /f
::��ʾ��֪�ļ���չ��
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
reg add HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
::����Դ������ʱ��ʾ�˵���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
::�ر�����ͼ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
::�ڵ����Ľ����д��ļ��д���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f
::��Դ������������С��ʱ��ʾ����·��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f
::����Դ����������ʱ���Զ�������Դ������
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /d "1" /t REG_DWORD /f
::������Դ�������Զ�ˢ�¹���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Update" /v "UpdateMode" /d "1" /t REG_DWORD /f

              


:: 4.��ȫ��ά��������ã�
::�رտͻ�������Ƽƻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
::�ر���Ƭ������Ż�������
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" > NUL 2>&1
::�ر��Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
::�ر�Windows Defender Firewall��Windows Defender ����ǽͨ����ֹδ��Ȩ�û�ͨ�� Internet �����������ļ���������������������
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
::�ر�UAC
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 00000000 /f
::ȥ��UACС����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
::�ر�Windows Defender Antivirus Service�������û���ֹ�������������Ǳ�ڵ����������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
::ȡ�����ļ�����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".7z;.bat;.chm;.cmd;.exe;.js;.msi;.rar;.reg;.vbs;.zip" /f
gpupdate /force  
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters


:: 5.������������ã�
::��������ʾ���ڼ�
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sLongDate" /d "yyyy'��'M'��'d'��', dddd" /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortDate" /d "yyyy/M/d/ddd" /t REG_SZ /f
::��������ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
::������ʼ����ʾ����ͼ���֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d 0 /f
::���������ز�����������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /d 1 /t REG_DWORD /f
::������������ϵ��(����)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
::����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d 1 /f
::�������е�Cortana����Ϊ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
::��������ռ��ʱ��:���ϲ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f



:: 6.���桢ͼ��������֣�
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
::�����½�ȥ����ݷ�ʽ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t REG_BINARY /d 00000000 /f
::ɾ������վ�Ҽ��̶�����ʼ��Ļ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
::�����洴��IE��ݷ�ʽ(�հ�ҳ)
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\Internet Explorer.lnk"^)
echo oShellLink.TargetPath="%%ProgramFiles%%\Internet Explorer\iexplore.exe"
echo oShellLink.Arguments="-nohome"
echo oShellLink.WorkingDirectory="%%HOMEDRIVE%%%%HOMEPATH%%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="���Ҳ���ʾ Internet �ϵ���Ϣ����վ��"
echo oShellLink.Save)>makelnk.vbs
makelnk.vbs
del /f /q makelnk.vbs
::�����洴���ٶȿ�ݷ�ʽ
echo [InternetShortcut] >%USERPROFILE%\Desktop\�ٶ�.url
echo URL="https://www.baidu.com/?tn=baiduhome" >>%USERPROFILE%\Desktop\�ٶ�.url

set lnkdir="%USERPROFILE%\Desktop\����"
if not exist %lnkdir% md %lnkdir%
echo [InternetShortcut] >%lnkdir%\�й���������.url
echo URL="http://www.icbc.com.cn/icbc/" >>%lnkdir%\�й���������.url
echo [InternetShortcut] >%lnkdir%\�й�ũҵ����.url
echo URL="http://www.abchina.com/cn/" >>%lnkdir%\�й�ũҵ����.url
echo [InternetShortcut] >%lnkdir%\�й�����.url
echo URL="http://www.boc.cn/" >>%lnkdir%\�й�����.url
echo [InternetShortcut] >%lnkdir%\�й���������.url
echo URL="http://www.ccb.com/" >>%lnkdir%\�й���������.url
echo [InternetShortcut] >%lnkdir%\�й�������������.url
echo URL="http://www.psbc.com/" >>%lnkdir%\�й�������������.url
echo [InternetShortcut] >%lnkdir%\��ͨ����.url
echo URL="http://www.bankcomm.com/" >>%lnkdir%\��ͨ����.url

echo [InternetShortcut] >%lnkdir%\��������.url
echo URL="http://www.citicbank.com/" >>%lnkdir%\��������.url
echo [InternetShortcut] >%lnkdir%\��������.url
echo URL="http://www.cmbchina.com/" >>%lnkdir%\��������.url
echo [InternetShortcut] >%lnkdir%\�ַ�����.url
echo URL="http://www.spdb.com.cn/" >>%lnkdir%\�ַ�����.url
echo [InternetShortcut] >%lnkdir%\��������.url
echo URL="http://www.cmbc.com.cn/" >>%lnkdir%\��������.url



:: 7.������������
::�ر�Microsoft Edge���״����С���ӭҳ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t REG_DWORD /d 0 /f
::�ر�Adobe Flash���㼴��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t REG_DWORD /d 0 /f
::����IE��ҳ
reg delete "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /f >nul 2>nul
::����IE��ҳ 
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://www.baidu.com/?tn=baiduhome" /f
::�ر�SmartscreenӦ��ɸѡ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
::�رս������վ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 0 /f
::�رն��ѡ�ʱ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "WarnOnClose" /t REG_DWORD /d 0 /f
::�ӵ�ǰ���ڵ���ѡ��д��ⲿ����
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t REG_DWORD /d 1 /f
::����IE�״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d 1 /f
::���ñ����Զ���ɹ���
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /d "yes" /f
::������������
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer" /v AllowServicePoweredQSA /t REG_DWORD /d 1 /f
::����Internet Explorer������
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t REG_DWORD /d 1 /f
::��ͬʱ����������Ŀ������ 10
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 10 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d 10 /f
::����Internet Explorer���Ͻǵ�Ц��������ť
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t REG_DWORD /d 1 /f
::�ر�IE����׷�ٹ���(Do Not Track) 
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v DoNotTrack /t REG_DWORD /d 0 /f
::�رն�λ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v PolicyDisableGeolocation /t REG_DWORD /d 1 /f




:: 8.΢��ƴ�����뷨����ѡ��
::���������ʽ���̲���ΪĬ��
reg add "HKCU\Keyboard Layout" /f
reg add "HKCU\Keyboard Layout\Preload" /v "1" /d "00000804" /f
reg add "HKCU\Keyboard Layout\Preload" /v "2" /d "d0010804" /f
reg add "HKCU\Keyboard Layout\Substitutes" /v "00000804" /d "00000409" /f
reg add "HKCU\Keyboard Layout\Substitutes" /v "d0010804" /d "00000804" /f
reg add "HKCU\Keyboard Layout\Toggle" /f
reg add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000804" /f
reg add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000804\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Default" /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000804\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "Profile" /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKCU\SOFTWARE\Microsoft\CTF\Assemblies\0x00000804\{34745C63-B2F0-4784-8B67-5E12C8701A31}" /v "KeyboardLayout" /t REG_DWORD /d 67700740 /f
::΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
::�ر�΢��ƴ���Ƽ���
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
::�ر�ģ����
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f
::�����������ص�������
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\CTF\LangBar"  /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f
::�����������ϵİ�����ť
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState\{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d 3 /f



:: 9.��ʼ�˵��Լ�Windows����
::�ر�С��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
::�رա�ͻ����ʾ�°�װ�ĳ���
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t REG_DWORD /d "0" /f
::�ر���Ϸ¼�ƹ���
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
::�ر�����ʱ��Windows �۽��ƹ�
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0" /f
::�رա�ʹ��Windowsʱ��ȡ���ɺͽ��顱
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
::�ر��̵�Ӧ���ƹ�
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
::��ֹ�Զ���װ�Ƽ���Ӧ�ó���
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
::��ֹ�ڿ�ʼ�˵���ʾ����
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
::�ر����Ͱ�װ����
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
::�رո��µ��Զ����غͰ�װ
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f
::�ر���Ӧ���̵��в��ҹ���Ӧ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f
::�ر�Microsoft ����������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" >nul
Start /wait schtasks.exe /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" >nul



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



:: 12.ϵͳAPPĬ�����������
::���±���ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
::���±��Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f
::���̼�ס�ϴ�NumLock״̬
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /d "2" /f
::Windows Media Player ����ʾ�״�ʹ�öԻ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer /v "GroupPrivacyAcceptance" /t REG_DWORD /d 1 /f
::�˳�����ʱ�Զ������ڴ��е�DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDll /t REG_DWORD /d 00000001 /f
::�Զ��ر�ֹͣ��Ӧ�ĳ���
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /f
::���ٹػ�ǰ�ĳ���ȴ�
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "HungAppTimeout" /d "200" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "WaitToKillAppTimeout" /d "1000" /f
::ִ�йػ�ʱǿ���˳�Ӧ�ó��򣨹ػ�ʱǿɱ��̨���ȴ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f



:: 13.�������õ��� My Opt
::����������
attrib -s -h -r "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" 1>nul 2>nul
attrib -s -h -r "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
attrib -s -h -r "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" 1>nul 2>nul
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
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



echo ���²���
gpupdate /force
ping -n 3 127.0.0.1>nul
cls
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
start explorer
exit
