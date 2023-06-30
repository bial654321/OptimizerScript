<#
Here's an overview of what the code does:
1. Checks if the script is running with administrative privileges and relaunches it as admin if necessary.
2. Deletes Group Policy history files from the specified directory.
3. Removes Group Policy directories from the system.
4. Deletes temporary files from the AppData\Local\Temp directory for all users.
5. Optimizes hard drive performance by defragmenting the C drive.
6. Cleans up Windows update files using DISM.exe.
7. Checks the health of all HDD and SSD disks.
8. Removes Windows credentials from Credential Manager.
9. Runs Disk Cleanup utility with preset configurations.
10. Runs a System File Checker (sfc) scan.
11. Displays a message indicating the successful completion of cleanup operations.
12. Closes the window automatically without prompting a user to press any buttons.
#>

# Check if running with administrative privileges, if not relaunch as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Deleting Group Policy history files
Remove-Item -Path "$env:ALLUSERSPROFILE\Application Data\Microsoft\Group Policy\History\*" -Force -Recurse -ErrorAction SilentlyContinue

# Removing Group Policy directories
Remove-Item -Path "$env:WinDir\System32\GroupPolicyUsers" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:WinDir\System32\GroupPolicy" -Force -Recurse -ErrorAction SilentlyContinue

# Removing temporary files from AppData\Local\Temp directory for all users
$users = Get-ChildItem -Path "$env:SystemDrive\Users" -Directory
foreach ($user in $users) {
    $tempPath = Join-Path -Path $user.FullName -ChildPath 'AppData\Local\Temp'
    if (Test-Path -Path $tempPath) {
        Remove-Item -Path $tempPath\* -Force -Recurse -ErrorAction SilentlyContinue
    }
}

# Clean up Windows update files
Write-Host "Cleaning up Windows update files..."
DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase

# Removing Windows credentials from Credential Manager
$credentials = cmdkey /list | Select-String -Pattern 'Target:' | ForEach-Object { $_.Line -replace '.*Target:\s*', '' }
foreach ($credential in $credentials) {
    cmdkey /delete:$credential > $null
}

# Running Disk Cleanup
Write-Host "Running Disk Cleanup..."
Start-Process -FilePath cleanmgr -ArgumentList '/sagerun:65535' -NoNewWindow -Wait

# Running System File Checker (sfc) scan
Write-Host "Running System File Checker (sfc) scan..."
sfc /scannow

# Optimize hard drive performance
Write-Host "Optimizing hard drive performance..."
Optimize-Volume -DriveLetter C -Defrag -Verbose

# Check disk health for all disks
Write-Host "Checking disk health..."
$disks = Get-PhysicalDisk | Where-Object { $_.MediaType -eq "HDD" -or $_.MediaType -eq "SSD" }
foreach ($disk in $disks) {
    $disk | Get-StorageReliabilityCounter
}

Write-Host "Cleanup completed successfully."