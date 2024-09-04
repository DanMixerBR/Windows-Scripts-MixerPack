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


$Host.UI.RawUI.WindowTitle = 'Users configured to [Change password at next logon]'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** Users configured to [Change password at next logon] *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDOMAIN / $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

Get-ADUser -Filter {Enabled -eq $True} –Properties "DisplayName" | Select-Object -Property "SamAccountName","DisplayName","UserMustChangePassword" | Where-Object { $_.SamAccountName -match "^[A-Za-z]" -and $_.DisplayName -ne $null } | Sort-Object -Property "DisplayName" | findstr /C:SamAccountName /C:Displayname /C:UserMustChangePassword /C:- /C:"{}"
Write-Host
Write-Host ======================================================================================================================
Write-Host
pause