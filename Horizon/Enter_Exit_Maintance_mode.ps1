#Import Modules
Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryServiceService' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryDefinition' | Import-Module

#Hoizon Variables
$user = ${env:user}
$pswd = ${env:pass}

#Horizon 
$connection = ${env:connnection_server}
$virtualMachine = ${env:VMName}
$ActionRequired = ${env:action}

try{
  
#Connect to the Horizon Server
$hvserver1 = Connect-HVServer -server $connection -User $user -Password $pswd -ErrorAction Stop 
$Services1 = $hvserver1.ExtensionData

if($ActionRequired -eq 'EnterMaintenance') {
    Set-HVMachine -MachineName $virtualMachine -Maintenance:ENTER_MAINTENANCE_MODE
}

elseif($ActionRequired -eq 'ExitMaintenance'){
    Set-HVMachine -MachineName $virtualMachine -Maintenance:EXIT_MAINTENANCE_MODE
}
Disconnect-HVServer -Server $connection -Force -Confirm:$false
}
catch {
Write-Host "Issue with Connection to Server $connection"
}
