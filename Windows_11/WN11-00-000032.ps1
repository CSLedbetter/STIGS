<#
.SYNOPSIS
This PowerShell script ensures that the Windows 11 BitLocker PIN has a minimum length of six digits for pre-boot authentication.

.NOTES
Author          : Casey Ledbetter
LinkedIn        : linkedin.com/in/casey-ledbetter
GitHub          : github.com/CSLedbetter
Date Created    : 2026-10-01
Last Modified   : 2026-10-01
Version         : 1.0
CVEs            : N/A
Plugin IDs      : N/A
STIG-ID         : WN11-00-000032
Documentation   : https://stigaview.com/products/win11/v2r8/WN11-00-000032

.TESTED ON
Date(s) Tested  :
Tested By       :
Systems Tested  :
PowerShell Ver. :

.USAGE
Put any usage instructions here.
Example syntax:
PS C:> .\remediation_template(STIG-ID-WN11-00-000032).ps1
#>

# Define the registry path and value

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$valueName = "MinimumPIN"
$valueData = 6  # 0x00000006 in hexadecimal

# Check if the registry path exists, if not create it

if (-not (Test-Path $registryPath)) {
New-Item -Path $registryPath -Force
}

# Set the MinimumPIN value

Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message

Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
