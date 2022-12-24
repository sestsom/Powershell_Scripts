#This script will stop all services that are not marked as "Automatic" or "Automatic (Delayed Start)" in their start type.
#Keep in mind that pausing a service will temporarily stop it from running, but it will not prevent it from starting again if it is needed.

 
# Get a list of all services that are not marked as "important" or "critical"
$services = Get-Service | Where-Object { $_.StartType -ne "Automatic" -and $_.StartType -ne "Automatic (Delayed Start)" }

# Pause each service in the list
foreach ($service in $services)
{
    # Check if the service is already paused
    if ($service.Status -ne "Stopped")
    {
        # Pause the service
        Write-Host "Pausing service: $($service.Name)"
        $service | Set-Service -Status Paused
    }
}
