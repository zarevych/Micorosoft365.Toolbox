<#
    .SYNOPSIS
     Get Office 365 Company Name
 
    .DESCRIPTION
     Get Office 365 Company Name

    .NOTES
     File Name  : Get-MsolCompanyName.ps1
     Version    : 1.2004
     Author     : Andriy Zarevych

    Find me on :
    * My Blog  :	https://angry-admin.blogspot.com/
    * LinkedIn :	https://linkedin.com/in/zarevych/
    * Github   :	https://github.com/zarevych
#>


function Get-MsolCompanyName () {

    [OutputType([string])]

    $CompanyName = Get-MsolCompanyInformation

    return $CompanyName.DisplayName
}
