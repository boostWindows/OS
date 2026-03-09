Start-Process calc
Start-Process microsoft.windowsstore:
Start-Process microsoft-edge:
Start-Process notepad
Start-Transcript -Path "C:\sysDev\assets\log.txt" -Append
try {
    # Qui il tuo script
} catch {
    Write-Error $_
}
Stop-Transcript
