@echo off

rem Thanking NatoBoram for a better run script (Credited from spigot)

echo BuildTools
powershell -command Invoke-WebRequest -Uri https://hub.spigotmc.org/jenkins/job/BuildTools/lastBuild/artifact/target/BuildTools.jar -OutFile BuildTools.jar
java -jar BuildTools.jar --rev latest

echo Spigot-API
powershell -command Invoke-WebRequest -Uri https://github.com/SpigotMC/Spigot-API/archive/master.zip -OutFile Spigot-API.zip
7z x Spigot-API.zip
rm Spigot-API.zip
cd Spigot-API-master
mvn clean install

exit
