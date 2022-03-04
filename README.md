# Azure Penetration Testing
Resources for Azure Penetration Testing

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
