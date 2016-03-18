@echo off

@echo This build is in beta and could break important files. Continue: 
Set /P _1=(Y, N) || Set _1=NothingChosen
If "%_1%"=="NothingChosen" goto :start
If /i "%_1%"=="Y" goto start
If /i "%_1%"=="y" goto start
If /i "%_1%"=="N" goto stop
If /i "%_1%"=="n" goto stop

:start
echo Launching Buildtools...
If exist /config (@echo found config Directory) else (@echo Config directory not found. Generating directory...
md config
)
If exist config/version.txt (@echo Config value "version" set to %v%) else (@echo vsersion.txt not found. Generating file...
powershell -command Invoke-WebRequest -Uri http://thegearmc.com/update/version.txt -OutFile config/version.txt
)
if exist config/plugin.txt (@echo plugin.txt found.) else (@echo plugin.txt was not found. Generating file...
powershell -command Invoke-WebRequest -Uri http://thegearmc.com/update/plugin.txt -OutFile config/plugin.txt
)
If exist menu.bat (@echo menu.bat was found) else (@echo menu.bat was not found. Generating file...
powershell -command Invoke-WebRequest -Uri https://raw.githubusercontent.com/Legoman99573/Buildtools-Updater-Recode/master/menu.bat -OutFile menu.bat
)
if exist files/bungee.sh (@echo bungee.sh was found) else (@echo bungee.sh was not found. Generating file...
powershell -command Invoke-WebRequest -Uri https://raw.githubusercontent.com/Legoman99573/Buildtools-Updater-Recode/master/files/bungee.sh -OutFile files/bungee.sh
)
if exist files/plugin.sh (@echo plugin.sh was found) else (@echo plugin.sh was not found. Generating file...
powershell -command Invoke-WebRequest -Uri https://raw.githubusercontent.com/Legoman99573/Buildtools-Updater-Recode/master/files/plugin.sh -OutFile files/plugin.sh
)

start "Buildtools Updater v.0.11-Beta" /max menu.bat

:stop
exit
