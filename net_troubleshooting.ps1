Set-executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Renewing DHCP IP
Get-WmiObject Win32_NetworkAdapterConfiguration -Filter 'IpEnabled=True AND DhcpEnabled=True' | Foreach-Object{
    $_.releaseDHCPLease() -and $_.RenewDHCPLease()
}
#DNS cache flush
Clear-DnsClientCache
Start-Sleep -Seconds "15"
#Testing internet connection
if (Test-Connection 8.8.8.8 -Quiet) {break}
#Restarting if it doesn't work
else {Restart-Computer} 
