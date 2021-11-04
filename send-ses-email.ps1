# Define username and password
$smtpUserName = '****SMTP USER NAME HERE****'
$smtpPassword = ConvertTo-SecureString '****SMTP PASSWORD HERE****' -AsPlainText -Force

# Convert to SecureString
[pscredential]$credential = New-Object System.Management.Automation.PSCredential ($smtpUserName, $smtpPassword)

# Send Email - change the values if needed.
Send-MailMessage -Credential $credential `
-useSSL `
-smtpServer 'email-smtp.us-east-1.amazonaws.com' `
-port 587 `
-from '****FROM EMAIL HERE****' `
-to '****TO EMAIL ADRESS****' `
-subject `
'Email via Amazon SES SMTP Endpoint' `
-body 'Email via Amazon SES SMTP Endpoint'
