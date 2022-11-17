Set-executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Download file
$clnt = new-object System.Net.WebClient
$url = "https://www.support.xerox.com/support/global-printer-driver/file-redirect/enus.html?operatingSystem=win10x64&fileLanguage=en&contentId=155711"
$file = "c:\users\$ENV:USERNAME\downloads\UNIV_5.887.3.0_PS_x64.zip"
$clnt.DownloadFile($url, $file)


#Extract file
Expand-Archive -Path "C:\users\$ENV:USERNAME\downloads\UNIV_5.887.3.0_PS_x64.zip" -DestinationPath "C:\users\$ENV:USERNAME\downloads\UNIV_5.887.3.0_PS_x64"


#Install Printer
Invoke-Command {pnputil.exe -a "C:\users\$ENV:USERNAME\downloads\UNIV_5.887.3.0_PS_x64\UNIV_5.887.3.0_PS_x64_Driver.inf\x3UNIVP.inf" }
Add-PrinterDriver -Name "Xerox Global Print Driver PS"
Get-PrinterDriver

Add-PrinterPort -Name "XeroxC8155:" -PrinterHostAddress "192.168.0.12"
Start-Sleep 10
Add-Printer -Name "Kopi-lager-rum" -PortName "XeroxC8155:" -DriverName "Xerox Global Print Driver PS"