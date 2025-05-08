$contenuto = @'
"Funziona! $(Get-Date)" | Out-File -FilePath "C:\prova_output.txt" -Append
'@

$contenuto | Out-File "C:\ciao.ps1"

$scriptPath = "C:\ciao.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Daily -At 11:30PM
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcess" -Action $action -Trigger $trigger -Principal $principal
