<#

.SYNOPSIS
 Microsoft365.Toolbox - Example 1

.DESCRIPTION
 Microsoft365.Toolbox - Example 1

 ## Commands / Functions
 Get-MsolCompanyName
 Get-MsolDefaultDomain
 Test-IsMsolUserLicensed
 Test-MsolUser
 Test-MsolUserSignin

 ## Module Installtion
 PS> Install-Module -Name Microsoft365.Toolbox

 ## Module Usage
 PS> Import-Module Microsoft365.Toolbox

#>


Import-Module MSOnline

# Import-Module Microsoft365.Toolbox
Import-Module Microsoft365.Toolbox


# Connect to Office 365
$Cred = Get-Credential
Connect-MsolService -Credential $Cred

# Get Company Name
$CompanyName = Get-MsolCompanyName
Write-host "Company: $CompanyName"

# Get organization default domain
$DefDomainName = Get-MsolDefaultDomain
write-host "Default domain: $DefDomainName"

# Set UPNSuffix
$UPNSuffix = "@" + $DefDomainName

# Set UserName
$User = "UserName" + $UPNSuffix



# Check user
if (Test-MsolUser $User) {
    Write-Host "User $User exist in organization $CompanyName"

    # Check user Sign In
    if (Test-MsolUserSignin $User) {
        Write-Host "User $User Sing in ‎allowed‎"
    }
    else {
        Write-Host "User $User Sing in ‎blocked‎"
    }

    # Check is user licensed
    if (Test-IsMsolUserLicensed $User) {
        Write-host "User $User licensed"
    }
    else {
        Write-Host "User $User unlicensed"
    }

}

else {
    Write-Host "User $User not found in organization $CompanyName"
}
