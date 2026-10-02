<#
.SYNOPSIS
This PowerShell script enforces a BitLocker PIN for pre-boot authentication.

.NOTES
Author          : Casey Ledbetter
LinkedIn        : [linkedin.com/in/casey-ledbetter](https://www.google.com/search?q=https%3A%2F%2Flinkedin.com%2Fin%2Fcasey-ledbetter)
GitHub          : [github.com/CSLedbetter](https://www.google.com/search?q=https%3A%2F%2Fgithub.com%2FCSLedbetter)
Date Created    : 2026-10-01
Last Modified   : 2026-10-01
Version         : 1.0
CVEs            : N/A
Plugin IDs      : V-253260
STIG-ID         : WN11-00-000031
Documentation   : [https://stigaview.com/products/win11/v2r8/WN11-00-000031/](https://stigaview.com/products/win11/v2r8/WN11-00-000031/)

.TESTED ON
Date(s) Tested  :
Tested By       :
Systems Tested  :
PowerShell Ver. :

.USAGE
Put any usage instructions here.
Example syntax:
PS C:> .\remediation_template(STIG-ID-WN11-00-000031).ps1
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

if (-not (Test-Path $registryPath)) {
New-Item -Path $registryPath -Force | Out-Null
}

Set-ItemProperty -Path $registryPath -Name "UseAdvancedStartup" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMPIN" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMKeyPIN" -Value 1 -Type DWord

Write-Host "Registry values UseAdvancedStartup, UseTPMPIN, and UseTPMKeyPIN set to 1 at '$registryPath'."
