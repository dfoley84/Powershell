$KeyPath = "HKLM:\SOFTWARE\Policies\Google\Chrome"

if (Test-Path $KeyPath) 
{
#1.1.1 (L1) Ensure 'Cross-origin HTTP Authentication prompts' is set to 'Disabled' (Automated)
$AllowCrossAuth = "AllowCrossOriginAuthPrompt"
$AllowCrossAuthValue = "0"  
Set-ItemProperty -Path $KeyPath -Name $AllowCrossAuth -Value $AllowCrossAuthValue -Force


#1.2.1 (L1) Ensure 'Configure the list of domains on which Safe Browsing will not trigger warnings' is set to 'Disabled' (Automated)
$ChromeSafeBrowsingValueName = "SafeBrowsingAllwlistDomains"
$ChromeSafeBrowsingValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeSafeBrowsingValueName -Value $ChromeSafeBrowsingValue -Force

#19 1.2.2 (L1) Ensure 'Safe Browsing Protection Level' is set to 'Enabled: Standard Protection' or higher (Manuaal)
$ChromeSafeBrowsingLevelValueName = "SafeBrowsingProtectionLevel"
$ChromeSafeBrowsingLevelValue = "2"
Set-ItemProperty -Path $KeyPath -Name $ChromeSafeBrowsingLevelValueName -Value $ChromeSafeBrowsingLevelValue -Force

#1.3 (L1) Ensure 'Allow Google Cast to connect to Cast devices on all IP addresses' is set to 'Disabled' (Automated)
$ChromeAllowCastValueName = "MediaRouterCastAllowAllIPs"
$ChromeAllowCastValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeAllowCastValueName -Value $ChromeAllowCastValue -Force

#1.4 (L1) Ensure 'Allow queries to a Google time service' is set to 'Enabled' (Automated)
$ChromeAllowTimeValueName = "BrowserNetworkTimeQueriesEnabled"
$ChromeAllowTimeValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeAllowTimeValueName -Value $ChromeAllowTimeValue -Force

#1.5 (L1) Ensure 'Allow the audio sandbox to run' is set to 'Enabled' (Automated)
$ChromeAllowAudioValueName = "AudioSandboxEnabled"
$ChromeAllowAudioValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeAllowAudioValueName -Value $ChromeAllowAudioValue -Force

#1.6 (L1) Ensure 'Ask where to save each file before downloading' is set to 'Enabled' (Automated)
$ChromeAskSaveValueName = "PromptForDownloadLocation"
$ChromeAskSaveValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeAskSaveValueName -Value $ChromeAskSaveValue -Force

#1.7 (L1) Ensure 'Continue running background apps when Google Chrome is closed' is set to 'Disabled' (Automated)
$ChromeBackgroundValueName = "BackgroundModeEnabled"
$ChromeBackgroundValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeBackgroundValueName -Value $ChromeBackgroundValue -Force

#1.9 (L1) Ensure 'Determine the availability of variations' is set to 'Disabled' (Manual)
$ChromeVariationsValueName = "ChromeVariations"
$ChromeVariationsValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeVariationsValueName -Value $ChromeVariationsValue -Force

#1.10 (L1) Ensure 'Disable Certificate Transparency enforcement for a list of Legacy Certificate Authorities' is set to 'Disabled' (Automated)
$ChromeLegacyValueName = "CertificateTransparencyEnforcementDisabledForLegacyCaCerts"
$ChromeLegacyValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeLegacyValueName -Value $ChromeLegacyValue -Force

#1.11 (L1) Ensure 'Disable Certificate Transparency enforcement for a list of subjectPublicKeyInfo hashes' is set to 'Disabled' (Automated)
$ChromeSubjectValueName = "CertificateTransparencyEnforcementDisabledForCas"
$ChromeSubjectValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeSubjectValueName -Value $ChromeSubjectValue -Force

#1.12 (L1) Ensure 'Disable Certificate Transparency enforcement for a list of URLs' is set to 'Disabled' (Automated)
$ChromeURLValueName = "CertificateTransparencyEnforcementDisabledForUrls"
$ChromeURLValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeURLValueName -Value $ChromeURLValue -Force

#1.13 (L1) Ensure 'Disable saving browser history' is set to 'Disabled' (Automated)
$ChromeHistoryValueName = "SavingBrowserHistoryDisabled"
$ChromeHistoryValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeHistoryValueName -Value $ChromeHistoryValue -Force

#1.14 (L1) Ensure 'DNS interception checks enabled' is set to 'Enabled' (Automated)
$ChromeDNSValueName = "DnsInterceptionChecksEnabled"
$ChromeDNSValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeDNSValueName -Value $ChromeDNSValue -Force

#1.15 (L1) Ensure 'Enable component updates in Google Chrome' is set to 'Enabled' (Automated)
$ChromeComponentValueName = "ComponentUpdatesEnabled"
$ChromeComponentValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeComponentValueName -Value $ChromeComponentValue -Force

#1.16 (L1) Ensure 'Enable globally scoped HTTP auth cache' is set to 'Disabled' (Automated)
$ChromeHTTPValueName = "EnableGloballyScopedHttpAuthCache"
$ChromeHTTPValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeHTTPValueName -Value $ChromeHTTPValue -Force

#1.17 (L1) Ensure 'Enable online OCSP/CRL checks' is set to 'Disabled'(Automated)
$ChromeOCSPValueName = "EnableOnlineRevocationChecks"
$ChromeOCSPValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeOCSPValueName -Value $ChromeOCSPValue -Force

#1.18 (L1) Ensure 'Enable Renderer Code Integrity' is set to 'Enabled' Automated)
$ChromeRendererValueName = "RendererCodeIntegrityEnabled"
$ChromeRendererValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeRendererValueName -Value $ChromeRendererValue -Force



#1.19 (L1) Ensure 'Enable security warnings for command-line flags' is set to 'Enabled' (Automated)
$ChromeCommandLineValueName = "CommandLineFlagSecurityWarningsEnabled"
$ChromeCommandLineValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCommandLineValueName -Value $ChromeCommandLineValue -Force

#1.20 (L1) Ensure 'Enable third party software injection blocking' is set to 'Enabled' (Automated)
$ChromeThirdPartyValueName = "ThirdPartyBlockingEnabled"
$ChromeThirdPartyValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeThirdPartyValueName -Value $ChromeThirdPartyValue -Force

#1.21 (L1) Ensure 'Enables managed extensions to use the Enterprise Hardware Platform API' is set to 'Disabled' (Automated)
$ChromeManagedValueName = "EnterpriseHardwarePlatformAPIEnabled"
$ChromeManagedValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeManagedValueName -Value $ChromeManagedValue -Force

#1.22 (L1) Ensure 'Ephemeral profile' is set to 'Disabled' (Automated)
$ChromeEphemeralValueName = "ForceEphemeralProfiles"
$ChromeEphemeralValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeEphemeralValueName -Value $ChromeEphemeralValue -Force

#1.23 (L1) Ensure 'Import autofill form data from default browser on first run' is set to 'Disabled' (Automated)
$ChromeImportValueName = "ImportAutofillFormData"
$ChromeImportValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeImportValueName -Value $ChromeImportValue -Force

#1.24 (L1) Ensure 'Import of homepage from default browser on first run' is set to 'Disabled' (Automated)
$ChromeImportHomeValueName = "ImportHomePage"
$ChromeImportHomeValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeImportHomeValueName -Value $ChromeImportHomeValue -Force

#1.25 (L1) Ensure 'Import search engines from default browser on first run' is set to 'Disabled' (Automated)
$ChromeImportSearchValueName = "ImportSearchEngine"
$ChromeImportSearchValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeImportSearchValueName -Value $ChromeImportSearchValue -Force

#1.26 (L1) Ensure 'List of names that will bypass the HSTS policy check' is set to 'Disabled' (Manual)
$ChromeHSTSValueName = "HSTSPolicyBypassList"
$ChromeHSTSValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeHSTSValueName -Value $ChromeHSTSValue -Force

#1.27 (L1) Ensure 'Origins or hostname patterns for which restrictions on insecure origins should not apply' is set to 'Disabled' (Automated)
$ChromeInsecureValueName = "OverrideSecurityRestrictionsOnInsecureOrigin"
$ChromeInsecureValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeInsecureValueName -Value $ChromeInsecureValue -Force

#1.28 (L1) Ensure 'Suppress lookalike domain warnings on domains' is set to 'Disabled' (Manual
$ChromeLookalikeValueName = "LookalikeWarningAllowlistDomains"
$ChromeLookalikeValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeLookalikeValueName -Value $ChromeLookalikeValue -Force

#1.29 (L1) Ensure 'Suppress the unsupported OS warning' is set to 'Disabled' (Automated)
$ChromeUnsupportedValueName = "SuppressUnsupportedOSWarning"
$ChromeUnsupportedValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeUnsupportedValueName -Value $ChromeUnsupportedValue -Force

#1.30 (L1) Ensure 'URLs for which local IPs are exposed in WebRTC ICE candidates' is set to 'Disabled' (Automated)
$ChromeWebRTCValueName = "WebRtcLocalIpsAllowedUrls"
$ChromeWebRTCValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeWebRTCValueName -Value $ChromeWebRTCValue -Force

#2.1.1 (L1) Ensure 'Update policy override' is set to 'Enabled' with 'Always allow updates (recommended)' or 'Automatic silent updates' specified (Automated)
$ChromeUpdateValueName = "UpdateDefault"
$ChromeUpdateValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeUpdateValueName -Value $ChromeUpdateValue -Force

#2.2.1 (L1) Ensure 'Control use of insecure content exceptions' is set to'Enabled: Do not allow any site to load mixed content' (Automated
$ChromeMixedValueName = "DefaultInsecureContentSetting"
$ChromeMixedValue = "2"
Set-ItemProperty -Path $KeyPath -Name $ChromeMixedValueName -Value $ChromeMixedValue -Force


#2.4.1 (L1) Ensure 'Supported authentication schemes' is set to 'Enabled:ntlm, negotiate' (Automated)
$ChromeAuthValueName = "AuthSchemes"
$ChromeAuthValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeAuthValueName -Value $ChromeAuthValue -Force


#99 2.7.1 (L1) Ensure 'Enable Google Cloud Print Proxy' is set to 'Disabled'(Automated)
$ChromeCloudValueName = "CloudPrintProxyEnabled"
$ChromeCloudValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCloudValueName -Value $ChromeCloudValue -Force

#2.8.1 Ensure 'Allow remote access connections to this machine' is set to 'Disabled' (Manual
$ChromeRemoteValueName = "RemoteAccessHostAllowRemoteAccessConnections"
$ChromeRemoteValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeRemoteValueName -Value $ChromeRemoteValue -Force

#2.8.2 (L1) Ensure 'Allow remote users to interact with elevated windows in remote assistance sessions' is set to 'Disabled' (Automated
$ChromeRemoteAssistValueName = "RemoteAccessHostAllowUiAccessForRemoteAssistance"
$ChromeRemoteAssistValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeRemoteAssistValueName -Value $ChromeRemoteAssistValue -Force

#2.8.4 (L1) Ensure 'Enable curtaining of remote access hosts' is set to 'Disabled' (Automated)
$ChromeCurtainValueName = "RemoteAccessHostCurtain"
$ChromeCurtainValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCurtainValueName -Value $ChromeCurtainValue -Force

#2.8.5 (L1) Ensure 'Enable firewall traversal from remote access host' is set to 'Disabled' (Automated)
$ChromeFirewallValueName = "RemoteAccessHostFirewallTraversal"
$ChromeFirewallValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeFirewallValueName -Value $ChromeFirewallValue -Force

#2.8.6 (L1) Ensure 'Enable or disable PIN-less authentication for remote access hosts' is set to 'Disabled' (Automated)
$ChromePINValueName = "RemoteAccessHostAllowClientPairing"
$ChromePINValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromePINValueName -Value $ChromePINValue -Force

#2.8.7 (L1) Ensure 'Enable the use of relay servers by the remote access host' is set to 'Disabled'. (Automated
$ChromeRelayValueName = "RemoteAccessHostAllowRelay"
$ChromeRelayValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeRelayValueName -Value $ChromeRelayValue -Force

#Ensure 'Allow download restrictions' is set to 'Enabled: Block dangerous downloads' (Automated)
$ChromeDangerValueName = "DownloadRestrictions"
$ChromeDangerValue = "2"
Set-ItemProperty -Path $KeyPath -Name $ChromeDangerValueName -Value $ChromeDangerValue -Force

#2.11 (L1) Ensure 'Disable proceeding from the Safe Browsing warning page' is set to 'Enabled' (Automated
$ChromeSafeValueName = "DisableSafeBrowsingProceed"
$ChromeSafeValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeSafeValueName -Value $ChromeSafeValue -Force

#2.12 (L1) Ensure 'Enable Chrome Cleanup on Windows' is Configured
$ChromeCleanupValueName = "ChromeCleanupEnabled"
$ChromeCleanupValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeCleanupValueName -Value $ChromeCleanupValue -Force

#2.13 (L1) Ensure 'Enable Site Isolation for every site' is set to 'Enabled
$ChromeSiteValueName = "SitePerProcess"
$ChromeSiteValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeSiteValueName -Value $ChromeSiteValue -Force

#2.15 (L1) Ensure 'Notify a user that a browser relaunch or device restart
$ChromeNotifyValueName = "RelaunchNotification"
$ChromeNotifyValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeNotifyValueName -Value $ChromeNotifyValue -Force

#2.16 (L1) Ensure 'Proxy settings' is set to 'Enabled' and does not contain "ProxyMode": "auto_detect"
$ChromeProxyValueName = "ProxyMode"
$ChromeProxyValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeProxyValueName -Value $ChromeProxyValue -Force

#2.18 (L1) Ensure 'Set the time period for update notifications' is set to 'Enabled: 86400000'
$ChromeUpdateNotifyValueName = "RelaunchNotificationPeriod"
$ChromeUpdateNotifyValue = "86400000"
Set-ItemProperty -Path $KeyPath -Name $ChromeUpdateNotifyValueName -Value $ChromeUpdateNotifyValue -Force

#3.1.2 (L1) Ensure 'Default geolocation setting' is set to 'Enabled: Do not allow any site to track the users' physical location'
$ChromeGeoValueName = "DefaultGeolocationSetting"
$ChromeGeoValue = "3"
Set-ItemProperty -Path $KeyPath -Name $ChromeGeoValueName -Value $ChromeGeoValue -Force

#3.2.1 (L1) Ensure 'Enable Google Cast' is set to 'Disabled
$ChromeCastValueName = "EnableMediaRouter"
$ChromeCastValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCastValueName -Value $ChromeCastValue -Force

#3.3 (L1) Ensure 'Allow websites to query for available payment methods'is set to 'Disabled
$ChromePaymentValueName = "PaymentMethodQueryEnabled"
$ChromePaymentValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromePaymentValueName -Value $ChromePaymentValue -Force

#3.4 (L1) Ensure 'Block third party cookies' is set to 'Enabled' 
$ChromeThirdValueName = "BlockThirdPartyCookies"
$ChromeThirdValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeThirdValueName -Value $ChromeThirdValue -Force

#3.6 (L1) Ensure 'Control how Chrome Cleanup reports data to Google' isset to 'Disabled'
$ChromeCleanupDataValueName = "ChromeCleanupReportingEnabled"
$ChromeCleanupDataValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCleanupDataValueName -Value $ChromeCleanupDataValue -Force

#3.7 (L1) Ensure 'Disable synchronization of data with Google' is set to 'Enabled'
$ChromeSyncValueName = "SyncDisabled"
$ChromeSyncValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeSyncValueName -Value $ChromeSyncValue -Force

#3.8 (L1) Ensure 'Enable alternate error pages' is set to 'Disabled
$ChromeErrorValueName = "AlternateErrorPagesEnabled"
$ChromeErrorValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeErrorValueName -Value $ChromeErrorValue -Force

#3.9 (L1) Ensure 'Enable deleting browser and download history' is set to'Disabled'
$ChromeDeleteValueName = "AllowDeletingBrowserHistory"
$ChromeDeleteValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeDeleteValueName -Value $ChromeDeleteValue -Force

#3.10 (L1) Ensure 'Enable network prediction' is set to 'Enabled: Do not predict actions on any network connection
$ChromeNetworkValueName = "NetworkPredictionOptions"
$ChromeNetworkValue = "2"
Set-ItemProperty -Path $KeyPath -Name $ChromeNetworkValueName -Value $ChromeNetworkValue -Force

#3.11 (L1) Ensure 'Enable or disable spell checking web service' is set to'Disabled'
$ChromeSpellValueName = "ServiceEnabled"
$ChromeSpellValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeSpellValueName -Value $ChromeSpellValue -Force

#3.12 (L1) Ensure 'Enable reporting of usage and crash-related data' isset to 'Disabled
$ChromeReportingValueName = "MetricsReportingEnabled"
$ChromeReportingValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeReportingValueName -Value $ChromeReportingValue -Force

#3.13 (L1) Ensure 'Enable Safe Browsing for trusted sources' is set to'Disabled'
$ChromeSafeSourceValueName = "SafeBrowsingForTrustedSourcesEnabled"
$ChromeSafeSourceValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeSafeSourceValueName -Value $ChromeSafeSourceValue -Force


#3.16 (L1) Ensure 'Enable URL-keyed anonymized data collection' is set to'Disabled'
$ChromeURLValueName = "UrlKeyedAnonymizedDataCollectionEnabled"
$ChromeURLValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeURLValueName -Value $ChromeURLValue -Force

#4.3.1 (L1) Ensure 'Enable submission of documents to Google Cloud print' is set to 'Disabled'
$ChromeCloudPrintValueName = "CloudPrintSubmitEnabled"
$ChromeCloudPrintValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCloudPrintValueName -Value $ChromeCloudPrintValue -Force


#4.7 (L1) Ensure 'Allow user feedback' is set to 'Disabled'
$ChromeFeedbackValueName = "UserFeedbackAllowed"
$ChromeFeedbackValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeFeedbackValueName -Value $ChromeFeedbackValue -Force

#4.9 (L1) Ensure 'Enable AutoFill for addresses' is set to 'Disabled'
$ChromeAutoFillValueName = "AutofillAddressEnabled"
$ChromeAutoFillValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeAutoFillValueName -Value $ChromeAutoFillValue -Force   

#4.10 (L1) Ensure 'Enable AutoFill for credit cards' is set to 'Disabled'
$ChromeCreditValueName = "AutofillCreditCardEnabled"
$ChromeCreditValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeCreditValueName -Value $ChromeCreditValue -Force

#4.11 (L1) Ensure 'Import saved passwords from default browser on first run' is set to 'Disabled'
$ChromeSavedValueName = "ImportSavedPasswords"
$ChromeSavedValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeSavedValueName -Value $ChromeSavedValue -Force

#.12 (L1) Ensure 'List of types that should be excluded from synchronization' is set to 'Enabled: passwords'
$ChromeSyncTypeValueName = "SyncTypesListDisabled"
$ChromeSyncTypeValue = "1"
Set-ItemProperty -Path $KeyPath -Name $ChromeSyncTypeValueName -Value $ChromeSyncTypeValue -Force

#5.1 (L2) Ensure 'Enable guest mode in browser' is set to 'Disabled'
$ChromeGuestValueName = "BrowserGuestModeEnabled"
$ChromeGuestValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeGuestValueName -Value $ChromeGuestValue -Force

#5.2 (L2) Ensure 'Incognito mode availability ' is set to 'Enabled: Incognito mode disabled' (Automated)
$ChromeIncognitoValueName = "IncognitoModeAvailability"
$ChromeIncognitoValue = "0"
Set-ItemProperty -Path $KeyPath -Name $ChromeIncognitoValueName -Value $ChromeIncognitoValue -Force

#5.3 (L1) Ensure 'Set disk cache size, in bytes' is set to 'Enabled: 250609664'
$ChromeCacheValueName = "DiskCacheSize"
$ChromeCacheValue = "250609664"
Set-ItemProperty -Path $KeyPath -Name $ChromeCacheValueName -Value $ChromeCacheValue -Force

} else {
Write-Host "KeyPath not found"
}






