# get computer name and os version
$Computerinfo = Get-ComputerInfo

# get number of disks
$Diskinfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive | Where-Object {$_.Name -eq 'C'}

# get number of cores
$CPUCore = Get-CimInstance CIM_Processor

# custom object for disk count
$obj = [PSCustomObject]@{
    LogicalDiskCount = $Diskinfo.Count
    ComputerName = $Computerinfo.CsDNSHostName
    OsVersion = $Computerinfo.OsVersion
    FreeSpace_GB  = [MATH]::Round(($FreeSpace.Free /1gb),2)
    CPUCore = $CPUCore.NumberofCores
}

Write-Output $obj