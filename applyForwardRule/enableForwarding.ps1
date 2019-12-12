### 파워쉘에서 실행시 Exhange 모듈 호출
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.Snapin;

### Date
$date = Get-Date
$dateStr = $date.toString("yyyyMMdd_hhmmss");

$pathNetStorage = "W:\";
$path = "D:\batchScripts\exchangeBatchScripts\applyForwardRule";
$result = $path + "\result\result__" + $dateStr + ".txt";

$csv_file = $path + "\employee_list.csv";
$employees = (Get-Content $csv_file);

for ($i=1; $i -lt $employees.length; $i++) {
  $employee = $employees[$i].split(",");
  $id = $employee[0];
  $emailToForward = $employee[1];

  Write-Output "############################## $id : $emailToForward ##############################" >> $result;

  Set-Mailbox -Identity $id -DeliverToMailboxAndForward $true -ForwardingSMTPAddress $emailToForward;

  Get-Mailbox -Identity $id | Format-List ForwardingSMTPAddress,DeliverToMailboxandForward >> $result;
}
