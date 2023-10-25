# get computer name and OS version
$info = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$info