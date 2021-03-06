

$results = read-host -Prompt ('Select an Option:')
$Computer = ("13.82.174.235", "13.82.174.235")
 
$cred = Get-Credential -message "enter password" -UserName "SteamCMD\nick"

# Using Scope Modifier
# (1st Option -- works in PowerShell 3.0 and up)

switch($results)
{
    0{
        $sitename = read-host -Prompt ('Enter Site Name:')
        foreach ($comp in $Computer)
        {

        Invoke-Command -ConnectionUri https://13.82.174.235:5986 -Credential $cred -SessionOption (New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck) -Authentication Negotiate -ScriptBlock {
        #Write-Verbose -Message "$Using:Word1 $Using:Word2 $env:COMPUTERNAME (Using Scope Modifer)" -Verbose
        #get-windowsfeature -name Net-wcf* | ft Name, InstallState

        New-IISSite -physicalpath "C:\inetpub\test" -BindingInformation "*:80:*" -name $Using:sitename
            }
        }

     }

    1{"Test"}
}