<#
.SYNOPSIS
    This PowerShell script ensures Windows 11 systems block consumer account user authentication.

.NOTES
    Author          : Casey Ledbetter
    LinkedIn        : linkedin.com/in/casey-ledbetter
    GitHub          : github.com/CSLedbetter
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000126
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-00-000126

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\remediation_WN11-00-000126.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount"
$valueName = "DisableUserAuth"
$valueData = 1

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DisableUserAuth value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
