# OptimizerScript by Matthew
A short code to optimise your computer which removes junk, defragments and optimises the disk, removes creds etc.
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
