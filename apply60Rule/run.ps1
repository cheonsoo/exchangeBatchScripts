# 파워쉘에서 실행시 Exchange 모듈 호출
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn;

#보존정책 할당
Get-Mailbox -Database MBX01 -ResultSize Unlimited | Set-Mailbox -RetentionPolicy test001