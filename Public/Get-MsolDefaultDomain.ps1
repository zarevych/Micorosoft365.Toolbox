<#
    .SYNOPSIS
     Get Office 365 Default Domain
 
    .DESCRIPTION
     Get Office 365 Default Domain

    .NOTES
     File Name  : Get-MsolDefaultDomain.ps1
     Version    : 1.2004
     Author     : Andriy Zarevych

    Find me on :
    * My Blog  :	https://angry-admin.blogspot.com/
    * LinkedIn :	https://linkedin.com/in/zarevych/
    * Github   :	https://github.com/zarevych
#>


function Get-MsolDefaultDomain () {

    [OutputType([string])]

    $DefaultDomainName = Get-MsolDomain | where { ($_.IsDefault -eq $true) } | select Name

    return $DefaultDomainName.Name
}

