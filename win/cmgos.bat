@ECHO OFF
rem 15:19 2018/8/27
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 �������������� ��������
COLOR 0a

rem ���� http://document.cmgos.com/release_notes/release_notes_V0_H �˷��а������ʵ�����

::����������֣� δ���ã�Application Management
::Connected User Experiences and Telemetry
sc config DiagTrack start= disabled
::Diagnostic Policy Service
sc config DPS start= disabled
::Remote Registry
sc config RemoteRegistry start= disabled
::Problem Reports and Solutions Control Panel Support
sc config wercplsupport start= disabled
::Fax
sc config Fax start= disabled
::Performance Logs & Alerts
sc config pla start= disabled
::Windows Error Reporting Service
sc config WerSvc start= disabled

::a.     �Ƴ�������Ӧ��/���񣺣�������Desktop App Installer��Store Purchase App��Ǯ����Ӧ���̵ꡢXbox��Windows To Go�� 
::����
PowerShell "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
::��ȡ����
PowerShell "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
::Get Started
PowerShell "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
::��Ϣ
PowerShell "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
::Office Hub
PowerShell "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
::Microsoft Solitaire Collection
PowerShell "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
::Sticky Notes
PowerShell "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
::Office OneNote
PowerShell "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
::���Ӻ�ʱ��
PowerShell "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
::����
PowerShell "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
::��������
PowerShell "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
::��ͼ
PowerShell "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
::����¼����
PowerShell "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
::Groove����
PowerShell "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
::��Ӱ�͵���
PowerShell "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"


cd /d "%~dp0"
CLS
install_wim_tweak.exe /o /l
::Cortana
install_wim_tweak.exe /o /c "Microsoft-Windows-Cortana" /r
::�����ʵ�Ż�
install_wim_tweak.exe /o /c "Microsoft-Windows-Holographic-Desktop" /r
::Edge
install_wim_tweak.exe /o /c "Microsoft-Windows-Internet-Browser" /r
::Windows Defender ������
install_wim_tweak.exe /o /c "Windows-Defender" /r
::Quick Assist
install_wim_tweak.exe /o /c "Microsoft-Windows-QuickAssist" /r

::b.    ����������Ӧ��/����(�������ô�����Ĳ��֣�Administrative Shares��Internet Information Services��Microsoft Message Queue��ASP.NET 4.7��������)
::Fax and Scan
install_wim_tweak.exe /o /c "Microsoft-Windows-Fax" /r
::Windows Media Player
install_wim_tweak.exe /o /c "Microsoft-Windows-MediaPlayer" /r
install_wim_tweak.exe /o /c "Microsoft-Windows-WindowsMediaPlayer" /r
::Windows Hello
install_wim_tweak.exe /o /c "Microsoft-Windows-Hello" /r
::Զ������
install_wim_tweak.exe /o /c "Microsoft-Windows-RemoteDesktop" /r
install_wim_tweak.exe /o /c "RemoteDesktopServices-Base" /r
::�� TCPIP ����(��echo��daytime��)
install_wim_tweak.exe /o /c "Microsoft-Windows-SimpleTCP" /r
::���������Э��(SNMP) 
install_wim_tweak.exe /o /c "Microsoft-Windows-SNMP" /r
install_wim_tweak.exe /o /c "Microsoft-Windows-WMI-SNMP-Provider" /r
::SMB 1.0/CIFS �ļ�����֧�֡�
install_wim_tweak.exe /o /c "Microsoft-Windows-SMB1" /r
::Telnet �ͻ���
install_wim_tweak.exe /o /c "Microsoft-Windows-Telnet" /r
::TFTP �ͻ���
install_wim_tweak.exe /o /c "Microsoft-Windows-TFTP" /r
::Hyper-V
install_wim_tweak.exe /o /c "Microsoft-Hyper-V" /r
install_wim_tweak.exe /o /c "Microsoft-Windows-RemoteFX" /r
install_wim_tweak.exe /o /c "Microsoft-Windows-Virtual" /r
::Active Directory ����Ŀ¼����
install_wim_tweak.exe /o /c "Microsoft-Windows-DirectoryServices-ADAM-Client" /r
install_wim_tweak.exe /o /c "microsoft-windows-directoryservices-adam-snapins" /r
::NFS
install_wim_tweak.exe /o /c "Microsoft-Windows-NFS" /r

install_wim_tweak.exe /h /o /l

exit