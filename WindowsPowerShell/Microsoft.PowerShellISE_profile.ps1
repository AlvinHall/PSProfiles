# $profile.CurrentUserAllHosts loads first.
# Common Functions are defined in $profile.CurrentUserAllHosts
#Output Pane Options
$psISE.Options.ConsolePaneBackgroundColor = $BGColor
$psISE.Options.ConsolePaneTextBackgroundColor = $BGColor
$psISE.Options.ConsolePaneForegroundColor = $FGColor
$psISE.Options.FontName = $Font

Clear-Host
Write-Host "Welcome to the PowerShell Integrated Scripting Environment(ISE) $Env:USERNAME"