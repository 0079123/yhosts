:grd
@SET CURRENTDIR=%cd%
@cd..
@SET win=%cd%\win
@cd %CURRENTDIR%
rem "%win%\wget.exe" -c --no-check-certificate -O grd.txt https://raw.githubusercontent.com/racaljk/hosts/master/hosts -e use_proxy=yes -e http_proxy=127.0.0.1:9666
"%win%\wget.exe" -c --no-check-certificate -O grd.txt https://raw.githubusercontent.com/racaljk/hosts/master/hosts
rem "%~dp01win\curl.exe" https://raw.githubusercontent.com/racaljk/hosts/master/hosts > grd.txt
rem ɾ��ǰ13��ע������
"%win%\sed.exe" -i "1,13d" grd.txt
rem ɾ���������
rem "%win%\sed.exe" -i "/googlesyndication/d" grd.txt
"%win%\sed.exe" -i "/googleadservices/d" grd.txt
rem "%win%\sed.exe" -i "/127.0.0.1/d" grd.txt
rem ɾ������#ע����
"%win%\sed.exe" -i "/^#/d" grd.txt
rem ��TAB���滻Ϊ�ո��
"%win%\sed.exe" -i "s/\t/ /g" grd.txt
rem ɾ������
"%win%\sed.exe" -i "/^$/d" grd.txt
rem ���������Ϣ
"%win%\sed.exe" -i "1i\@racaljk/hosts" grd.txt
move /y grd.txt "%~dp0..\"
goto :eof
