<#
Using an app object (SPN) to connect to Az
#>

$TenantID = "Tenant-ID-Here"

$AppID = "App-ID-Here"    #This is the Application (client) ID
$AppSecret = "App-Secret-Here"

$SecureString = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AppID,$SecureString

Connect-AzAccount -ServicePrincipal -Credential $Credential -TenantId $TenantID
Get-AzRoleAssignment
