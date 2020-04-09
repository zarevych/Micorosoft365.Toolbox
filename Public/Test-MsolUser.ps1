Function Test-MsolUser () {
<#
.SYNOPSIS
 Check Office365 User
 
.DESCRIPTION
 Check Office365 User


.PARAMETER UserPrincipalName
    Office365 UserPrincipalName

.NOTES
   File Name  : Test-MsolUser.ps1
   Version    : 1.1912
   Author     : Andriy Zarevych

   Find me on :
   * My Blog  :	https://angry-admin.blogspot.com/
   * LinkedIn :	https://linkedin.com/in/zarevych/
   * Github   :	https://github.com/zarevych

#>
    param(
        [Parameter(Mandatory = $false)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory = $false)]
        [string]$ObjectId
    )
    
    if ($UserPrincipalName -or $ObjectId) {
        #$UserPrincipalName
        if ($UserPrincipalName) {
            $UserObj = Get-MsolUser -UserPrincipalName $UserPrincipalName -ErrorAction SilentlyContinue
            if ($UserObj) {
                Return $true
            }
        }
        else {
            try {
                if ($UserObj) {
                    $UserObj = Get-MsolUser -ObjectId $ObjectId -ErrorAction SilentlyContinue
                    Return $true
                }
            }
            catch {
                Return $false    
            }
        }
    }   
    
    else {
        #Return $false    
    }
    Return $false
}
