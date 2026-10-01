<#
.SYNOPSIS
    This PowerShell script ensures that audit policy using subcategories is enabled (STIG-ID: WN11-SO-000030).

.NOTES
    Author           : Casey Ledbetter
    LinkedIn         : linkedin.com/in/casey-ledbetter
    GitHub           : github.com/CSLedbetter
    Date Created     : 2026-10-01
    Last Modified    : 2026-10-01
    Version          : 1.0
    CVEs             : N/A
    Plugin IDs       : N/A
    STIG-ID          : WN11-SO-000030
    Documentation    : https://stigaview.com/products/win11/v2r8/WN11-SO-000030/

.TESTED ON
    Date(s) Tested   : 
    Tested By        : 
    Systems Tested   :  
    PowerShell Ver.  :  

.USAGE
    Run this script with elevated privileges (Run as Administrator) to enforce the STIG requirement.
    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN11-SO-000030).ps1
#>

# Define the registry path and value
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "SCENoApplyLegacyAuditPolicy"
$valueData = 1  # 0x00000001 in hexadecimal (Enabled)

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the SCENoApplyLegacyAuditPolicy value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
