function Get-Office365ServiceHealthToken {
<#
.SYNOPSIS
 Get Office365 Service Health AccessToken
 
.DESCRIPTION
 Get Office365 Service Health AccessToken

.PARAMETER ClientID   
    The Application ID of the registered app

.PARAMETER ClientSecret
    The secret key of the registered app

.PARAMETER TenantID
    The Directory ID from Azure AD

.NOTES
   File Name  : Get-Office365ServiceHealthToken.ps1
   Version    : 1.2004
   Author     : Andriy Zarevych

   Find me on :
   * My Blog  :	https://angry-admin.blogspot.com/
   * LinkedIn :	https://linkedin.com/in/zarevych/
   * Github   :	https://github.com/zarevych

   Change Log:
   V1.2004    : Initial version
#>

    [CmdLetbinding()]
    [Alias('Connect-Office365ServiceHealth')]

    param(
        [string][alias('ApplicationID')] $ClientID,
        [string][alias('ApplicationKeyClientSecret')] $ClientSecret,
        [string][alias('TenantDomain')] $TenantID
    )
    
    $Body = @{
        grant_type    = "client_credentials"
        resource      = "https://manage.office.com"
        client_id     = $ClientID
        client_secret = $ClientSecret
    }
    try {
        $Authorization = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$($TenantID)/oauth2/token?api-version=1.0" -Body $body -ErrorAction Stop
    } catch {
        $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
        Write-Warning -Message "Connect-O365ServiceHealth - Error: $ErrorMessage"
    }
    if ($Authorization) {
        @{'Authorization' = "$($Authorization.token_type) $($Authorization.access_token)" }
        #$token = @{'Authorization' = "$($Authorization.token_type) $($Authorization.access_token)" }
        #return $token
    } else {
        $null
    }
}
