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


$Host.UI.RawUI.WindowTitle = 'Check Windows password validity by date'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** Check Windows password validity by date v2 *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDOMAIN / $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

while ($true) {
$datetime = Read-Host -Prompt 'Insert date'
Write-Host

Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" |
Select-Object -Property "SamAccountName","Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} | Sort-Object -Property "DisplayName" | findstr /C:Displayname /C:ExpiryDate /C:- /C:$datetime
Write-Host
Write-Host ======================================================================================================================
Write-Host
continue
}