# entrypoint.ps1

# Perform content replacement
(Get-Content '.\Views\Home\Index.cshtml') -replace $env:NEW_PLACEHOLDER, $env:NEW | Set-Content '.\Views\Home\Index.cshtml' -Force

# Start the IIS service
Start-Service W3SVC

# Keep the container running
while ($true) {

}
