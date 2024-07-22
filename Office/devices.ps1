# Import necessary modules
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Identity.DirectoryManagement

# Connect to Microsoft Graph with the necessary scopes
Connect-MgGraph -Scopes "User.Read.All", "Device.Read.All"
$users = Get-MgUser -All # Get Users
$devices = Get-MgDeviceManagementManagedDevice -All # Get Devices from Graph

$list = @()

# Combine users with their devices
foreach ($user in $users) {
    $userDevices = $devices | Where-Object {$_.UserPrincipalName -eq $user.UserPrincipalName -and -not ("Android", "iOS" -contains $_.OperatingSystem)}
    foreach ($device in $userDevices) {
        $obj = [PSCustomObject]@{
            Username         = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            Device_Name      = $device.DeviceName
            Serial_Number    = $device.SerialNumber
            System = $device.OperatingSystem
            Device_Model     = $device.Model        
        }
        $list += $obj
    } 
}
$Path = ".\users.csv"
$list | Export-Csv -Path $Path -NoTypeInformation
