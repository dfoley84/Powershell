#Import Hoizon View Modules
Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module

$username=${env:user}
$password=${env:pass}
$requester=${env:requester}
$poolname=${env:nodepool}
$machinename=${env:machine}
$Server=${env:horizonserver}

#Connect to vCenter
$hvserver1= Connect-HVServer -Server $Server -User $username -Password $password
$Services1= $hvServer1.ExtensionData
#Add Machine to vDesk Pool
add-hvdesktop -poolname $poolname -machines $machinename -user $requester




