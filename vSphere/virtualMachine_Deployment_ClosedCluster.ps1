#Read Text File to of vCenters to an Array
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$vCenter_Servers = 
$vCenterCreds = Import-clixml -path /home/jenkins/workspace/imports/cred.cred

#Email Variables
$SMTPServer = 
$EMAILRECIPIANT = 
$cc = 
$From = 
$Subject = 'Virtual Machine Deployed to Closed Cluster'

#Get-Date
$now = Get-Date
$start = $now.AddDays(-1)

#Arrays lists
$deploymentChains = @()
$deployedvms = @()
$newVmarray = @()
$results = @()
$NewVM = @()


#Limits 
$vmCPU = 8
$vmMemory = 32

#REGEX
$regex = [regex] 'CLOSED-RESERVED$'
$regex1 = [regex] 'CLOSED$'

#Remove Old CSV File
$fileToCheck = "/home/jenkins/Reporting/closedcluster.csv"
if (Test-Path $fileToCheck -PathType Leaf)
{
    Remove-Item $fileToCheck
}

#Looping Over Array of vSphere Servers
foreach($item in $vCenter_Servers) { 
#Connect to vCenter
Connect-VIServer -Server $item -Credential $vCenterCreds
Write-Host "Currently Connected to vSphere: "$item

#Getting the Event For Newly Deployed Machines within
$events = Get-VIEvent -Types Info -Start $start -Finish $now -MaxSamples ([int]::MaxValue) -Server $srv 

#Searching for Events with Creating or Deployed
  $deployments = $events | where {$_ -is [Vmware.vim.VmCreatedEvent] }

#Looping Over Each Event
foreach($deployment in $deployments){
$dataObj = "" | Select-Object events
$dataObj.events = $events | Where-Object {$_.ChainID -eq $deployment.ChainID}
$deploymentChains += $dataObj
}


foreach($chain in $deploymentChains) {
#Getting Virtual Machine Name in the Events
$newVM = ($chain.events.vm.name) #Removed $chain.events[*].vm.Name due to position of Event in Some vSphere Environments
$Exists = get-vm -name $newVM -ErrorAction SilentlyContinue

if($Exists){
    $deployedvms += $Exists | Where {$deployedvms -notcontains $_} 
}else{
    #Do Nothing
}
  
}
  

  
foreach($vm in $deployedvms) {
$cluster = Get-Cluster -VM $vm | Select Name -ExpandProperty Name
  
if($cluster -match $regex -or $cluster -match $regex1){
    	$userevent = Get-VIEvent -Entity $vm -Start $start -Finish $now | where {$_ -is [Vmware.vim.VmCreatedEvent]  } | select UserName -ExpandProperty UserName 
    	$creationTime = Get-VIEvent -Entity $vm -Start $start -Finish $now | where {$_ -is [Vmware.vim.VmCreatedEvent] }| select CreatedTime -ExpandProperty CreatedTime 
        $EventType = Get-VIEvent -Entity $vm -Start $start -Finish $now | where {$_ -is [Vmware.vim.VmCreatedEvent]  } | select FullFormattedMessage -ExpandProperty FullFormattedMessage 

    $result = "" | select vmName,VMHost,Powerstate,NumCpu,MemoryGB
        $result.vmName = $vm.Name
        $result.ESXname = $VM.VMHost
        $result.Powerstate = $vm.Powerstate
        $result.NumCpu = $vm.NumCpu
        $result.MemoryGB = $vm.MemoryGB
  		$result | add-member -MemberType NoteProperty -name 'Cluster' -Value $cluster
  		$result | add-member -MemberType NoteProperty -name 'vCenter' -Value $item
    	$result | add-member -MemberType NoteProperty -name 'UserName' -Value $userevent
    	$result | add-member -MemberType NoteProperty -name 'Creation' -Value $creationTime
    	$result | add-member -MemberType NoteProperty -name 'FullMessage' -Value $EventType
  		$results += $result  
}
  
} #Ending foreach($newvms in $deployedvms)
  
$deploymentChains = @()
$deployedvms = @()
Disconnect-VIServer -Server $item -confirm:$false -Force
  
} #Ending vCenter Loop

foreach($vms in $results) {
$vms | Export-Csv -Path C:\Scripts\ClosedCluster.csv -NoTypeInformation -UseCulture -append
}


#Sending Email if CSV Files Exists
$fileToCheck = "/home/jenkins/Reporting/closedcluster.csv"
if (Test-Path $fileToCheck -PathType Leaf)
{

$SMTPMessage = @{
To = $EMAILRECIPIANT
Cc = $cc
From = $From
Subject = $Subject
Smtpserver = $SMTPServer
}

$SMTPBODY = 
@"
Hi Team,
  
 Please Find, Report on Virtual Machines Created within a Closed Cluster within the last 24 hours.
"@

Send-MailMessage @SMTPMessage -Body $SMTPBody -Attachments $fileToCheck
}
