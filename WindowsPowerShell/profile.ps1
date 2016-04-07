#Set up Environment Variables
$myDocs = [environment]::getfolderpath("mydocuments")
$myScripts = $myDocs + "\Scripts"

#Set up PSDrives
New-PSDrive -Name Scripts -PSProvider FileSystem -Root $myScripts | Out-Null

#region Load Profile Functions
$functions = @( Get-ChildItem -Path $PSScriptRoot\Functions\*.ps1 -ErrorAction SilentlyContinue )
Foreach($function in $functions){
    Try{
        . $function.fullname
    }
    Catch{
        Write-Error -Message "Failed to import function $($function.fullname): $_"
    }
}
#endregion

#Prepare Environment
Set-Location $myDocs

#Set the default prompt
function prompt{
    $currentDirectory = Split-Path (Get-Location) -Leaf
    $host.UI.RawUI.WindowTitle = "PowerShell Console $Env:USERNAME $(Get-Location)"
    "PS: $currentDirectory>"
} 

$global:FGColor = 'Green'
$global:BGColor = 'Black'
$global:Font = "Courier New"