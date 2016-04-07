Function Test-ConsoleHost {
    If ($host.Name -match 'consolehost') {
        $true
    } Else {
        $False
    }
}