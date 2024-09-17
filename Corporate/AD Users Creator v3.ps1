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

$Host.UI.RawUI.WindowTitle = 'AD Users Creator'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
cls
Write-Host ======================================================================================================================
Write-Host *** AD Users Creator v3 *** by DanMixerBR
Write-Host ======================================================================================================================
Write-Host
Write-Host Domain: $env:USERDNSDOMAIN
Write-Host
Write-Host ======================================================================================================================
Write-Host

Set-ADDefaultDomainPasswordPolicy -Identity $env:USERDNSDOMAIN -ComplexityEnabled $false

$csvfile = Read-Host -Prompt 'Insert CSV file name'
$csvpath = "$csvfile"
Write-Host

$oupath = Read-Host -Prompt 'Insert OU path'
$infodomain = Get-ADDomain | Select-Object -ExpandProperty DistinguishedName
Write-Host

$userdata = Import-Csv $csvpath -Delimiter ";"

foreach ($user in $userdata) {

$username = $user.MAC
$description = $user.Description
$password = $user.MAC

New-ADUser `
    -Name $username `
    -SamAccountName $username `
    -GivenName $username `
    -DisplayName $username `
    -UserPrincipalName $username@$env:USERDNSDOMAIN `
    -Description $description `
    -Path "$oupath,$infodomain" `
    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
    -PasswordNeverExpires $true `
    -CannotChangePassword $true `
    -Enable $true
}

Set-ADDefaultDomainPasswordPolicy -Identity $env:USERDNSDOMAIN -ComplexityEnabled $true

Write-Host "Operation completed!"
Write-Host
Write-Host ======================================================================================================================
Write-Host
pause