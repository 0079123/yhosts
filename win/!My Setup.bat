@ECHO OFF
rem 18:01 2018/7/17/�ܶ�
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
TITLE Windows 10 ѡ���������
COLOR 0a

:: ��ռ�����
mshta vbscript:clipboardData.SetData("text","")(close)

:: 1.�Ҽ��˵���Ӳ��֣�
::���:��ʾ/�����ļ�(��Shift��ʾ)
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
reg add "HKCR\Directory\Background\shell\SuperHidden" /v "Extended" /d "" /f
reg add "HKCR\Directory\Background\shell\SuperHidden\Command" /ve /d "WScript.exe C:\windows\SuperHidden.vbs" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 2 /f
::��ӣ�����Աȡ������Ȩ(��ȡTrustedInstallerȨ��)�����ļ��ϰ�סshift��ʾ��
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
::��ӣ��ļ����½���������Bat&CMD��
reg add "HKCR\.bat" /ve /d "batfile" /f
reg add "HKCR\.bat\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
reg add "HKCR\.bat\ShellNew" /v "NullFile" /d "" /f
::reg add "HKCR\.cmd" /ve /d "cmdfile" /f
::reg add "HKCR\.cmd\PersistentHandler" /ve /d "{5e941d80-bf96-11cd-b579-08002b30bfeb}" /f
::reg add "HKCR\.cmd\ShellNew" /v "NullFile" /d "" /f

::��ӣ��ļ����ü��±���
reg add "HKCR\*\shell\Noteped" /ve /d "�ü��±���" /f
reg add "HKCR\*\shell\Noteped" /v "icon" /d "imageres.dll,97" /f
reg add "HKCR\*\shell\Noteped\command" /ve /d "notepad.exe %%1" /f
::��ӣ��ļ���ע��(��)DLL/OCX�ļ�
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\dllfile\shell\ע�� DLL\Command" /ve /d "Regsvr32 /u %%1" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 %%1" /f
reg add "HKCR\ocxfile\shell\ע�� OCX\Command" /ve /d "Regsvr32 /u %%1" /f
::��ӣ��ļ��У�CMD����ͨ��
reg add "HKCR\folder\shell\cmd" /ve /d "�ڴ˴���������ʾ��" /f
reg add "HKCR\folder\shell\cmd" /v "icon" /d "shell32.dll,71" /f
reg add "HKCR\folder\shell\cmd" /v "Extended" /d "" /f
reg add "HKCR\folder\shell\cmd\command" /ve /d "cmd.exe /s /k pushd \"%%V\"" /f

:: 2.�Ҽ��˵������֣�
::�����ļ����½���
rem .BMP�ļ�
reg delete HKEY_CLASSES_ROOT\.bmp\ShellNew /f > NUL 2>&1
rem .��ϵ�� 
reg delete HKEY_CLASSES_ROOT\.contact\ShellNew /f > NUL 2>&1
rem .RAR�ļ�
reg delete HKEY_CLASSES_ROOT\.rar\ShellNew /f > NUL 2>&1
rem .RTF�ļ�
reg delete HKEY_CLASSES_ROOT\.rtf\ShellNew /f > NUL 2>&1
rem .ZIP�ļ�
reg delete HKEY_CLASSES_ROOT\.zip\ShellNew /f > NUL 2>&1
::�Ҽ��˵��������Կ���
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\ACE" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\NvCplDesktopContext" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxDTCM" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxOSP" /f > NUL 2>&1
reg delete "HKCR\Directory\Background\ShellEx\ContextMenuHandlers\igfxcui" /f > NUL 2>&1
::�Ҽ��˵��������ļ�������Windows 10 1709�����֣�
reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f > NUL 2>&1
::�Ҽ��˵��������ļ�����ԭ��ǰ�İ汾
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f > NUL 2>&1
::�Ҽ��˵��������ļ������������ѽ��
reg delete "HKCR\Msi.Package\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\exefile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
reg delete "HKCR\lnkfile\ShellEx\ContextMenuHandlers\Compatibility" /f > NUL 2>&1
::�Ҽ��˵��������ļ���ͼƬ��ʹ�û�ͼ3D���б༭
reg delete "HKCR\SystemFileAssociations\.bmp\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\Shell\3D Edit" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\Shell\3D Edit" /f > NUL 2>&1
::�Ҽ��˵��������ļ���ͼƬ������������ת
reg delete "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.dds\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.jxr\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.pdd\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.psb\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.psd\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.rle\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f > NUL 2>&1
::�Ҽ��˵��������ļ���ͼ����Ƶ����Ƶ��������ʽ�Ҽ������ŵ��豸
reg delete "HKCR\SystemFileAssociations\image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mkv\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.mp4\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\.m4v\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Image\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
reg delete "HKCR\SystemFileAssociations\Directory.Video\shellex\ContextMenuHandlers\PlayTo" /f > NUL 2>&1
::�Ҽ��˵��������ļ����̶�����ʼ��Ļ
reg delete "HKCR\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
::�Ҽ��˵������������ļ��У�������Bitlocker���Ҽ��˵�
reg delete "HKCR\Drive\shell\encrypt-bde" /f > NUL 2>&1
reg delete "HKCR\Drive\shell\encrypt-bde-elev" /f > NUL 2>&1
::�Ҽ��˵������������ļ��У����̶������ٷ��ʡ�
reg delete "HKCR\Folder\shell\pintohome" /f > NUL 2>&1
::�Ҽ��˵������������ļ��У������������С�
reg delete "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /f > NUL 2>&1
::�Ҽ��˵������������ļ��У����������Ȩ�ޡ�����������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{F81E9010-6EA4-11CE-A7FF-00AA003CA9F6}" /d "" /f
::�Ҽ��˵��������ϴ����ٶ����̣��ϴ���WPS�ĵ�
reg delete "HKCR\*\shellex\ContextMenuHandlers\qingshellext" /f > NUL 2>&1
reg delete "HKCR\*\shellex\ContextMenuHandlers\YunShellExt" /f > NUL 2>&1
::�Ҽ��˵������أ������ļ���ʽ���Ҽ�����ӡ�����ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\image\shell\print" /v "Extended" /d "" /f
reg add "HKCR\batfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\cmdfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\regfile\shell\print" /v "Extended" /d "" /f
reg add "HKCR\txtfile\shell\print" /v "Extended" /d "" /f
::�Ҽ��˵������أ�ͼƬ�Ҽ����༭�����ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\image\shell\edit" /v "Extended" /d "" /f
::�Ҽ��˵������أ�ͼƬ�Ҽ�������Ϊ���汳�������ļ��ϰ�סshift��ʾ��
reg add "HKCR\SystemFileAssociations\.jpg\shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.png\shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.bmp\shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.tif\shell\setdesktopwallpaper" /v "Extended" /d "" /f
reg add "HKCR\SystemFileAssociations\.gif\shell\setdesktopwallpaper" /v "Extended" /d "" /f

:: 3.�ҵĵ��ԡ��ļ��е������֣�
::���ҵĵ���ȡ����ʾ7���ļ���
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
::���ļ���Դ������ʱ�򿪣��˵���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
::���ڡ����ٷ��ʡ�����ʾ���ʹ�õ��ļ���ɾ�����ʼ�¼��
del /f /s /q "%userprofile%\recent\*.*" > NUL 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
::���ڡ����ٷ��ʡ�����ʾ�����ļ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f
::��ʾ��֪�ļ����͵���չ��
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "HideFileExt" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
::�ڱ���������ʾ����·��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f

:: 4.������������ã�
::��������ʱ����ʾ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d 1 /f
::����������ʾ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
::������Cortana����Ϊ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
::�ϲ���������ť:�Ӳ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 2 /f
::����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d 0 /f

:: 5.���桢ͼ��������֣�
::��������ʾ �����-�˵��ԣ��ҵĵ��ԣ�
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0
::��������ʾ �����ļ���-�û����ҵ��ĵ���
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d 0
::��������ʾ ����վ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0
::���������� ����
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d 1
::��������ʾ �������
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /f /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 0
::�����½�ȥ����ݷ�ʽ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t REG_BINARY /d 00000000 /f
::ɾ������վ�Ҽ����̶�����ʼ��Ļ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f > NUL 2>&1
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
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\1Home" /ve /d "�򿪰ٶ���ҳ(&B)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\1Home\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\" https://www.baidu.com/?tn=baiduhome" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\2Nohome" /ve /d "�򿪿հ���ҳ(&H)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\2Nohome\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\" -nohome" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\3Private" /ve /d "��˽���ģʽ(&P)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\3Private\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\" -private" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\4NoAddOns" /ve /d "�޼���������(&N)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\4NoAddOns\Command" /ve /d "\"C:\Program Files\Internet Explorer\iexplore.exe\" -extoff" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\5History" /ve /d "ɾ����ʷ��¼(&S)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\5History\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\" InetCpl.cpl,ClearMyTracksByProcess 255" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\6Clean" /ve /d "ɾ����ʱ�ļ�(&T)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\6Clean\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\" InetCpl.cpl,ClearMyTracksByProcess 8" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\7Set" /ve /d "Internet ����(&R)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\7Set\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\" C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\inetcpl.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\8Connection" /ve /d "������������(&X)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\8Connection\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\" C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\Inetcpl.cpl,,4" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\9Net" /ve /d "��������ѡ��(&W)" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\shell\9Net\Command" /ve /d "\"C:\Windows\System32\rundll32.exe\" C:\Windows\System32\shell32.dll,Control_RunDLL C:\Windows\System32\ncpa.cpl" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /ve /d "C:\Windows\System32\ieframe.dll,-190" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "HideAsDeletePerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0 /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "HideFolderVerbs" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "WantsParseDisplayName" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "HideOnDesktopPerUser" /d "" /f
reg add "HKCR\CLSID\{00000000-0000-0000-0000-100000000001}\ShellFolder" /v "ParseDisplayNameNeedsURL" /d "" /f
::�����洴���������п�ݷ�ʽ
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

:: 6.������������
::127.0.0.1 ieonline.microsoft.com
SET NEWLINE=^& echo.
attrib -r %WINDIR%\system32\drivers\etc\hosts
FIND /C /I "ieonline.microsoft.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ieonline.microsoft.com>>%WINDIR%\system32\drivers\etc\hosts
attrib +r %WINDIR%\system32\drivers\etc\hosts
::��ֹIE�Զ����¼��
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoUpdateCheck" /t REG_DWORD /d 1 /f
::����Internet Explorer���Ͻǵ�Ц��������ť
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t REG_DWORD /d 1 /f
::����IE��ҳ
reg delete "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /f >nul 2>nul
::����IE���������ʱ�򿪵���ҳ
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /d "about:blank" /f
::����IEĬ����ҳDefault_Page_URL
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /d "about:blank" /f
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
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\SearchScopes" /f
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

:: 7.΢��ƴ�����뷨����ѡ��
::΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
::�رմ����л�ȡ��ѡ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
::�رմ����л�ȡ��ֽ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableLiveSticker" /t REG_DWORD /d 1 /f
::�ر�ģ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f
::�ر���ʾ�´��ȴ���������ʾ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t REG_DWORD /d 0 /f

:: 8.��ʼ�˵��Լ�Windows����
::�ر�����ʱ��Windows �۽��ƹ�
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
::�رա�ʹ��Windowsʱ��ȡ���ɺͽ��顱
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
::�ر��̵�Ӧ���ƹ�
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
::��ֹ�ڿ�ʼ�˵���ʾ����
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
::��ֹ�Զ���װ�Ƽ���Ӧ�ó���
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
::�ر�Microsoft���������飨��ֹ�Զ���װ��Ϸ��Ӧ�ã�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
::�ر��¼�׷��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /t REG_DWORD /d 0 /f

:: 9.ϵͳAPPĬ�����������
::���±���ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
::���±��Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f
::���̼�ס�ϴ�NumLock״̬
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /d "2" /f
::�˳�����ʱ�Զ������ڴ��е�DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDll /t REG_DWORD /d 00000001 /f
::�Զ��ر�ֹͣ��Ӧ�ĳ���
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /f
::���ٹػ�ǰ�ĳ���ȴ�
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "HungAppTimeout" /d "200" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v "WaitToKillAppTimeout" /d "1000" /f
::ִ�йػ�ʱǿ���˳�Ӧ�ó��򣨹ػ�ʱǿɱ��̨���ȴ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
::�ڿ��������� �༭ע��� ��
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "�༭ע���" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "InfoTip" /d "��ע���༭��" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "System.ControlPanel.Category" /d "5" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\DefaultIcon" /ve /d "%%SystemRoot%%\regedit.exe" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\Shell\Open\command" /ve /d "regedit" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "���ע���༭��" /f

:: 10.�������õ��� My Opt
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
::����������
attrib -s -h -r "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" 1>nul 2>nul
attrib -s -h -r "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
del /f /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" 1>nul 2>nul
del /f /q "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\*.*" 1>nul 2>nul
::Windows Defender ��Ϊ�ֶ�����
Reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v WindowsDefender /f >nul 2>nul
Reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SecurityHealth /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
::��ֹ�򿪽ٳ�һЩ�޸���ҳ�ͺ�̨�����ƹ���ļ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345MiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicMiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Downloader_2345Explorer.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HaoZipHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\KuaizipUpdate.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QQPcmgrDownload.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_duba.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_ksafe.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wzdh2345.exe" /v Debugger /t REG_SZ /d "p" /f

cls
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
exit
