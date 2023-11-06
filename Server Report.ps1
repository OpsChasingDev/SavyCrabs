# get computer name and os version
$Computerinfo = Get-ComputerInfo

# get number of disks
$Diskinfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive | Where-Object {$_.Name -eq 'C'}

# get number of cores
$CPUCore = Get-CimInstance CIM_Processor

# get total memory capacity
$MemoryCapacity = Get-CimInstance CIM_PhysicalMemory
$MemorySum = 0
foreach ($m in $MemoryCapacity) {
    # take capacity property value and add together
    $memorysum = $memorysum + $m.capacity
}

# get last boot up time
$LastBootUp = Get-ComputerInfo

# custom object for computer info
$obj = [PSCustomObject]@{
    LogicalDiskCount = $Diskinfo.Count
    ComputerName = $Computerinfo.CsDNSHostName
    OsVersion = $Computerinfo.OsVersion
    LastBootUp = $LastBootUp.OsLastBootUpTime
    FreeSpace_GB  = [MATH]::Round(($FreeSpace.Free / 1gb),2)
    CPUCore = $CPUCore.NumberofCores
    TotalMemory = [Math]::Round(($MemorySum / 1gb), 0)
}

Write-Output $obj