# get computer name and os version
$Computerinfo = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion

# get number of disks
$Diskinfo = Get-Disk

# custom object for disk count
$obj = [PSCustomObject]@{LogicalDiskCount = $Diskinfo.Count}
Write-Output $obj