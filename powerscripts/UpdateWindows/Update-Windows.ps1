$ServerlistRawString = Get-Content "ServerList.json" -Raw
$Servers = ConvertFrom-Json -InputObject $ServerlistRawString

$updateServerNumber = 0

foreach($Server in $Servers.servers){
    ++$updateServerNumber
    Write-Output "[$updateServerNumber] update server name : $Server"
    #if(Test-Connection $Server) {}
    Get-HotFix -Description * -ComputerName $Server -Credential Domain01\admin01 | convertto-cvs | out-file "$Server.csv"
}

Write-Output ""
Write-Output "Update Server Number : $updateServerNumber"
<#
0. | : powershell pipe operator

1. ConvertFrom-Json
- https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-json?view=powershell-7
- convert string to json
  
2. foreach
foreach($variable in $list){
   operations...
}

3. Write-Output : console out

4. String Concatenation : https://stackoverflow.com/questions/15113413/how-do-i-concatenate-strings-and-variables-in-powershell
- single quotation과 double quotation의 차이가 기술되어 있다. 
- single quotation은 raw string
- double quatation은 formatted string

5. Get-HotFix : https://docs.microsoft.com/ko-kr/powershell/module/microsoft.powershell.management/get-hotfix?view=powershell-7
- hotfix(업데이트)를 진행
- Get-hotfix on multiple computers and exporting to CSV : 
https://stackoverflow.com/questions/12083341/get-hotfix-on-multiple-computers-and-exporting-to-csv
#>