@echo off
set workspace=E:\workspaceEclipse
::Las variables de entorno se pueden configurar directamente en Windows cuando se tienen los permisos necesarios
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_25
set M2_HOME=E:\workspaceEclipse\apache-maven-3.3.9
echo -----------------------------------------
echo . Deploy Pre Production (C) MIW
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo .
echo .

cd %workspace%
:: Test en Develop
:: -ff, --fail-fast. Stop at first failure in reactorized builds
echo ============ mvn -ff clean test (profile: develop) =======================================================
echo .
call mvn -ff clean test
if errorLevel 1 goto errorDevelop

:: Install en Pre-Production
echo ============ mvn -Dmaven.test.skip=true package -Denvironment.type=preproduction =======================================================
echo .
call mvn -Dmaven.test.skip=true package -Denvironment.type=preproduction
if errorLevel 1 goto errorPreproduction

::call mvn -Dmaven.test.skip=true tomcat7:redeploy -Denvironment.type=preproduction. !!!Comentado, todavía no preparado

echo ============ mvn -Dmaven.test.skip=true verify -Denvironment.type=preproduction  =======================================================
echo .
call mvn -Dmaven.test.skip=true verify -Denvironment.type=preproduction 
if errorLevel 1 goto errorPreproduction

pause
exit

:errorDevelop
echo .
echo .
echo .
echo ########  ERRORES de test en Develop
pause
exit

:errorPreproduction
echo .
echo .
echo .
echo ########  ERRORES de Test de Integration en Pre-Produccion 
pause
exit
