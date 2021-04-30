$AppsList = 
'Microsoft.3DBuilder',
'Microsoft.BingFinance',
'Microsoft.BingNews',
'Microsoft.BingSports',
'Microsoft.MicrosoftSolitaireCollection',
'Microsoft.People',
'Microsoft.Windows.Photos',
'Microsoft.WindowsCamera',
'microsoft.windowscommunicationsapps',
'Microsoft.WindowsPhone',
'Microsoft.WindowsSoundRecorder',
'Microsoft.XboxApp',
'Microsoft.ZuneMusic',
'Microsoft.ZuneVideo',
'Microsoft.Getstarted',
'Microsoft.WindowsFeedbackHub',
'Microsoft.XboxIdentityProvider',
'Microsoft.MicrosoftOfficeHub'

ForEach ($App in $AppsList){
$PackageFullName = (Get-AppxPackage $App).PackageFullName
$ProPackageFullName = (Get-AppxProvisionedPackage -online | where {$_.Displayname -eq $App}).PackageName
write-host $PackageFullName
Write-Host $ProPackageFullName
if ($PackageFullName){
Write-Host "Removing Package: $App"
remove-AppxPackage -package $PackageFullName
}
else{
Write-Host "Unable to find package: $App"
}
if ($ProPackageFullName){
Write-Host "Removing Provisioned Package: $ProPackageFullName"
Remove-AppxProvisionedPackage -online -packagename $ProPackageFullName
}
else{
Write-Host "Unable to find provisioned package: $App"
}
}
