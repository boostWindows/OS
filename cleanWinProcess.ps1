$contenuto = @'
Write-Host "Ciao dal mio script PowerShell!"
Start-Sleep -Seconds 2
Write-Host "Script completato."
'@

Set-Content -Path "C:\temp\ciao.ps1" -Value $contenuto


$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\temp\ciao.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 11:00PM
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "EseguiScriptOgniMattina" -Action $action -Trigger $trigger -Principal $principal
