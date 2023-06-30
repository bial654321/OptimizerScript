<body>
    <h1>💻 OptimizerScript 💻</h1>
    <h2>❓ What is this script?</h2>
    <p>It's a short code written in Powershell to optimise your computer. It removes junk, defragments and optimises the disk, removes credentials etc.</p>
    <h2>🤔 How does it work?</h2>
    <ol>
        <li>Checks if the script is running with administrative privileges and relaunches it as admin if necessary.</li>
        <li>Deletes Group Policy history files from the specified directory.</li>
        <li>Removes Group Policy directories from the system.</li>
        <li>Deletes temporary files from the AppData\Local\Temp directory for all users.</li>
        <li>Optimizes hard drive performance by defragmenting the C drive.</li>
        <li>Cleans up Windows update files using DISM.exe.</li>
        <li>Checks the health of all HDD and SSD disks.</li>
        <li>Removes Windows credentials from Credential Manager.</li>
        <li>Runs Disk Cleanup utility with preset configurations.</li>
        <li>Runs a System File Checker (sfc) scan.</li>
        <li>Displays a message indicating the successful completion of cleanup operations.</li>
        <li>Closes the window automatically without prompting a user to press any buttons.</li>
    </ol>
	<h2>🔥 How do I run this scrypt?</h2>
	<p>Simply download and run in powershell. It will need your admin password to work</p>
	<h2>😱 Is this a virus? Will this break my PC?</h2>
	<p>Not at all. This script is only 68 lines long. It's an open source project so you can look inside the code yourself but I am not responsible if anything breaks (it shouldn't tho). Use at your own risk</p>
	<h2>🆘 Window doesnt' show anything. Is it stuck? Should I forcefully stop the application?</h2>
	<p>Script includes some functions that take time to finish. Just leave the code be. Window of the script will close on it's own</p>
</body>

</html>
