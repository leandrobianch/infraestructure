$sshFirewallScript =@"
$port = 22
$ruleName = "Allow-SSH-Port-22"

$existingRule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue'
if ($existingRule) {
    Write-Host "The rule already!." -ForegroundColor Yellow    
}else {    
    New-NetFirewallRule -Name 'SSH' -DisplayName $ruleName -Direction Inbound -Protocol TCP -Action Allow -LocalPort $port
    Write-Host "The rule has been created sucessfully" -ForegroundColor Yellow    
}
"@
