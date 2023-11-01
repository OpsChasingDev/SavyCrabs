# get computer name and os version
$Computerinfo = Get-ComputerInfo

# get number of disks
$Diskinfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive | Where-Object {$_.Name -eq 'C'}

# custom object for disk count
$obj = [PSCustomObject]@{
    LogicalDiskCount = $Diskinfo.Count
    ComputerName = $Computerinfo.CsDNSHostName
    OsVersion = $Computerinfo.OsVersion
    'FreeSpace_GB'  = [MATH]::Round(($FreeSpace.Free /1gb),2)
}

Write-Output $obj