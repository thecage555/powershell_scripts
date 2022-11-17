Set-executionpolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Download file
$clnt = new-object System.Net.WebClient
$url = "https://dam.kyoceradocumentsolutions.com/content/dam/gdam_dc/dc_global/executables/web/Kx83_UPD_8.3.0815_RC5_en.zip"
$file = "c:\users\$ENV:USERNAME\downloads\Kx83_UPD_8.3.0815_RC5_en.zip"
$clnt.DownloadFile($url, $file)


#Extracting files 
Expand-Archive -Path "C:\users\$ENV:USERNAME\downloads\Kx83_UPD_8.3.0815_RC5_en.zip" -DestinationPath "C:\users\$ENV:USERNAME\downloads\Kx83_UPD_8.3.0815_RC5_en"


#Install Printer
Invoke-Command {pnputil.exe -a "C:\users\$ENV:USERNAME\downloads\Kx83_UPD_8.3.0815_RC5_en\64bit\OEMSETUP.inf" /install }
Add-PrinterDriver -Name "Kyocera TASKalfa 3051ci KX"
Get-PrinterDriver

Add-PrinterPort -Name "Lejlighed:" -PrinterHostAddress "192.168.0.11"
Add-PrinterPort -Name "Bibliotek:" -PrinterHostAddress "192.168.0.10"
Start-Sleep 10
Add-Printer -Name "Lejlighed" -PortName "Lejlighed:" -DriverName "Kyocera TASKalfa 3051ci KX"
Add-Printer -Name "Bibliotek" -PortName "Bibliotek:" -DriverName "Kyocera TASKalfa 3051ci KX"