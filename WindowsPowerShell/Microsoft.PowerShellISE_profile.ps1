# $profile.CurrentUserAllHosts loads first.
# Common Functions are defined in $profile.CurrentUserAllHosts
#Output Pane Options
$psISE.Options.ConsolePaneBackgroundColor = $BGColor
$psISE.Options.ConsolePaneTextBackgroundColor = $BGColor
$psISE.Options.ConsolePaneForegroundColor = $FGColor
$psISE.Options.FontName = $Font

#region ISE Addons
#ShowDSCResource AddOn
Install-DscResourceAddOn

#Script Analyzer Begin
If (Test-Path -Path 'C:\Program Files (x86)\Microsoft Corporation\Microsoft Script Browser\System.Windows.Interactivity.dll') {Add-Type -Path 'C:\Program Files (x86)\Microsoft Corporation\Microsoft Script Browser\System.Windows.Interactivity.dll'}
If (Test-Path -Path 'C:\Program Files (x86)\Microsoft Corporation\Microsoft Script Browser\BestPractices.dll') {Add-Type -Path 'C:\Program Files (x86)\Microsoft Corporation\Microsoft Script Browser\BestPractices.dll'}
$scriptAnalyzer = $psISE.CurrentPowerShellTab.VerticalAddOnTools.Add('Script Analyzer', [BestPractices.Views.BestPracticesView], $true)
$psISE.CurrentPowerShellTab.VisibleVerticalAddOnTools.SelectedAddOnTool = $scriptAnalyzer
#Script Browser End
#endregion

Clear-Host
Write-Host "Welcome to the PowerShell Integrated Scripting Environment(ISE) $Env:USERNAME"
