

:: 8.��ʼ�˵��Լ�Windows����
::�ر�����ʱ��Windows �۽��ƹ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
::�رա�ʹ��Windowsʱ��ȡ���ɺͽ��顱
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
::�ر��¼�׷��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d 0 /f

:: 9.ϵͳAPPĬ�����������
::Ϊ�������Դ������������ͬ�Ľ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DesktopProcess" /d "1" /t REG_DWORD /f
::�ڵ����Ľ����д��ļ��д���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f
::����Դ����������ʱ���Զ�������Դ������
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /d "1" /t REG_DWORD /f
::������Դ�������Զ�ˢ�¹���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Update" /v "UpdateMode" /d "1" /t REG_DWORD /f

::���̼�ס�ϴ�NumLock״̬
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /d "2" /f
::�˳�����ʱ�Զ������ڴ��е�DLL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDll /t REG_DWORD /d 00000001 /f
::�Զ��ر�ֹͣ��Ӧ�ĳ���
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /f
::���ٹػ�ǰ�ĳ���ȴ�
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "HungAppTimeout" /d "200" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "WaitToKillAppTimeout" /d "1000" /f
::ִ�йػ�ʱǿ���˳�Ӧ�ó��򣨹ػ�ʱǿɱ��̨���ȴ���
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
::�ر�����ͼ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /t REG_DWORD /d 1 /f

:: 11.��Դ����

::�������ļ�ֱ��ѹ�����ڴ���������ͣ�����40%
powercfg -h size 40
::������Ļ�Զ��ر�ʱ��Ϊ��3����
powercfg -x -monitor-timeout-ac 3
powercfg -x -monitor-timeout-dc 3
::������Ļ�رպ��ֹ�ر�Ӳ��
powercfg -x -disk-timeout-ac 0
powercfg -x -disk-timeout-dc 0
::����7���Ӻ�˯��
powercfg -x -standby-timeout-ac 7
powercfg -x -standby-timeout-dc 7
::˯�ߺ��ֹ����
powercfg -x -hibernate-timeout-ac 0
powercfg -x -hibernate-timeout-dc 0

:: 12.ϵͳ���ԣ�

::�ر�Զ��Э��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f

:: 13.��ȫ��ά��������ã�

::�ر���Ƭ������Ż�������
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" > NUL 2>&1


::�ر�Windows Defender Firewall��Windows Defender ����ǽͨ����ֹδ��Ȩ�û�ͨ�� Internet �����������ļ���������������������
rem sc config MpsSvc start=disabled >nul �ᵼ��Store�޷�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
::�ر��Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutorun" /t REG_DWORD /d "0xFF" /f

rem .RAR�ļ�
reg delete HKEY_CLASSES_ROOT\.rar\ShellNew /f > NUL 2>&1
rem .jnt �½��ռǱ�
reg delete HKEY_CLASSES_ROOT\.jnt\jntfile\ShellNew /f > NUL 2>&1
rem .Briefcase ���İ�
reg delete HKEY_CLASSES_ROOT\Briefcase\ShellNew /f > NUL 2>&1

::���� WAP ����Ϣ·�ɷ���
rem dmwappushsvc:WAP ����Ϣ·�ɷ���
sc config dmwappushservice start= disabled
::���õ绰����
rem Phone Service ���豸�Ϲ���绰����״̬
sc config PhoneSvc start= disabled
::���ô������ռ�
rem Sensor Service һ�����ڹ�����ִ������Ĺ��ܵĴ��������񡣹��������ļ��豸����(SDO)����ʷ��¼�����ض��豸����仯���б���� SDO �����������ֹͣ������˴˷����򽫲������ SDO ����������˲��ᷢ���Զ���ת�����Դ���������ʷ��¼�ռ�Ҳ��ֹͣ��
sc config SensorService start= disabled
::����ʱ��ͬ��
rem Windows Time:ά���������ϵ����пͻ��˺ͷ�������ʱ�������ͬ��������˷���ֹͣ��ʱ������ڵ�ͬ���������á�����˷��񱻽��ã��κ���ȷ�������ķ��񶼽�����������
sc config W32Time start= disabled
::��ûʲô�õķ���
rem AllJoyn Router Service:·�ɱ��� AllJoyn �ͻ��˵� AllJoyn ��Ϣ�����ֹͣ�˷���������û������·������ AllJoyn �ͻ��˽��޷����С�
sc config AJRouter start= disabled

::���õ���Ǯ��
rem WalletService:����Ǯ���ͻ���ʹ�õ���������
sc config WalletService start= disabled
::��������ʹ����
rem ����ʹ����:��������ʹ�������������ޣ����Ʊ������ݣ��������Ʒѵ����硣
sc config DusmSvc start= disabled
::�������ߵ�������
rem ���ߵ����ͷ���ģʽ����
sc config RmSvc start= disabled



::������������
rem Shared PC Account Manager:Manages profiles and accounts on a SharedPC configured device
rem sc config shpamsvc start= disabled
::����UevAgentService
rem User Experience Virtualization Service:ΪӦ�ó���� OS ���������ṩ֧��
rem sc config UevAgentService start= disabled
rem sc config AppVClient start= disabled

::������������
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /d 1 /t REG_DWORD /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /d 1 /t REG_DWORD /f


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

::�ر�ϵͳ�Զ����£��ֶ����£�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f

::�ر��̵�Ӧ���ƹ�
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
::��ֹ�ڿ�ʼ�˵���ʾ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f



:: 14.
::����������������ǩ����֤��
bcdedit /set loadoptions DDISABLE_INTEGRITY_CHECKS
bcdedit /set TESTSIGNING ON
::����������������ǩ����֤��
::bcdedit /set loadoptions DENABLE_INTEGRITY_CHECKS
::bcdedit /set TESTSIGNING OFF
