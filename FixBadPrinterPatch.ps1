Import-Module $env:SyncroModule -WarningAction SilentlyContinue

#Creates temp folder if needed
New-Item -ItemType directory -Path C:\temp

#load function
function fixupdate
    {
    $updatesearch = wmic qfe list brief /format:table | findstr KB5000842
if (!$updatesearch)
    {
		write-host "`nUpdate KB5000842 Not Installed, Proceed."
        start-bitstransfer -source "http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/03/windows10.0-kb5000842-x64_84fff16cb6d332ad9ba08d6edaf8baae30a627c7.msu" -destination "c:\temp\KB5000842.msu"
        wusa "C:\temp\KB5000842.msu" /quiet
        New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager' -Name 'PendingFileRenameOperations' -Value "\??\C:\temp\KB5000842.msu" -PropertyType String -Force
		exit 0
	}
else 
	{
        write-host "`nUpdate KB5000842 FOUND, Skip."
        exit 0
    }
}


#run function
fixupdate
