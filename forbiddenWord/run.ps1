### 파워쉘에서 실행시 Exhange 모듈 호출
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.Snapin;

### Date
$date=Get-Date
$dateStr=$date.toString("yyyyMMdd_hhmmss")

$path="D:\forbidden"
$csv_file=$path + "\forbidden_list.csv"
$result=$path + "\forbidden_result__" + $dateStr + ".txt"

### 금칙어 검색
$forbidden=(Get-Content $csv_file)
$target_mailbox="JDB06"
$target_dbs=@("JDB06", "JDB13", "JDB15", "JDB18")
$result_path=$path + "\result\" + $dateStr

### 디렉토리 생성
New-Item -ItemType directory -Path $result_path

### Find Word & Delete Mails
for ($k=0; $k -lt $target_dbs.length; $k++) {
  for ($i=1; $i -lt $forbidden.length; $i++) {

    $target_db=$target_dbs[$k]
    $keyword=$forbidden[$i]
    $result_file=$target_db + "__" + $dateStr + ".txt"
    $result=$result_path + "\" + $result_file

    Write-Output "##############################" $keyword "##############################" >> $result

    Get-Mailbox -Database $target_db -ResultSize Unlimited | Search-Mailbox -SearchQuery $keyword -EstimateResultOnly >> $result
  }
}