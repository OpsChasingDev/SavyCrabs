
# gets computer name
$info = Get-ComputerInfo | Select-Object CsDNSHostName
$info