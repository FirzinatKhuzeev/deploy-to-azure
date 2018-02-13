Set-ExecutionPolicy Unrestricted -force

Write-Host "Starting post install"
Get-Date

Write-Host "Install Drivers"
Invoke-Expression ".\drivers-install.ps1"

Write-Host "Install Blender"
Invoke-Expression ".\blender-install.ps1"

Write-Host "Completed post install"
Get-Date
