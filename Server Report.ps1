# get computer name and OS version
$Computerinfo = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$Computerinfo

# get number of disks
$Diskinfo = Get-Disk
$Diskinfo.count
