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


  
#Connect to the Horizon Server
connect-HVServer -server $connection -User $user -Password $pswd

reset-HVMachine -MachineName $virtualMachine -Confirm:$false

Disconnect-HVServer -Server $connection -Force -Confirm:$false
