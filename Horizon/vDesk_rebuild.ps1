#Import Modules
Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryServiceService' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryDefinition' | Import-Module

#Hoizon Variables
$user = ${env:user}
$pswd = ${env:pass}
$vdesk_user = ${env:assigned_user}
$connection = ${env:connection_server}
$virtualMachine = ${env:virtualMachine}

#Connect to the Horizon Server
$hvserver1 = Connect-HVServer -server $connection -User $user -Password $pswd 
$Services1 = $hvserver1.ExtensionData

#Remove AssignedUser
$machineservice = New-Object vmware.hv.machineservice
$machineid = (Get-HVMachine -MachineName $virtualMachine).id
$MachineInfo = $machineservice.read($Services1, $machineid)
$MachineInfo.getbasehelper().setuser($null)
$machineservice.update($Services1, $MachineInfo)



#Rebuild vDesktop
$machineservice = New-Object vmware.hv.machineservice
$machineid = (Get-HVMachine -MachineName $virtualMachine).id
$MachineInfo = $machineservice.read($Services1, $machineid)
$Services1.Machine.Machine_Rebuild($machineid)

Start-Sleep -s 180
#ReassignUser to VDesk
#Get User ID 
$queryService = New-Object VMware.Hv.QueryServiceService
$defn = New-Object VMware.Hv.QueryDefinition
$defn.QueryEntityType = 'ADUserOrGroupSummaryView'
$defn.Filter = New-Object VMware.Hv.QueryFilterEquals -Property @{'memberName'='base.name'; 'value' = $vdesk_user}
$userid = ($queryService.QueryService_Create($Services1, $defn)).Results[0].id
$Services1.Machine.Machine_assignUsers($machineid, $userid)
