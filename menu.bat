@echo off

@echo.
@echo Buildtools Updater v.0.11-Beta
@echo.

:menu
@echo Type a command or type "help" for help. 
Set /P "_1=/" || Set _1=NothingChosen
If "%_1%"=="NothingChosen" goto :menu
If /i "%_1%"=="run" goto run
If /i "%_1%"=="help" goto help
If /i "%1%"=="bungee" goto bungee
If /i "%_1%"=="plugin" goto plugin
If /i "%_1%"=="exit" goto exit

:run
@echo.
start "Run command" /b files/run.sh
@echo.
goto menu

:help
@echo.
@echo ------------------[Help Menu]------------------
@echo /run - Updates and runs Buildtools
@echo /help - Launches help menu
@echo /bungee - Updates BungeeCord and its modules
@echo /plugin - fixes plugin contained in config
@echo /exit - Exits batch file
@echo.
@echo ------------------[Help Menu]------------------
@echo.
goto menu

:plugin
@echo.
start "plugin command" /b files/plugin.sh
@echo.
goto menu

:bungee
if exist bungee/ (@echo Folder Bungeecord exists) else (@echo Couldnt find folder bungee. Generating folder...
md bungee
md bungee/modules

powershell -command Invoke-WebRequest -Uri https://raw.githubusercontent.com/Legoman99573/Buildtools-Updater-Recode/master/bungee/bungee.sh -OutFile bungee/bunger.sh
)
start "Bungee command" /b bungee/bungee.sh
goto menu

:exit
@echo Thanks for using Buildtools Updater v.0.11-Beta by Legoman99573
@echo.
@echo Contributors: NatoBoram
@pause
exit
