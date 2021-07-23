$file = C:\Scripts\users.csv

Import-Module -Name MicrosoftTeams
Connect-MicrosoftTeams -AccountId '' -Credential $myCred

#Add User To Channel 
Import-Csv -Path $file | foreach{Add-TeamChannelUser -GroupId < ID > -DisplayName <"Channel_DisplayName"> -user $_.email}
