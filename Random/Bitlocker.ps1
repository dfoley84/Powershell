#Disable Bitlocker if Encryption is 128-bit
$Bitlocker = Get-BitLockerVolume -MountPoint $env:SystemDrive 
If ($Bitlocker.EncryptionMethod -eq "XtsAes128") 
{ 
    Disable-BitLocker -MountPoint $env:SystemDrive -RecoveryPasswordProtector -Confirm:$false 
}
