function Check-DockerInstalled {
    try {
        Get-Command docker -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

function Enable-DockerAutoupdater {
    Write-Host "Docker is installed. Enabling autoupdater..."
    $settingsPath = "$env:USERPROFILE\AppData\Roaming\Docker\settings.json"
    $settings = Get-Content $settingsPath | ConvertFrom-Json

    #Enable Autoupdate
    $settings.autoDownloadUpdates = $true
    $settings | ConvertTo-Json | Set-Content -Path $settingsPath
    Write-Host "Docker autoupdater enabled."
}

if (Check-DockerInstalled) {
    Enable-DockerAutoupdater
} else {
    Write-Host "Docker is not installed. Skipping autoupdater."
}
