#Set up Environment Variables
$myDocs = [environment]::getfolderpath("mydocuments")
$myScripts = $myDocs + "\Scripts"

#Set up PSDrives
New-PSDrive -Name Scripts -PSProvider FileSystem -Root $myScripts | Out-Null

#Function
Function Test-ConsoleHost {
    If ($host.Name -match 'consolehost') {
        $true
    } Else {
        $False
    }
} #End Test-ConsoleHost

Function Reload-Module {
    <#
    .SYNOPSIS
        Reloads a specified module or all modules
    .DESCRIPTION
        If a module has changed since it was originally loaded, you can use this function to reload that module

        If no module is specified, this will reload all Script Modules.
    .EXAMPLE
        Reload-Module [-Module] String
    .EXAMPLE
        Reload-Module
    .NOTES
        Author     : Alvin Hall - Alvin.Hall@bhpbilliton.com
        Date       : 23/07/2015
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory=$False,ValueFromPipeline=$False,ValueFromPipelineByPropertyName=$False)][string]$Module)
    If ($Module) {
        If (Get-Module -ListAvailable -Verbose:$False | Where-Object {$_.Name -eq $Module}) {
            Write-Verbose "Module $Module exists"
            If (Get-Module -All | Where-Object {$_.Name -eq $Module}) {
                Write-Verbose "Removing Module $Module"
                Remove-Module -Name $Module -Verbose:$False
            }
            Write-Verbose "Importing Module $Module now..."
            Import-Module -Name $Module -Force -WarningAction SilentlyContinue -Verbose:$False
        } Else {
            Write-Verbose "Module $Module does not exist"
        }
    } Else {
        Write-Verbose "Reloading all Script Modules"
        Get-Module -All | Where-Object {$_.ModuleType -eq 'Script'} | Import-Module -Force -WarningAction SilentlyContinue -Verbose:$False
    }
}

#Prepare Environment
Set-Location $myDocs

$global:FGColor = 'Green'
$global:BGColor = 'Black'
$global:Font = "Courier New"
