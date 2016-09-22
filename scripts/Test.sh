@echo off
set workspace=E:\workspaceEclipse
::Las variables de entorno se pueden configurar directamente en Windows cuando se tienen los permisos necesarios
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_25
set M2_HOME=E:\workspaceEclipse\apache-maven-3.3.9
echo -----------------------------------------
echo ".(C) MIW"
echo -----------------------------------------
echo .
echo Workspace --- $workspace
echo .
cd $workspace
echo "============ mvn clean test (profile: develop) ======================================================="
echo .
mvn clean test
exit

