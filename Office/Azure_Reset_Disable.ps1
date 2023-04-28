# Install required modules
Install-Module AzureAD
Install-Module MSOnline
Import-Module -Name AzureAD, MSOnline

# Connect to Azure AD and MSOnline using the current Windows session
Connect-AzureAD -Credential $null
$currentUser = Get-AzureADUser -ObjectId (Get-AzureADUser -ObjectId $env:USERNAME).ObjectId
Connect-MsolService -Credential $currentUser.Credential

# Set the user email address
$userEmail = "<email>"
$user = Get-AzureADUser -Filter "UserPrincipalName eq '$userEmail'"

$ResetPwd = $false
$DisableAccount = $false

if ($ResetPwd) {
  # Set the length of the password
  $passwordLength = 14
  $charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:,.<>?`~"
  $password = -join ((Get-Random -InputObject $charset -Count $passwordLength))
  Set-AzureADUserPassword -ObjectId $user.ObjectId -Password $newPassword -ForceChangePasswordNextLogin $true
  Write-Host "Password has been reset for $userEmail. New password is $newPassword"
}
if ($DisableAccount) {
  Set-AzureADUser -ObjectId $user.ObjectId -AccountEnabled $false
  Set-MsolUser -UserPrincipalName $user.UserPrincipalName -BlockCredential $true # Block the user from signing in to Azure AD & Office 365
}
