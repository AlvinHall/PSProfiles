# $profile.CurrentUserAllHosts loads first.
# Common Functions are defined in $profile.CurrentUserAllHosts

#Console pane options
$console = $Host.UI.RawUI
$console.ForegroundColor = $FGColor
Write-host "`$FGColor: $fgcolor"
$console.BackgroundColor = $BGColor
$console.WindowTitle = "PowerShell Console $Env:USERNAME"
 
#Prepare Environment
Clear-Host
Write-Host "Welcome to the PowerShell Console $Env:USERNAME"