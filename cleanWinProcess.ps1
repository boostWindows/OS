$contenuto = @'
Write-Host "Ciao dal mio script PowerShell!"
Start-Sleep -Seconds 2
Write-Host "Script completato."
'@

$contenuto | Out-File "C:\temp\ciao.ps1"


$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\temp\ciao.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 11:00PM
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "EseguiScriptOgniMattina" -Action $action -Trigger $trigger -Principal $principal
