<#
.SYNOPSIS
    This PowerShell script ensures Windows 11 is configured to audit registry successes.

.NOTES
    Author          : Casey Ledbetter
    LinkedIn        : linkedin.com/in/casey-ledbetter
    GitHub          : github.com/CSLedbetter
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000586
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-AU-000586

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\remediation_template(STIG-ID-WN11-AU-000586).ps1 
#>

$subCategory = "Registry"

try {
    auditpol.exe /set /subcategory:$subCategory /success:enable
    Write-Host "Audit policy for '$subCategory' successfully set to audit Successes."
}
catch {
    Write-Error "Failed to set audit policy for '$subCategory'. Error: $_"
}
