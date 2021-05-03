#User Variables
$user = ${env:user}
$pswd = ${env:pass}
 
$items =

#Remove Old CSV File
$fileToCheck = "C:\Scripts\vCenterEnvironment.csv"
if (Test-Path $fileToCheck -PathType Leaf)
{
    Remove-Item $fileToCheck
}

foreach($item in $items) {
Connect-VIServer -Server $item -User $user -Password $pswd 
$report = @()
$vSphere = $item

foreach($vm in Get-View -ViewType Virtualmachine) {

    $vms = "" | Select-Object VMName, Hostname, IPAddress,OS,TotalCPU,TotalMemory,ToolsStatus
    $vms.VMName = $vm.Name 
    $vms.ToolsStatus = $vm.Guest.ToolsStatus
    $vms | add-member -MemberType NoteProperty -name 'vCenter' -Value $vSphere
    $vms.Hostname = $vm.guest.hostname
    $vms.IPAddress = $vm.guest.ipAddress
    $vms.OS = $vm.Config.GuestFullName
    $vms.TotalCPU = $vm.summary.config.numcpu
    $vms.TotalMemory = $vm.summary.config.memorysizemb
    $report += $vms

}

$report | Export-Csv $fileToCheck -NoTypeInformation -append
$report = @() #Empty Array 
Disconnect-VIServer -Server $item -Confirm:$false
}


