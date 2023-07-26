# Output processes exceeding 50% CPU usage
 Write-Output ("Set execution policy in Powershell as admin: Set-ExecutionPolicy RemoteSigned `nScript will list all processes exceeding 50% CPU usage")
# Spcify threshold
$cpuThreshold = 50

# Loop it
while ($true) {
    # Get a list of all running processes and CPU usage
    $processes = Get-WmiObject -Query `
      "SELECT IDProcess, Name, PercentProcessorTime FROM Win32_PerfFormattedData_PerfProc_Process WHERE NOT Name='_Total' AND NOT Name='Idle'"

    # For each process
    foreach ($process in $processes) {
        # Calculate CPU usage for process
        $cpuUsage = $process.PercentProcessorTime

        # If CPU usage exceeds threshold, output info about the process
        if ($cpuUsage -gt $cpuThreshold) {
            Write-Output ("Process ID: {0}, Process Name: {1}, CPU Usage: {2}%" -f $process.IDProcess, $process.Name, $cpuUsage)
        }
    }

    # Wait before next update
    Start-Sleep -Seconds 2
}
