@ECHO OFF
rem 18:44 2018/10/27
cd /d "%~dp0"
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
COLOR 0a

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
::PowerShell "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
::3DBuilder
::PowerShell "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"

::ж��Xbox��Ϸ���
::PowerShell "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
::ж����Ϸ¼�ƹ�����
::PowerShell "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
::PowerShell "get-appxpackage *Microsoft.XboxGamingOverlay* | remove-appxpackage"

::��Ѷ
PowerShell "Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage"
::�ƾ�
PowerShell "Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage"
::Twitter
PowerShell "Get-AppxPackage *.Twitter | Remove-AppxPackage"
::XBOX
PowerShell "Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage"
::Office Sway
PowerShell "Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage"
::Office OneNote
PowerShell "Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage"
::Office Hub
PowerShell "Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage"
::SkypeApp
PowerShell "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage"
::����������
PowerShell "Get-AppxPackage *1F8B0F94.122165AE053F* | Remove-AppxPackage"
::��ȡ����
PowerShell "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
::Get Started
PowerShell "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
::��Ϣ
PowerShell "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
::3DViewer
PowerShell "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
::Microsoft Solitaire Collection
PowerShell "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
::Sticky Notes
PowerShell "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
::MixedReality
PowerShell "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
::MSPaint
PowerShell "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
::NetworkSpeedTest
PowerShell "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
::Office Lens
PowerShell "Get-AppxPackage *Microsoft.OfficeLens* | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
::Print3D
PowerShell "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
::RemoteDesktop
PowerShell "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage"
::��ͼ�Ͳ�ͼ
PowerShell "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
::Services.Store.Engagement
PowerShell "Get-AppxPackage *Microsoft.Services.Store.Engagement* | Remove-AppxPackage"
::Todos
PowerShell "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage"
::Whiteboard
PowerShell "Get-AppxPackage *Microsoft.Whiteboard* | Remove-AppxPackage"
::ͼƬ
PowerShell "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
::���Ӻ�ʱ��
PowerShell "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
::���
PowerShell "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
::�������ʼ�
PowerShell "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
::��������
PowerShell "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
::��ͼ
PowerShell "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
::����¼����
PowerShell "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
::YourPhone
PowerShell "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
::Groove����
PowerShell "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
::��Ӱ�͵���
PowerShell "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"

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

END