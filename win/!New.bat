@ECHO OFF
rem 22:09 2018/11/23/����
cd /d "%~dp0"
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 ��������
COLOR 0a

:: gpedit.msc  C:\Windows\System32\GroupPolicy

:: ��ռ�����
mshta vbscript:clipboardData.SetData("text","")(close)

:: �Ӿ����Ҽ��˵�����-��Ӳ��֣�(��Shift��ʾ)
::���:��ʾ/�����ļ�
>"%windir%\SuperHidden.vbs" echo Dim WSHShell
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = WScript.CreateObject("WScript.Shell")
>>"%windir%\SuperHidden.vbs" echo sTitle1 = "SSH=0"
>>"%windir%\SuperHidden.vbs" echo sTitle2 = "SSH=1"
>>"%windir%\SuperHidden.vbs" echo if WSHShell.RegRead("HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden") = 1 then
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "2", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo else
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "1", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "0", "REG_DWORD"
>>"%windir%\SuperHidden.vbs" echo WSHShell.SendKeys "{F5}"
>>"%windir%\SuperHidden.vbs" echo end if
>>"%windir%\SuperHidden.vbs" echo Set WSHShell = Nothing
>>"%windir%\SuperHidden.vbs" echo WScript.Quit(0)
reg add "HKCR\Directory\Background\shell\SuperHidden" /ve /d "��ʾ/�����ļ�"(H)"" /f
reg add "HKCR\Directory\Background\shell\SuperHidden" /v "Extended" /d "" /f
reg add "HKCR\Directory\Background\shell\SuperHidden\Command" /ve /d "WScript.exe C:\windows\SuperHidden.vbs" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 2 /f
::���:������Դ������
reg add "HKLM\SOFTWARE\Classes\Directory\background\shell\RestartExplorer" /ve /d "������Դ������" /f
reg add "HKLM\SOFTWARE\Classes\Directory\background\shell\RestartExplorer" /v "Extended" /d "" /f
reg add "HKLM\SOFTWARE\Classes\Directory\background\shell\RestartExplorer\Command" /ve /d "tskill explorer" /f
::���:����Աȡ������Ȩ(��ȡTrustedInstallerȨ��)�����ļ��ϰ�סshift��ʾ��
reg add "HKCR\*\shell\runas" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\*\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\*\shell\runas" /v "Extended" /d "" /f
reg add "HKCR\*\shell\runas" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\*\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\Directory\shell\runas" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\Directory\shell\runas" /v "HasLUAShield" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "Extended" /d "" /f
reg add "HKCR\Directory\shell\runas" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\Directory\shell\runas\command" /ve /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\Directory\shell\runas\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
reg add "HKCR\exefile\shell\runas2" /ve /d "����Աȡ������Ȩ" /f
reg add "HKCR\exefile\shell\runas2" /v "HasLUAShield" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "NoWorkingDirectory" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "Extended" /d "" /f
reg add "HKCR\exefile\shell\runas2" /v "Icon" /d "imageres.dll,1" /f
reg add "HKCR\exefile\shell\runas2\command" /ve /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
reg add "HKCR\exefile\shell\runas2\command" /v "IsolatedCommand" /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
::��ӣ��ļ��������ļ�·��
reg add "HKCR\*\shell\copypath" /ve /d "�����ļ�·��" /f
reg add "HKCR\*\shell\copypath" /v "Extended" /d "" /f
reg add "HKCR\*\shell\copypath" /v "icon" /d "SHELL32.dll,110" /f
reg add "HKCR\*\shell\copypath\command" /ve /d "mshta vbscript:clipboarddata.setdata"(\"text\",\"%%1\")""(close)"" /f
::��ӣ��ļ��У������ļ���·��
reg add "HKCR\Directory\shell\copypath" /ve /d "�����ļ���·��" /f
reg add "HKCR\Directory\shell\copypath" /v "Extended" /d "" /f
reg add "HKCR\Directory\shell\copypath" /v "icon" /d "SHELL32.dll,4" /f
reg add "HKCR\Directory\shell\copypath\command" /ve /d "mshta vbscript:clipboarddata.setdata"(\"text\",\"%%1\")""(close)"" /f
::��ӣ��ļ��У�CMD����ͨ��
reg add "HKCR\folder\shell\cmd" /ve /d "�ڴ˴���������ʾ��" /f
reg add "HKCR\folder\shell\cmd" /v "icon" /d "shell32.dll,71" /f
reg add "HKCR\folder\shell\cmd" /v "Extended" /d "" /f
reg add "HKCR\folder\shell\cmd\command" /ve /d "cmd.exe /s /k pushd \"%%V\"" /f
::��ӣ��ļ���ע��(��)DLL/OCX�ļ�
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 \\\"%%1\\\"" /f
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 /u \\\"%%1\\\"" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 \\\"%%1\\\"" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 /u \\\"%%1\\\"" /f
::��ӣ��½���������Bat&CMD��
reg add "HKCR\.bat" /ve /d "batfile" /f
reg add "HKCR\.bat\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.bat\ShellNew" /v "NullFile" /d "" /f
::reg add "HKCR\.cmd" /ve /d "cmdfile" /f
::reg add "HKCR\.cmd\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
::reg add "HKCR\.cmd\ShellNew" /v "NullFile" /d "" /f

:: �Ӿ����Ҽ��˵�����-�����֣�
::�����ļ����½�
rem .BMP�ļ�
reg delete "HKCR\.bmp\ShellNew" /f > NUL 2>&1
rem .��ϵ�� 
reg delete "HKCR\.contact\ShellNew" /f > NUL 2>&1
rem .RTF�ļ�
reg delete "HKCR\.rtf\ShellNew" /f > NUL 2>&1
rem .rar�ļ�
reg delete "HKLM\SOFTWARE\Classes\.rar\ShellNew" /f > NUL 2>&1
rem .zip�ļ�
reg delete "HKLM\SOFTWARE\Classes\.zip\ShellNew" /f > NUL 2>&1
::�����Ҽ������͵�
rem �����ռ���
del /f "%AppData%\Microsoft\Windows\SendTo\Fax Recipient.lnk" > NUL 2>&1
rem ѹ��(zipped)�ļ���
del /f "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" > NUL 2>&1
rem �ĵ�
del /f "%AppData%\Microsoft\Windows\SendTo\�ĵ�.mydocs" > NUL 2>&1
rem �ʼ��ռ���
del /f "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" > NUL 2>&1
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
::����opendlg
reg delete "HKCR\Unknown\shell\opendlg" /f > NUL 2>&1
reg delete "HKCR\Unknown\shell\opendlg\command" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\Folder\shell\pintostartscreen" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\Folder\shell\pintostartscreen\command" /f > NUL 2>&1
::�����Կ���
::reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\ACE" /f > NUL 2>&1
::reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\NvCplDesktopContext" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxDTCM" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxOSP" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxcui" /f > NUL 2>&1
::�����ϴ���WPS�ĵ�
reg delete "HKCR\*\shellex\ContextMenuHandlers\qingshellext" /f > NUL 2>&1
::�����ϴ����ٶ�����
reg delete "HKCR\*\shellex\ContextMenuHandlers\YunShellExt" /f > NUL 2>&1
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

:: �Ӿ�������
::��������ʾ �����-�˵��ԣ��ҵĵ��ԣ�
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
::��������ʾ �����ļ���-�û����ҵ��ĵ���
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
::��������ʾ �������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 0
::������ݷ�ʽ����ʾ����ݷ�ʽ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
::��ʾ��֪�ļ����͵���չ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
::ǿ����ʾָ���ļ����͵���չ��
reg add "HKCR\batfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\cmdfile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\exefile" /v "AlwaysShowExt" /d "" /f
reg add "HKCR\regfile" /v "AlwaysShowExt" /d "" /f
::�����洴���๦��Internet Explorer��ݷ�ʽ
reg delete "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f > NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{00000000-0000-0000-0000-100000000001}" /f > NUL 2>&1
reg delete "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{00000000-0000-0000-0000-100000000001}" /ve /d "Internet Explorer" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}" /v "InfoTip" /d "@C:\Windows\System32\ieframe.dll,-881" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}" /v "LocalizedString" /d "@C:\Windows\System32\ieframe.dll,-880" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\DefaultIcon" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell" /ve /d "Open" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\001" /ve /d "���Ӱ��(&B)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\001\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.mianbao99.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\002" /ve /d "����ֱ��(&L)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\002\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cietv.com/live/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\003" /ve /d "CCTV1(&1)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\003\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://tv.cctv.com/live/cctv1/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\00Home" /ve /d "CCTV5(&5)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\00Home\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://tv.cctv.com/live/cctv5/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\01Nohome" /ve /d "�򿪿հ���ҳ(&O)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\01Nohome\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-nohome" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\02Private" /ve /d "��˽���ģʽ(&P)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\02Private\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-private" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\03NoAddOns" /ve /d "�޼���������(&E)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\03NoAddOns\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"-extoff" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\04History" /ve /d "ɾ����ʷ��¼(&S)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\04History\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"InetCpl.cpl,ClearMyTracksByProcess 255" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\05Clean" /ve /d "ɾ����ʱ�ļ�(&T)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\05Clean\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"InetCpl.cpl,ClearMyTracksByProcess 8" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\06Set" /ve /d "Internet ����(&R)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\06Set\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\inetcpl.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\07Connection" /ve /d "������������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\07Connection\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\Inetcpl.cpl,,4" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\08Net" /ve /d "��������ѡ��(&N)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\08Net\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\"C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\ncpa.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\09Hosts" /ve /d "�� HOSTS (&H)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\09Hosts\Command" /ve /d "\"C:\Windows\notepad.exe\"%windir%\system32\drivers\etc\hosts" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolde r" /v "HideAsDeletePerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0 /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "HideFolderVerbs" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "WantsParseDisplayName" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "HideOnDesktopPerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "ParseDisplayNameNeedsURL" /d "" /f
::�����洴���๦����������IE��ݷ�ʽ
reg delete "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}" /f > NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{00000000-0000-0000-0000-100000000002}" /ve /d "��������" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}" /v "InfoTip" /d "�������У��Ҽ�ֱ��" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}" /v "LocalizedString" /d "��������" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\DefaultIcon" /ve /d "C:\Windows\System32\ieframe.dll,88" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell" /ve /d "Open" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\01" /ve /d "��������(&I)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\01\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.icbc.com.cn/icbc/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\02" /ve /d "ũҵ����(&A)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\02\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.abchina.com/cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\03" /ve /d "�й�����(&B)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\03\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.boc.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\04" /ve /d "��������(&C)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\04\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.ccb.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\05" /ve /d "��ͨ����(&J)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\05\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.bankcomm.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\06" /ve /d "�ʴ�����(&Y)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\06\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.psbc.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\060" /ve /d "��������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\060\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://ipcrs.pbccrc.org.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\07" /ve /d "��������(&M)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\07\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cmbc.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\08" /ve /d "��������(&Z)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\08\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cmbchina.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\09" /ve /d "��������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\09\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.citicbank.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\10" /ve /d "ƽ������(&P)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\10\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://bank.pingan.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\11" /ve /d "�������(&G)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\11\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cebbank.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\12" /ve /d "�ַ�����(&F)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\12\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.spdb.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\13" /ve /d "��������(&H)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\13\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.hxb.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\14" /ve /d "��ҵ����(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\14\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"https://www.cib.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\15" /ve /d "�㷢����(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\15\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cgbchina.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\16" /ve /d "��������(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\16\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.czbank.com/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\17" /ve /d "�������(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\17\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.hfbank.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\18" /ve /d "��������(&D)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\shell\18\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\"http://www.cbhb.com.cn/" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolde r" /v "HideAsDeletePerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0 /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /v "HideFolderVerbs" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /v "WantsParseDisplayName" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /v "HideOnDesktopPerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000002}\ShellFolder" /v "ParseDisplayNameNeedsURL" /d "" /f

:: �Ӿ����������������֣�
::��������ʱ����ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
::����������ʾ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
::������Cortana����Ϊ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
::�ϲ���������ť:�Ӳ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f
::����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d 0 /f
::�ر� ������-�Ҽ�Windows Ink������
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t REG_DWORD /d 0 /f
::�ر��Ҳ�֪ͨ������
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d 1 /f
::�رմ�  ����  �ļ��ġ���ȫ���桱
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".7z;.cab;.bat;.chm;.cmd;.exe;.js;.msi;.rar;.reg;.vbs;.zip;.txt" /f

:: �Ӿ����ر�Ԥ��
::�رղ�����Ƶ�����ļ�ͼƬԤ��
reg delete "HKCR\.ape\ShellEx" /f >nul 2>nul
reg delete "HKCR\.flac\ShellEx" /f >nul 2>nul
reg delete "HKCR\.mp3\ShellEx" /f >nul 2>nul
::�رղ�����Ƶ�����ļ�ͼƬԤ��
::reg delete "HKCR\.avi\ShellEx" /f >nul 2>nul
::reg delete "HKCR\.mkv\ShellEx" /f >nul 2>nul
::reg delete "HKCR\.mov\ShellEx" /f >nul 2>nul
::reg delete "HKCR\.mp4\ShellEx" /f >nul 2>nul
reg delete "HKCR\.3gp\ShellEx" /f >nul 2>nul
reg delete "HKCR\.m4a\ShellEx" /f >nul 2>nul
reg delete "HKCR\.m4v\ShellEx" /f >nul 2>nul
reg delete "HKCR\.mpeg\ShellEx" /f >nul 2>nul
reg delete "HKCR\.mpg\ShellEx" /f >nul 2>nul
reg delete "HKCR\.rmvb\ShellEx" /f >nul 2>nul
reg delete "HKCR\.wmv\ShellEx" /f >nul 2>nul

:: ʹ�ã�Ĭ��ѡ�����&����

::Fix CHM
regsvr32 /s hhctrl.ocx
regsvr32 /s itircl.dll
regsvr32 /s itss.dll

::����Notepad2
copy /y "Notepad2.exe" "%SystemRoot%"
::��Notepad�ٳ�ΪNotepad2
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /d "\"C:\Windows\Notepad2.exe\" /z" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /f >nul 2>nul
::��ӣ��ļ����ü��±��򿪣�97��
reg add "HKCR\*\shell\Noteped" /ve /d "�ü��±���" /f
reg add "HKCR\*\shell\Noteped" /v "icon" /d "imageres.dll,289" /f
reg add "HKCR\*\shell\Noteped\command" /ve /d "Notepad2.exe %%1" /f
::���±���ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
::���±��Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f

::�ڿ��������� �༭ע��� ��
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "�༭ע���" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "InfoTip" /d "��ע���༭��" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "System.ControlPanel.Category" /d "5" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\DefaultIcon" /ve /d "%%SystemRoot%%\regedit.exe" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\Shell\Open\command" /ve /d "regedit" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "���ע���༭��" /f

::���LRC��ʸ�ʽʶ��
reg add "HKCR\.lrc" /ve /d "lrcfile" /f
reg add "HKCR\.lrc" /v "PerceivedType" /d "text" /f
reg add "HKCR\lrcfile" /ve /d "lrc ���" /f
reg add "HKCR\lrcfile\DefaultIcon" /ve /d "imageres.dll,17" /f
reg add "HKCR\lrcfile\shell" /f
reg add "HKCR\lrcfile\shell\open" /f
reg add "HKCR\lrcfile\shell\open\command" /ve /d "NOTEPAD.EXE %%1" /f

::Ĭ��ʹ��Chrome��MHT
reg add "HKCR\.mht" /ve /d "ChromeHTML" /f
::Ĭ��ʹ��Chrome��PDF
reg add "HKCR\.pdf" /ve /d "ChromeHTML" /f

::��� Windows ��Ƭ�鿴��
reg add "HKCU\Software\Classes\.bmp" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.gif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.ico" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpeg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.png" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tiff" /ve /d "PhotoViewer.FileAssoc.Tiff" /f

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

::Windows Media Player ����ʾ�״�ʹ�öԻ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d 1 /f > NUL 2>&1

::΢��ƴ�����뷨����ѡ��
rem ΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
rem �رմ����л�ȡ��ѡ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
rem �رմ����л�ȡ��ֽ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableLiveSticker" /t REG_DWORD /d 0 /f
rem �ر�ģ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f
rem �ر���ʾ�´��ȴ���������ʾ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t REG_DWORD /d 0 /f

:: ʹ�ã�IE��
::����IE�״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d 1 /f
::����Internet Explorer���Ͻǵ�Ц��������ť
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t REG_DWORD /d 1 /f
::����IE���������ʱ�򿪵���ҳ
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /d "about:blank" /f
::����IEĬ����ҳDefault_Page_URL
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /d "about:blank" /f
::����IE��ҳ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "https://www.baidu.com/?tn=baiduhome" /f
::����Ĭ������
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default_Search_URL" /d "https://www.baidu.com/s?tn=baiduhome&wd=%s" /f
::����Ĭ������ҳ��
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Search Page" /d "https://www.baidu.com/" /f
::���ñ����Զ���ɹ���
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /d "yes" /f
::�رն��ѡ�ʱ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "WarnOnClose" /t REG_DWORD /d 0 /f
::�ӵ�ǰ���ڵ���ѡ��д��ⲿ����
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t REG_DWORD /d 1 /f
::����Internet Explorer������
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t REG_DWORD /d 1 /f
::IE�޸�Ĭ����������
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "DisplayName" /d "�ٶ�" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "URL" /d "https://www.baidu.com/s?tn=baiduhome&wd={searchTerms}" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "SuggestionsURL_JSON" /d "http://suggestion.baidu.com/su?wd={searchTerms}&action=opensearch&ie=utf-8" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "FaviconURLFallback" /d "http://www.baidu.com/favicon.ico" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
::IE����Ĭ����������Ϊ�ٶ�
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes" /v "DefaultScope" /d "{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /f
::IE�����������
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\{64AF4D11-6492-4C25-B014-B6C6CEE3B0C5}" /v "SortIndex" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\jd" /v "SortIndex" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\taobao" /v "SortIndex" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\sogou" /v "SortIndex" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\SearchScopes\so" /v "SortIndex" /t REG_DWORD /d 5 /f
::IEɾ��������������
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes" /f >nul 2>nul
::IE���������������
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "DisplayName" /d "����" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "URL" /d "https://search.jd.com/Search?keyword={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\jd" /v "FaviconURLFallback" /d "https://www.jd.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "DisplayName" /d "�Ա�" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "URL" /d "https://s.taobao.com/search?q={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\taobao" /v "FaviconURLFallback" /d "https://www.taobao.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "DisplayName" /d "΢��" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "URL" /d "http://weixin.sogou.com/weixin?type=2&ie=utf8&query={searchTerms}" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\sogou" /v "FaviconURLFallback" /d "http://weixin.qq.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "DisplayName" /d "360" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "URL" /d "http://www.so.com/s?q={searchTerms}&ie=utf-8" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "SuggestionsURL_JSON" /d "http://sug.so.360.cn/suggest?word={searchTerms}&encodein=utf-8&encodeout=utf-8&outfmt=json" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "FaviconURL" /d "http://www.so.com/favicon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes\so" /v "ShowSearchSuggestions" /t REG_DWORD /d 1 /f
::���á�ActiveX�ؼ�����JAVEС����ű�������ű����� https://blog.csdn.net/wangqiulin123456/article/details/17068649
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1001" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1004" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1200" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1201" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1208" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "120B" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1400" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1402" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1405" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1406" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1607" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2201" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2300" /t REG_DWORD /d 0 /f
rem ���û������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1609" /t REG_DWORD /d 0 /f
rem �رմ� ������ �ļ��ġ���ȫ���桱��Internetѡ�����Ӧ�ó���Ͳ���ȫ�ļ�ʱ����ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d 0 /f
::������� ������վ�㣨���ؾ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1" /v ":Range" /d "10.*.*.*" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2" /v ":Range" /d "192.168.*.*" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range3" /v "file" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range3" /v ":Range" /d "169.254.*.*" /f
::�ر�IE�İ�ȫ���ü�鹦��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t REG_DWORD /d 1 /f
::127.0.0.1 ieonline.microsoft.com
SET NEWLINE=^& echo.
attrib -r %WINDIR%\system32\drivers\etc\hosts
FIND /C /I "geo2.adobe.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 geo2.adobe.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "get3.adobe.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 get3.adobe.com>>%WINDIR%\system32\drivers\etc\hosts
FIND /C /I "ieonline.microsoft.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ieonline.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
attrib +r %WINDIR%\system32\drivers\etc\hosts
ipconfig /flushdns
::��ֹһ�����ʹ������
::reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 0 /f

:: ʹ�ã�Edge
::��ֹMicrosoft Edge���״����С���ӭҳ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t REG_DWORD /d 0 /f
::�ر�Adobe Flash���㼴��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t REG_DWORD /d 0 /f
::�ر�Edge�����ʱ��ʾ��Ҫ�ر����б�ǩҳ�𣿡�
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "AskToCloseAllTabs" /t REG_DWORD /d 0 /f
::ʹ��Microsoft�������б�
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BrowserEmulation" /v "MSCompatibilityMode" /t REG_DWORD /d 1 /f
::������ʾ��EDGE��ΪĬ�����������ʾ
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "DisallowDefaultBrowserPrompt" /t REG_DWORD /d 1 /f
::�������Ĳ˵�����ʾ���鿴Դ�ļ����͡����Ԫ�ء�
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\F12" /v "ShowPageContextMenuEntryPoints" /t REG_DWORD /d 1 /f
::������ҳΪ�ٶ�
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Protected - It is a violation of Windows Policy to modify. See aka.ms/browserpolicy" /v "ProtectedHomepages" /t REG_BINARY /d "0100000082bd47f63cee2b646408a2499fb68745e2b6ee5f1092a16d916c41581799e89d8bdf4eba27a838631c7a95dbaf7f94901afbba6e0ae4e29077159897ccbec31ae50ecdee6f3b73aff561a27b9ae9ba63955c37218cdf9f2b1fc35a180dd5f36cf86af02a9c46f56091dd424a78952f1e1bfb3d144b24b42ce69588c0631c5cfa91715652b904a6861f6b" /f
::ɾ������Microsoft Edge��ݷ�ʽ
set "reg=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders"
for /f "tokens=2*" %%a in ('reg query "%reg%" /v desktop') do set "desktop=%%b"
del /f /q "%desktop%\Microsoft Edge.lnk" >nul 2>nul
::��ֹ�����˻��д���Microsoft Edge��ݷ�ʽ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisableEdgeDesktopShortcutCreation" /t REG_DWORD /d 1 /f
::���� Internet Explorer�� Microsoft edge�ղؼ�ͬ����ϵͳĬ�ϲ�ͬ��,�����½΢���ʺŲ���IE��EDGEͬ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "SyncFavoritesBetweenIEAndMicrosoftEdge" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\MicrosoftEdge\Main" /v "SyncFavoritesBetweenIEAndMicrosoftEdge" /t REG_DWORD /d "1" /f

:: ʹ�ã���ȫ��
::�ر��û��˻�����(UAC)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
::ȥ��UACС����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
::�ر�Windows Defender Antivirus Service�������û���ֹ�������������Ǳ�ڵ����������(Windows Defender ��Ϊ�ֶ�����)
Reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SecurityHealth /f >nul 2>nul
::����Windows Defender ��ȫ���ķ���
reg add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 4 /f
::��δ��װͨ��΢��ע���ɱ�������¹ر�Windows Security Center
reg add "HKLM\SOFTWARE\Microsoft\Security Center\Feature" /v "DisableAvCheck" /t REG_DWORD /d 1 /f
::�ر�Windows Defender
taskkill /f /im MSASCuil.exe >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /d 1 /t REG_DWORD /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
::�ر�Smartscreenɸѡ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d "Off" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
::���ö������ɾ�����ߵ�Windows����
Reg Add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /V "DontOfferThroughWUAU" /T REG_DWORD /D 1 /F

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

::���ڷ���
sc config QQMusicService start= disabled > NUL 2>&1
sc config QiyiService start= disabled > NUL 2>&1
sc config wpscloudsvr start= disabled > NUL 2>&1

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

:: ϵͳ ���ر�Windows��־�ļ�
::wfpdiag.etl��־
netsh wfp set options netevents = off
::dirty shutdown event��־
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d 0 /f

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

::�ٳ�һЩ�޸���ҳ�ͺ�̨�����ƹ���ļ�
rem 2345
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345MiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicMiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Downloader_2345Explorer.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HaoZipHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wzdh2345.exe" /v Debugger /t REG_SZ /d "p" /f
rem 360
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\360wallpaper_360safe.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\360zipInst.exe" /v Debugger /t REG_SZ /d "p" /f
rem Baofeng
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFBrowser.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFDesktopTips.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFpop.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\InfoTips.exe" /v Debugger /t REG_SZ /d "p" /f
rem Chrome
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe" /v Debugger /t REG_SZ /d "p" /f
rem Flash
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FlashHelperService.exe" /v Debugger /t REG_SZ /d "p" /f
rem iQIYI
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QyFragment.exe" /v Debugger /t REG_SZ /d "p" /f
rem KingSoft
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_duba.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_ksafe.exe" /v Debugger /t REG_SZ /d "p" /f
rem wps
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\desktoptip.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wpsnotify.exe" /v Debugger /t REG_SZ /d "p" /f
rem DriverGenius
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kbasesrv_setup.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kdsminisite.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kinstallsoftware.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kminisite.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kminisitebox.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kybox.exe /v Debugger /t REG_SZ /d "p" /f
rem KingSoft-iciba
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ksddownloader.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ktpcntr.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\minisite.exe" /v Debugger /t REG_SZ /d "p" /f
rem Sogou
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SohuNews.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SogouCloud.exe" /v Debugger /t REG_SZ /d "p" /f
rem QQ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QQPcmgrDownload.exe" /v Debugger /t REG_SZ /d "p" /f
rem TaoBao
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Dandelion.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DandelionSetup.exe" /v Debugger /t REG_SZ /d "p" /f
rem Pops
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\KuaizipUpdate.exe" /v Debugger /t REG_SZ /d "p" /f
rem Glarysoft
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GUDownloader.exe" /v Debugger /t REG_SZ /d "p" /f

cls
echo ���²���
gpupdate /force 
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
ping -n 3 127.0.0.1>nul
rem �ر�explorer.exe
taskkill /f /im explorer.exe
rem ����ϵͳͼ�껺�����ݿ�
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
del /f "%userprofile%\AppData\Local\IconCache.db"
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"
rem ���� ϵͳ���̼����ͼ��
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream
rem ��explorer
start explorer
exit
