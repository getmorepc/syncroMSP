#This creates a temp folder
New-Item -ItemType directory -Path C:\temp

This changes to that folder and downloads a file and runs it silently
$dir = "c:\temp"
$url = "https://go.microsoft.com/fwlink/?LinkID=799445"
$file = "$($dir)\Win10Upgrade.exe"
Invoke-WebRequest -Uri $url -OutFile $file
Start-Process -FilePath $file -ArgumentList "/quietinstall /skipeula /auto upgrade /copylogs $dir"
