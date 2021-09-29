Add-Type -AssemblyName System.Windows.Forms

while ($true)
{
    [System.Windows.Forms.SendKeys]::SendWait("{PGUP}")
    Start-Sleep -Seconds 10
    [System.Windows.Forms.SendKeys]::SendWait("{PGDN}")
    Start-Sleep -Seconds 20
}
