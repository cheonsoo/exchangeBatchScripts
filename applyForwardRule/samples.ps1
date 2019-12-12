

# Enable forwarding
Set-Mailbox -Identiry "test1" -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "test2@gssmartoffice.com"

# Disable forwarding
Set-Mailbox -Identiry "test1" -DeliverToMailboxAndForward $true -ForwardingSMTPAddress $null

# Disable mail and forwarding both
Set-Mailbox -Identiry "test1" -DeliverToMailboxAndForward $false

# Check mail forwarding status
Get-Mailbox -Identity "test1" | Format-List ForwardingSMTPAddress, DeliverToMailboxandForward
