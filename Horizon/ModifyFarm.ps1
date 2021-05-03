Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryServiceService' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryDefinition' | Import-Module

Import-Module VMware.Hv.Helper
#Hoizon Variables
$user = ${env:user}
$pswd = ${env:pass}


$Connection = ${env:connection_server}
$poolName = ${env:pool}
$default_display_protocols = ${env:default_display_protocol}

$reset_for_user = ${env:reset_for_users}
$user_coll = ${env:usercollaboration}



$Connection = Connect-HVServer -Server $Connection -User $user -Password $pswd
$capture = $Connection.ExtensionData


#Setting Display Protocol Settings 
Set-HVFarm -FarmName $poolName -Key 'data.displayProtocolSettings.defaultDisplayProtocol' -Value $default_display_protocols 

if($reset_for_user -eq 'true') {
Set-HVFarm -FarmName $poolName -Key 'data.displayProtocolSettings.allowDisplayProtocolOverride' -Value $true
} 
else {
Set-HVFarm -FarmName $poolName -Key 'data.displayProtocolSettings.allowDisplayProtocolOverride' -Value 0
}


if($user_coll -eq 'true') {
Set-HVFarm -FarmName $poolName -Key 'data.displayProtocolSettings.enableCollaboration' -Value $true
}
else{
Set-HVFarm -FarmName $poolName -Key 'data.displayProtocolSettings.enableCollaboration'  -Value 0
}

Disconnect-HVServer -server $Connection -Force -Confirm:$false
