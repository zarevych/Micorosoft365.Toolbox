function Get-Office365ServiceHealthStatus {
<#
.SYNOPSIS
 Get Office365 Service Health Status
 
.DESCRIPTION
 Get Office365 Service Health Status


.PARAMETER TenantID
    The Directory ID from Azure AD

.PARAMETER AccessToken
    AccessToken returned function Microsoft365.Toolbox\Get-Office365ServiceHealthToken


.NOTES
   File Name  : Get-Office365ServiceHealthStatus.ps1
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
    param(
        [string][alias('TenantDomain')] $TenantID,
        [Hashtable][alias('Token')] $AccessToken
    )

    Invoke-RestMethod -Uri "https://manage.office.com/api/v1.0/$($TenantID)/ServiceComms/CurrentStatus" -Headers $token -Method Get
}
