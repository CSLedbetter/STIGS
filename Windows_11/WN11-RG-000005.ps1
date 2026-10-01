<#
.SYNOPSIS
    This PowerShell script ensures that the default permissions for the HKEY_LOCAL_MACHINE registry hive are maintained.

.NOTES
    Author          : Casey Ledbetter
    LinkedIn        : linkedin.com/in/casey-ledbetter
    GitHub          : github.com/CSLedbetter
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-RG-000005
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-RG-000005/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with Administrator privileges to reapply the default security template, which restores default registry permissions for HKLM.
    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN11-RG-000005).ps1 
#>

# Apply the default security template to restore baseline registry permissions
$infPath = "$env:windir\inf\defltbase.inf"
$dbPath = "$env:temp\defltbase.sdb"

if (Test-Path $infPath) {
    secedit /configure /cfg $infPath /db $dbPath /verbose
    Write-Host "Default security template applied successfully, restoring HKLM registry permissions."
} else {
    Write-Error "The default configuration file could not be found at $infPath."
}
