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


$Host.UI.RawUI.WindowTitle = 'AD Users with [User must change password]'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** AD Users with [User must change password] *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDOMAIN / $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

Get-ADUser -Filter {Enabled -eq $True -and PasswordLastSet -eq 0} –Properties "DisplayName" | Select-Object -Property "SamAccountName","DisplayName","UserMustChangePassword" | Where-Object { $_.SamAccountName -match "^[A-Za-z]" -and $_.DisplayName -ne $null } | Sort-Object -Property "DisplayName" | findstr /C:SamAccountName /C:Displayname /C:UserMustChangePassword /C:- /C:"{}" | Out-File -FilePath "List_ADUsers_MustChangePassword.txt"
Start-Process "List_ADUsers_MustChangePassword.txt"
Write-Host Operation complete!
Write-Host
Write-Host ======================================================================================================================
Write-Host
pause