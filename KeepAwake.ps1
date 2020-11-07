param($minutes = 60)

$myshell = New-Object -com "Wscript.Shell"

for ($1 = 0; $i -lt $minutes; $i++) {
    Start-Sleep -Seconds 60
    $myshell.sendkeys(".")
}