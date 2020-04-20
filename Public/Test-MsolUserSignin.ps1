Function Test-MsolUserSignIn () {

<#
    .SYNOPSIS
     Check Office365 User SignIn status
 
    .DESCRIPTION
     Check Office365 User SignIn status

    .PARAMETER UserPrincipalName
     Office365 UserPrincipalName

    .NOTES
     File Name  : Check-MsolUserSignIn.ps1
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

    $MsolUser = Get-MsolUser -UserPrincipalName $UserPrincipalName | select BlockCredential
    #Get-MsolUser -UserPrincipalName $UserPrincipalName | select UserPrincipalName, BlockCredential

    if ($MsolUser.BlockCredential) {
        return $false
    }
    else {
        return $true
    }

}