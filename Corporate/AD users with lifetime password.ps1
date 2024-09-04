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


$Host.UI.RawUI.WindowTitle = 'AD users with lifetime password'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** AD users with lifetime password *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDOMAIN / $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $true} –Properties "DisplayName", "PasswordNeverExpires" |
Select-Object -Property "SamAccountName","Displayname","PasswordNeverExpires" | Where-Object { $_.SamAccountName -match "^[A-Za-z]" -and $_.DisplayName -ne $null } | Sort-Object -Property "DisplayName" | findstr /C:SamAccountName /C:Displayname /C:PasswordNeverExpires /C:- /C:True
Write-Host
Write-Host ======================================================================================================================
Write-Host
pause