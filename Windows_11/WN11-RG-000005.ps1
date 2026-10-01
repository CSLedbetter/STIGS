<#
.SYNOPSIS
    This PowerShell script ensures default permissions for the HKEY_LOCAL_MACHINE registry hives are maintained per STIG WN11-RG-000005.

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
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-RG-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run as Administrator to restore inheritance and default access control lists for HKLM registry hives.
    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN11-RG-000005).ps1
#>

$hives = @(
    "Registry::HKEY_LOCAL_MACHINE\SECURITY",
    "Registry::HKEY_LOCAL_MACHINE\SOFTWARE",
    "Registry::HKEY_LOCAL_MACHINE\SYSTEM"
)

foreach ($hive in $hives) {
    if (Test-Path $hive) {
        $acl = Get-Acl -Path $hive
        $acl.SetAccessRuleProtection($false, $true)
        Set-Acl -Path $hive -AclObject $acl
        Write-Host "Default permissions and inheritance restored for $hive."
    } else {
        Write-Warning "Registry path not found: $hive"
    }
}
