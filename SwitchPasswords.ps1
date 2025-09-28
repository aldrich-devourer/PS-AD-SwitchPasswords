$CsvData = Import-Csv "student password.csv" #Pull CSV in for data

$Usernames = $CsvData | Select-Object -Property Username -ExpandProperty Username #Make variables for each column by property.
$RealPassword = $CsvData | Select-Object -Property ActualPW -ExpandProperty ActualPW # IDK WHAT EXPAND PROPERTY DOES -
$FakePassword = $CsvData | Select-Object -Property RandomPW -ExpandProperty RandomPW # BUT IT MAKES THE ARRAY AN ARRAY.

Write-Host "Choose from the following options:"
Write-Host "1 - Enable test accounts"
Write-Host "2 - Disable test accounts"
$Statement = Read-Host "Your choice as per number assigned to task: "

if ($Statement -eq 1) {
    for ($i=0; $i -lt $Usernames.Count; $i++){
    Set-ADAccountPassword -Identity $Usernames[$i] -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $RealPassword[$i] -Force)
    }
}
elseif ($Statement -eq 2) {
    for ($i=0; $i -lt $Usernames.Count; $i++){
    Set-ADAccountPassword -Identity $Usernames[$i] -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $FakePassword[$i] -Force)
    }
}