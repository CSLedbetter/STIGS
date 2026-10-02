<#
.SYNOPSIS
    This PowerShell script ensures that Bluetooth is turned off unless approved by the organization.

.NOTES
    Author          : Casey Ledbetter
    LinkedIn        : linkedin.com/in/casey-ledbetter
    GitHub          : github.com/CSLedbetter
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000210
    Documentation   : stigaview.com/products/win11/v2r8/WN11-00-000210

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
$registryPath = "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Connectivity"
$valueName = "AllowBluetooth"
$valueData = 0  # 0x00000000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the AllowBluetooth value
Set-ItemProperty -Path $registryPath -Name $valueName -Value$valueData -Type DWord

# Output success message
Write-Host "Registry value 'valueName'setto'valueData' at '$registryPath'."
