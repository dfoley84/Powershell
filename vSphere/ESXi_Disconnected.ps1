Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$vCenterCreds = Import-clixml -path /home/jenkins/workspace/imports/cred.cred

$vCenter_Servers = 
$Disconnected = @() #Array


foreach($vCenter in $vCenter_Servers) {
Connect-VIServer -Server $vCenter -Credential $vCenterCreds
$esx = Get-VMHost -PipelineVariable esx -Server $vCenter |  Where-Object {$_.ConnectionState -eq 'Disconnected'} 
$Disconnected += $esx | Select-Object -ExpandProperty Name

foreach($CreateTicket in $Disconnected) {
$CreateTicket

$SMTPBODY =
@"
    Hi Team,
    ESXi Checks have Found That the Following ESXi Host Machine Seems to have a Status of Disconnected:
    ESXi Host: $CreateTicket
    vCenter: $vCenter
    Can we Please verify the Status of This ESXi Host.
    Thanks.
"@

Send-MailMessage -SmtpServer '' -From  -To  -Cc  -Subject 'ESXi Host in Disconnected State' -Body $SMTPBody

    }

$Disconnected = @() #Array
Disconnect-VIServer -Server $vCenter -Confirm:$False

}
