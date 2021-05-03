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
$AssignedUser = ${env:user}


#Connect to the Horizon Server

$hvserver1 = Connect-HVServer -server $connection -User $user -Password $pswd
$Services1 = $hvserver1.ExtensionData


Remove-HVMachine -MachineNames $virtualMachine -DeleteFromDisk:$true -Confirm:$false


#Remove-HVEntitlement -ResourceName $DesktopPool -User $AssignedUser -ResourceType Desktop -Type User
Disconnect-HVServer -Server $connection -Force -Confirm:$false

