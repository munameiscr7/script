:��ҵ��dns�Զ��޸Ľű�
@echo off
title �Զ��޸�DNS
:MENU
ECHO.
ECHO.               =-=-=-=-=�˵�ѡ��=-=-=-=-=
ECHO.                       1  �޸�Ϊ��˾����DNS
ECHO.                       2  �ָ�ΪDHCP�·�DNS
ECHO.                       0  �˳�
ECHO.
ECHO.               =-=-=-=-=-=-=-=-=-=-=-=-=
ECHO.
set /p  ID=������ѡ����Ŀ����ţ�����1��2��0����
if "%id%"=="1" goto cmd1
if "%id%"=="2" goto cmd2
if "%id%"=="0" exit

:cmd1
netsh interface ip set dnsservers "��̫��" static 192.168.1.1 primary
netsh interface ip add dnsservers "��̫��" 192.168.1.2 index=2
netsh interface ip set dnsservers "WLAN" static 192.168.1.1 primary
netsh interface ip add dnsservers "WLAN" 192.168.1.2 index=2
ipconfig /flushdns
goto MENU

:cmd2
netsh interface ip set dnsservers "��̫��" source=dhcp
netsh interface ip set dnsservers "WLAN" source=dhcp
ipconfig /flushdns
goto MENU