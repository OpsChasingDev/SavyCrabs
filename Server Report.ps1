# get computer name and os version
$Computerinfo = Get-ComputerInfo

# get number of disks
$Diskinfo = Get-Disk

# custom object for disk count
$obj = [PSCustomObject]@{
    LogicalDiskCount = $Diskinfo.Count
    ComputerName = $Computerinfo.CsDNSHostName
    OsVersion = $Computerinfo.OsVersion
}

Write-Output $obj