Function Test-IsMsolUserLicensed () {

<#
    .SYNOPSIS
     Check if Office365 User is licensed
 
    .DESCRIPTION
     Check if Office365 User is licensed

    .PARAMETER UserPrincipalName
     Office365 UserPrincipalName

    .NOTES
     File Name  : Check-MsolUserIsLicensed.ps1
     Version    : 1.2004
     Author     : Andriy Zarevych

    Find me on :
    * My Blog  :	https://angry-admin.blogspot.com/
    * LinkedIn :	https://linkedin.com/in/zarevych/
    * Github   :	https://github.com/zarevych
#>

    [CmdLetbinding()]

    param(
        [Parameter(Mandatory = $true,
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true,
        Position=0)]
        [string]$UserPrincipalName
    )

    $MsolUser = Get-MsolUser -UserPrincipalName $UserPrincipalName | select UserPrincipalName, isLicensed
    #Get-MsolUser -UserPrincipalName $UserPrincipalName | select UserPrincipalName, isLicensed

    if ($MsolUser.IsLicensed) {
        return $true
    }
    else {
        return $false
    }

}