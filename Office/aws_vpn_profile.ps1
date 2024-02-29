
$ParentDirectory = "C:\users\$($env:USERNAME)\AppData\Roaming\AWSVPNClient"
    if (!(Test-Path -Path $ParentDirectory)) {
        New-Item -ItemType Directory -Path $ParentDirectory | Out-Null
    }
$Directory = "C:\users\$($env:USERNAME)\AppData\Roaming\AWSVPNClient\OpenVpnConfigs"
    if (!(Test-Path -Path $Directory)) {
        New-Item -ItemType Directory -Path $Directory | Out-Null
    }

if (Test-Path -Path "$Directory\{NAME}"){
    Write-Host "File exists."
} else {
    Write-Output "Creating VPN profiles"
    $line = "{`"Version`":`"1`",`"LastSelectedProfileIndex`":0,`"ConnectionProfiles`":[{`"ProfileName`":`"{NAME}`",`"OvpnConfigFilePath`":`"C:\\Users\\$($env:username)\\AppData\\Roaming\\AWSVPNClient\\OpenVpnConfigs\\<NAME>`",`"CvpnEndpointId`":`"cvpn-endpoint-`",`"CvpnEndpointRegion`":`"eu-west-1`",`"CompatibilityVersion`":`"2`",`"FederatedAuthType`":1}]}"
    $stream = [System.IO.StreamWriter] "c:\\users\\$($env:username)\\appdata\\roaming\\AWSVPNClient\\ConnectionProfiles"
    $stream.WriteLine($line)
    $stream.close()

    $ovpn = "
    <ca>
    -----BEGIN CERTIFICATE-----
    
    -----END CERTIFICATE-----
    -----BEGIN CERTIFICATE-----
    
    -----END CERTIFICATE-----

    -----BEGIN CERTIFICATE-----
   
    -----END CERTIFICATE-----
    </ca>

    "

    $stream = New-Object System.IO.StreamWriter("c:\\users\\$($env:username)\\appdata\\roaming\\AWSVPNClient\\OpenVpnConfigs\\Ireland", $false, [System.Text.Encoding]::ASCII)
    $stream.WriteLine($ovpn)
    $stream.Close()
    
    $user = $env:username
    (Get-Content -path C:\users\$($env:username)\AppData\Roaming\AWSVPNClient\ConnectionProfiles -Raw) -replace 'Generic',"$user"  | Set-Content -Path C:\users\$env:username\AppData\Roaming\AWSVPNClient\ConnectionProfiles

}
