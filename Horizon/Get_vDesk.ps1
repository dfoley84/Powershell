#Import Modules
Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module
 
#Hoizon Variables
$user = ${env:user}
$pswd = ${env:pass}
 
#Horizon Brokers
$items =  

#Remove Old CSV File if exists
$fileToCheck = "C:\Scripts\HorizonDesk.csv"
if (Test-Path $fileToCheck -PathType Leaf)
{
    Remove-Item $fileToCheck
}
 
#Looping Over Horizon Broker
foreach($item in $items) {
 
#Using Try Catch
try {  
#Try to Connect to Horizon Server Stop if Error
Connect-HVServer -Server $item -User $user -Password $pswd -ErrorAction Stop 
$vms = Get-HVMachineSummary #Get Machine Summary 
$results = @() #Array
 
#Loop over each items 
foreach($vm in $vms) {
$MachineUser = $vm.NamesData.UserName

if(!$MachineUser){
     $properties = @{
     HorizonServer = $item
     MachineName = $vm.Base.Name
     UserName = 'NotSet'
     MachineFQDN = $vm.Base.DnsName
     AgentVersion = $vm.Base.AgentVersion
     VDIPool = $vm.NamesData.DesktopName
     MachineStatus = $vm.Base.BasicState
     OSVersion = $vm.Base.OperatingSystem
}
$results += New-Object psobject -Property $properties
}
else{
     #List out properties 
     $properties = @{
      HorizonServer = $item
     MachineName = $vm.Base.Name
     UserName = $MachineUser
     MachineFQDN = $vm.Base.DnsName
     AgentVersion = $vm.Base.AgentVersion
     VDIPool = $vm.NamesData.DesktopName
     MachineStatus = $vm.Base.BasicState
     OSVersion = $vm.Base.OperatingSystem
}
$results += New-Object psobject -Property $properties
}
}#closing $vm in $vms
 
#Export Results to CSV File
$results | export-csv -NoTypeInformation -path c:\Scripts\HorizonDesk.csv -append
$results = @()#Empty Array
Disconnect-HVServer -Server $item -Confirm:$false
}
 
catch {
#Catch Error Write out to Console
 Write-Host "Issue with Connection to Server $item"
}
 
finally {
#Move to the Next Item in the List
 Write-Host "Connected Moving onto Next Horizon Broker"
}
 
}
