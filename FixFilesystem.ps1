# Fixes the Filesystem if needed
sfc /scannow
dism /online /cleanup-image /CheckHealth
dism /online /cleanup-image /ScanHealth
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /restorehealth
