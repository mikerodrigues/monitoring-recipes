## Set our hostname variable using token.
$hostname = '##SYSTEM.HOSTNAME##'

## Set our namespace 
$namespace = "root\cimv2"

## Set your query.
$query = "SELECT * FROM Win32_LogicalDisk"

## Set variable to get out wmi objects
$output = Get-WmiObject -Namespace $namespace -ComputerName $hostname -Query $query

## Iterate through each output from our query.
foreach ($instance in $output) {   

    ## Set variables.
    $name = $instance.Name

    ## Print it all out.
    Write-Host "$name.FreeSpace=$($instance.FreeSpace)"
    Write-Host "$name.Size=$($instance.Size)"
}

## Make sure we fully terminate the script.
exit