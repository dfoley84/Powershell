#Import Modules
Import-Module VMware.VimAutomation.HorizonView
Import-Module VMware.VimAutomation.Core
Get-Module -ListAvailable 'VMware.Hv.Helper' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryServiceService' | Import-Module
Get-Module -ListAvailable 'VMware.Hv.QueryDefinition' | Import-Module

Import-Module VMware.Hv.Helper

#Hoizon Variables
$user = ''
$pswd =  ${env:pass}

$items = 
#Remove Old CSV File if exists
$fileToCheck = "C:\Scripts\HorizonPoolentitlementl.csv"
if (Test-Path $fileToCheck -PathType Leaf)
{
    Remove-Item $fileToCheck
}


foreach( $item in $items) {
echo $item
$Connection = Connect-HVServer -Server $item -User $user -Password $pswd
$capture = $Connection.ExtensionData
if ($capture)
{

Get-HVPool | ForEach-Object -Process {
                $currentpool = $_
                
                $entitlements = Get-HVEntitlement -ResourceName $currentpool.Base.Name |
                
                ForEach-Object -Process {
                    
                    $_.Base.LoginName
                    
                }
                
                '' | Select @{ Name = 'HorizonServer'; Expression = { $item }},

                            @{ Name = 'Pool'; Expression = { $currentpool.Base.Name } },
                
                            @{ Name = 'Entitlement'; Expression = { $entitlements -join ',' }}

                
            }| Export-Csv -Path $fileToCheck -NoTypeInformation -Append
            
          } Disconnect-HVServer -Server $item -Confirm:$false -Force:$true 
         }

