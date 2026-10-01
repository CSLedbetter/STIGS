<#
.SYNOPSIS
    This PowerShell script configures Windows 11 to audit registry failures.

.NOTES
    Author          : Casey Ledbetter
    LinkedIn        : linkedin.com/in/casey-ledbetter
    GitHub          : github.com/CSLedbetter
    Date Created    : 2026-10-01
    Last Modified   : 2026-10-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000589
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-AU-000589/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script with Administrator privileges to enforce the audit policy.
    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN11-AU-000589).ps1 
#>

$subcategory = "Registry"

auditpol.exe /set /subcategory:$subcategory /failure:enable

Write-Host "Advanced Audit Policy Configuration for '$subcategory' set to Failure."
