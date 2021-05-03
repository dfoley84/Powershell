#vCenter Variables
$user = ${env:user}
$pswd = ${env:pass}

$FileName = 'C:\Scripts\ClusterCPUResources.csv'
$stat = 'cpu.usagemhz.average','mem.usage.average'


#Removing Old Data File

if (Test-Path $FileName) {
  Remove-Item $FileName
}


$start = (Get-Date).AddDays(-.025)
$vCenter_Servers = ""

foreach($vCenter in $vCenter_Servers){
Connect-VIServer -Server $vCenter -User $user -Password $pswd

foreach($cluster in Get-Cluster){
    Get-Stat -Entity $cluster -Stat $stat -Start $start |

    Group-Object -Property Timestamp |

    Sort-Object -Property Name |

    Select @{N='Cluster';E={$cluster.Name}},

        @{N='Time';E={$_.Group[0].Timestamp}},

        @{N='CPU_GHz_Capacity';E={$script:capacity = [int]($cluster.ExtensionData.Summary.TotalCPU/1000); $script:capacity}},

        @{N='CPU_GHz_Used';E={$script:used = [int](($_.Group | where{$_.MetricId -eq 'cpu.usagemhz.average'} | select -ExpandProperty Value)/1000); $script:used}},

        @{N='CPU_Free';E={[int](100 - $script:used/$script:capacity*100)}},

        @{N='Mem_Capacity_GB';E={$script:mcapacity = [int]($cluster.ExtensionData.Summary.TotalMemory/1GB); $script:mcapacity}},

        @{N='Mem_Used_GB';E={$script:mused = [int](($_.Group | where{$_.MetricId -eq 'mem.usage.average'} | select -ExpandProperty Value) * $script:mcapacity/100); $script:mused}},

        @{N='Mem_Free';E={[int](100 - $script:mused/$script:mcapacity*100)}} |

      Export-Csv -Path $FileName -Append -notypeinformation
    }
    Disconnect-VIServer -Server $VCenter -Force -Confirm:$false
}

 
