param([switch]$Elevated)
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Test-Admin) -eq $false) {
    if ($elevated) {
        # Tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
'Running with full privileges'

Set-ExecutionPolicy Unrestricted
cls

$Host.UI.RawUI.WindowTitle = 'AD Groups Add'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** AD Groups Add v3 *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

while ($true) {
$csvfile = Read-Host -Prompt 'Insert CSV file name'
$csvpath = "$csvfile"
Write-Host

$groupdata = Import-Csv $csvpath -Delimiter ";"

foreach ($group in $groupdata) {

$username = $group.User
$groupname = $group.Group

    Add-ADGroupMember -Identity $groupname -Members $username -Verbose
}

Write-Host "Operation completed!"
Write-Host
Write-Host ======================================================================================================================
Write-Host
continue
}