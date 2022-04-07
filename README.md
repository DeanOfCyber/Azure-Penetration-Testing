# Azure Penetration Testing
Resources for Azure Penetration Testing

## Check Tenant Availability
https://o365.rocks/

https://login.microsoftonline.com/getuserrealm.srf?login=username@someco.onmicrosoft.com&xml=1

NameSpaceType = Managed ==> PHS or PTA is used  
NameSpaceType = Federated ==> Federation provider is used

https://login.microsoftonline.com/something.com/v2.0/.well-known/openid-configuration

Provides tenant ID. Useful when SPN credentials are found.

## Build Usernames
* LinkedIn
* PowerMeta
* FOCA

## Enumerate Usernames
```powershell
# Source: https://o365blog.com/post/desktopsso/

# Set the user names to a variable (or read from .csv etc)
$users=@("valid.user@company.com","valid.user@company.onmicrosoft.com","invalid.user@company.com","valid.user_gmail.com#EXT#@company.onmicrosoft.com")

# Loop trough all users
foreach($user in $users)
{
    $exists = Invoke-RestMethod -Uri "https://login.microsoftonline.com/common/GetCredentialType" -ContentType "application/json" -Method POST -Body (@{"username"="$user"; "isOtherIdpSupported" =  $true}|ConvertTo-Json) | Select -ExpandProperty IfExistsResult
    $properties = [ordered]@{"Username"=$user; "Exists"=$($exists -eq 0 -or $exists -eq 6)}
    New-Object -TypeName PSObject -Property $properties
}
```

## Installing PS Module
NOTE: This will take a while!

```powershell
Install-Module -Name Az
```

![image](https://user-images.githubusercontent.com/65491437/155021256-035c30a7-02b1-406f-a133-1b3b09e35c6f.png)

```powershell
Connect-AzAccount
Get-Module -ListAvailable Az.*
Get-Command -Module Az.Accounts
```
```powershell
Get-AzDomain
Get-AzSubscription
Get-AzTenant
```
```powershell
Get-Command -Verb Get -Module Az.* | Select-String VM
Get-AzVM
```
```powershell
Get-Command -Verb Get -Module Az.* | Select-String "IP"
Get-AzPublicIpAddress
```

```powershell
Get-AzPublicIpAddress | Select-Object Name,IPAddress,PublicIPAllocationMethod
```
