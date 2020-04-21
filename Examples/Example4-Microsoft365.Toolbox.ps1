<#

.SYNOPSIS
 Microsoft365.Toolbox - Example 4

.DESCRIPTION
 Microsoft365.Toolbox - Example 4
 Get Office 365 Health Status

 ## Commands / Functions
 Get-Office365ServiceHealthStatus
 Get-Office365ServiceHealthToken

  ## Module Installtion
 PS> Install-Module -Name Microsoft365.Toolbox

 ## Module Usage
 PS> Import-Module Microsoft365.Toolbox

#>



# --- CHANGE THESE VALUES ---
$TenantID = '12345677-1234-1234-1234-123456789012' #The Directory ID from Azure AD
$ClientID = '5xxxxxxx-3xxx-4xxx-9xxx-1xxxxxxxxxxx' #The Application ID of the registered app
$ClientSecret = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' #The secret key of the registered app
# ------------------------------------------------------


Import-Module Microsoft365.Toolbox


#Get Office365 Service Health App AccessToken
$token = Get-Office365ServiceHealthToken -ClientID $ClientID -ClientSecret $ClientSecret -TenantID $TenantID

#Get Office365 Health Status
$Office365ServiceStatus = Get-Office365ServiceHealthStatus -TenantID $TenantID -AccessToken $token

#Show Office 365 Health Status
$Office365ServiceStatus.value | sort WorkloadDisplayName |ft WorkloadDisplayName, Workload, StatusDisplayName, Status, StatusTime, IncidentIds -AutoSize
