Function Get-MsolUserGroup () {
<#
.SYNOPSIS
 Get Office365 User Groups
 
.DESCRIPTION
 Get Office365 User Groups


.PARAMETER UserPrincipalName
    Office365 UserPrincipalName

.PARAMETER SyncStatus
    Select group status All/InCloud/Synced


.NOTES
   File Name  : Get-MsolUserGroup.ps1
   Version    : 1.1912
   Author     : Andriy Zarevych

   Find me on :
   * My Blog  :	https://angry-admin.blogspot.com/
   * LinkedIn :	https://linkedin.com/in/zarevych/
   * Github   :	https://github.com/zarevych

#>

    [CmdLetbinding()]
    [Alias('Get-MsolUserMemberOf')]

    param(
        [Parameter(Mandatory = $true,
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true,
        Position=0)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory = $false)]
        [ValidateSet("All", "InCloud", "Synced")]
        [string]$SyncStatus = "All"
    )
    
    Write-Verbose "Get-MsolUserGroup"
    
    $SyncStatus = $SyncStatus.ToLower()
    
    if ($SyncStatus -notin @("InCloud", "Synced", "All")) {
        Write-Output "Use -SyncStatus InCloud or -SyncStatus Synced"
        break
    }
    
    Write-Verbose "Get-MsolGroup..."
    Write-Verbose $UserPrincipalName
    
    Switch ($SyncStatus) {       
        InCloud {           
            Write-Verbose "Group SyncStatus $SyncStatus"
            #$MsolGroups = Get-MsolGroup -All | where {$_.lastdirsynctime -eq $null}
            #$MsolGroups = Get-MsolGroup -All | where {($_.lastdirsynctime -eq $null) -and ((MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId).Count -gt 0)} #| foreach {$_.ObjectId} {where {$_.Emailaddress -eq $UserPrincipalName}} }
            Get-MsolGroup -All | where {($_.lastdirsynctime -eq $null) -and ((MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId).Count -ne 0) -and (MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId | Where-Object EmailAddress -EQ $UserPrincipalName)}
        }
        Synced {
            Write-Verbose "Group SyncStatus $SyncStatus"
            #$MsolGroups = Get-MsolGroup -All | where {$_.lastdirsynctime -ne $null}
            Get-MsolGroup -All | where {($_.lastdirsynctime -ne $null) -and ((MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId).Count -ne 0) -and (MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId | Where-Object EmailAddress -EQ $UserPrincipalName)}
        }
        All {
            Write-Verbose "Group SyncStatus $SyncStatus"
            #$MsolGroups = Get-MsolGroup -All
            Get-MsolGroup -All | where {((MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId).Count -ne 0) -and (MSOnline\Get-MsolGroupMember -GroupObjectId $_.ObjectId | Where-Object EmailAddress -EQ $UserPrincipalName)}
        }
    }

}
