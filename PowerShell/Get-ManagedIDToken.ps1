Write-Output "\/\/\/\/\/\/\/\/\/\/ This is the management token \/\/\/\/\/\/\/\/\/\/"
(Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com' -Method GET -Headers @{Metadata="true"} -UseBasicParsing).Content

Write-Output "\/\/\/\/\/\/\/\/\/\/ This is the vault token \/\/\/\/\/\/\/\/\/\/"
(Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://vault.azure.net' -Method GET -Headers @{Metadata="true"} -UseBasicParsing).Content

hostname
