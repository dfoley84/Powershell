<#
.SYNOPSIS
This script is used to add or remove a user from distribution lists during onboarding or offboarding.

.EXAMPLE
.\distributionlist.ps1 -User "user@example.com" -Email "list1@example.com,list2@example.com" -Action "Add"

.EXAMPLE
.\distributionlist.ps1 -User "user@example.com" -Email "list1@example.com,list2@example.com" -Action "Remove"
#>

param(
   [Parameter(Mandatory=$true)]
   [string]$User,
   
   [Parameter(Mandatory=$true)]
   [string]$Email,
   
   [Parameter(Mandatory=$true)]
   [ValidateSet("Add","Remove")]
   [string]$Action
)

if (-not (Get-Module -Name MSOnline -ListAvailable)) {
    Install-Module -Name MSOnline -Force -AllowClobber
}

Import-Module MSOnline
Connect-ExchangeOnline

$Emails = $Email -split ','

foreach ($email in $Emails) {
    if ($Action -eq "Add") {
        Add-DistributionGroupMember -Identity $email -Member $User
    } elseif ($Action -eq "Remove") {
        Remove-DistributionGroupMember -Identity $email -Member $User -Confirm:$false
    }
}


