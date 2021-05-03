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
$virtualMachine  = ${env:VMName}
$username = ${env:userName}


#Connect to the Horizon Server
$hvserver1 = Connect-HVServer -server $connection -User $user -Password $pswd 
$Services1 = $hvserver1.ExtensionData

#Get User ID 
$queryService = New-Object VMware.Hv.QueryServiceService
$defn = New-Object VMware.Hv.QueryDefinition
$defn.queryEntityType = 'ADUserOrGroupSummaryView'
$defn.filter = New-Object VMware.Hv.QueryFilterEquals -property @{'memberName'='base.name'; 'value' = $userName}
$userid=($queryService.queryservice_create($Services1, $defn)).results[0].id

#Get Machine Info
$machineid = (Get-HVMachine -MachineName $virtualMachine).id

#ReassignUser to VDesk
$Services1.Machine.Machine_assignUsers($machineid, $userid)

Disconnect-HVServer -Server $connection -Force -Confirm:$false
