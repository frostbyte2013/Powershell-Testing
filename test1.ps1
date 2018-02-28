
$Word1 = 'PowerShell'
$Word2 = 'on'
$Computer = "13.82.174.235"
 
$cred = Get-Credential -message "enter password" -UserName "SteamCMD\nick"

# Using Scope Modifier
# (1st Option -- works in PowerShell 3.0 and up)
Invoke-Command -ConnectionUri https://13.82.174.235:5986 -Credential $cred -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck) -Authentication Negotiate -ScriptBlock {
    #Write-Verbose -Message "$Using:Word1 $Using:Word2 $env:COMPUTERNAME (Using Scope Modifer)" -Verbose

    get-windowsfeature -name Net-wcf* | ft Name, InstallState
}

