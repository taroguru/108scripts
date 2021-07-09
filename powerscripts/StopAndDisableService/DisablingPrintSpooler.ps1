<#

.DESCRIPTION
윈도우 인쇄 스풀러 원격 코드 실행 취약성(CVE-2021-34527) 발생
수행 중인 프린터 스풀러 서비스를 종료하고 시작 유형을 사용 안 함으로 변경
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527

.NOTES
Please run this script as administrator

#>

Function DisableSpooler {
    Write-Output "Checking Printer spooler status"
    $result = Get-Service -name Spooler
    
    if( $result.Status -eq 'Running'  ){
        Write-Output "Printer Spooler Service is Running. Disable and Stop the Service."
        Stop-Service -Name Spooler -Force
        Set-Service -Name Spooler -StartupType Disabled
    } else{
        Write-Output "Printer Spoller Service is not running."
    }
}

DisableSpooler