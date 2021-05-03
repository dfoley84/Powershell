Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$creds = Import-clixml -path /home/jenkins/workspace/imports/cred.cred

#Get-Date
$now = Get-Date
$start = $now.AddDays(-30)

#Email Variables
$SMTPServer = 
$EMAILRECIPIANT = 
$cc = 
$From = 
$Subject = 'ESXi Maintance Mode'


$esxiHosts = Import-CSV /home/jenkins/workspace/imports/vSphereTickets.csv
$location = "/home/jenkins/workspace/imports/vSphereTickets.csv"
$PSEmailServer = 'smtphost.qualcomm.com'
$MaintanceMode = @() #Array
$Ticket = @() #Array
$NoTicket = @() #Array


$vCenter_Servers = 

foreach($ESXI in $esxiHosts){
 $Ticket += $ESXI | Select-Object -ExpandProperty Name
}

foreach($Server in $vCenter_Servers) {
Connect-VIServer -Server $Server -Credential $creds


Get-VMHost -PipelineVariable esx -Server $Server |  Where-Object {$_.ConnectionState -eq 'Maintenance'} |

ForEach-Object -Process {

$maintEntered = Get-VIEvent -Entity $esx -Start $start -MaxSamples ([int]::MaxValue) -Server $Server |
Where-Object{$_ -is [VMware.Vim.EnteredMaintenanceModeEvent]} #Getting Tasks from ESXi

if($maintEntered){ 
    #Skipping vCenter has Task for MaintenanceMode

}else{
$MaintanceMode += $esx | Select-Object -ExpandProperty Name 
      
 }
}


#Any Element in Array MaintanceMode not in Array Ticket Add to Array NoTicket
$NoTicket += $MaintanceMode | Where {$Ticket -notcontains $_} 
foreach($CreateTicket in $NoTicket) {
$CreateTicket

$SMTPMessage = @{
To = $EMAILRECIPIANT
From = $EMAILRECIPIANT
Cc = $cc
Subject = $Subject
Smtpserver = $SMTPServer
}

$SMTPBODY = 
@"
Hi Team,
ESXi Checks have Found That the Following ESXi Host Machine Seems to be placed into Maintance for Over 30Days:
ESXi Host: $CreateTicket
vCenter: $Server
Can we Please verify the Status of This ESXi Host and see if this can be Taken Out Of Maintance Mode.
Thanks.
"@


Send-MailMessage @SMTPMessage -Body $SMTPBody
Add-Content -Path $location -Value $CreateTicket #Adding ESXi Host To File, These will be skipped on Next Run
}

Disconnect-VIServer -Server $Server -Confirm:$False
$NoTicket = @()
$MaintanceMode = @()

} #Ending ForEach Loop
