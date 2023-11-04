# Boxstarter script for marcinlawnik windows machines
# Created after one too many reinstalls

# To run (no reboots, may fail): START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/marcinlawnik/devmachine/main/boxstarter.ps1
# To run: START https://boxstarter.org/package/url?https://raw.githubusercontent.com/marcinlawnik/devmachine/main/boxstarter.ps1

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Boxstarter options
# https://boxstarter.org/winconfig
Disable-GameBarTips

#programming
choco install git
choco install phpstorm
choco install pycharm-edu
choco install nvm

#utilities
choco install firefox
choco install notepadplusplus
choco install anydesk.install
choco install 7zip
choco install keepassxc
choco install powertoys

#communication
choco install discord

#media
choco install vlc
choco install gimp
choco install k-litecodecpackbasic
choco install ffmpeg
choco install spotify


# ========
# Taskbar search removal - https://jdhitsolutions.com/blog/powershell/8424/hiding-taskbar-search-with-powershell/
# ========

Function Restart-Explorer {
    <#
    .Synopsis
    Restart the Windows Explorer process.
    #>
    [cmdletbinding(SupportsShouldProcess)]
    [Outputtype("None")]
    Param()

    Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
    Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Stopping Explorer.exe process"
    Get-Process -Name Explorer | Stop-Process -Force
    #give the process time to start
    Start-Sleep -Seconds 2
    Try {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Verifying Explorer restarted"
        $p = Get-Process -Name Explorer -ErrorAction stop
    }
    Catch {
        Write-Warning "Manually restarting Explorer"
        Try {
            Start-Process explorer.exe
        }
        Catch {
            #this should never be called
            Throw $_
        }
    }
    Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
}

Function Disable-TaskBarSearch {
    <#
    .Synopsis
     Disable the Windows taskbar search box
    #>
    [cmdletbinding(SupportsShouldProcess)]
    [Alias("Hide-SearchBar")]
    [OutputType("Boolean")]
    Param()

    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
    } #begin
    Process {
        Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Hiding Task Bar Search"

        Try {
            $splat = @{
                Path        = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'
                Name        = 'SearchBoxTaskbarMode'
                Value       = 0
                Type        = 'DWord'
                Force       = $True
                ErrorAction = 'Stop'
            }
            Set-ItemProperty @splat
            if ($WhatIfPreference) {
                #return false if using -Whatif
                $False
            }
            else {
                $True
            }
        }
        Catch {
            $False
            Throw $_
        }
        Restart-Explorer
    } #process
    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end
}

Function Enable-TaskBarSearch {
    <#
    .Synopsis
     Enable the Windows taskbar search box
    #>
    [cmdletbinding(SupportsShouldProcess)]
    [Alias("Show-SearchBar")]
    [OutputType("Boolean")]
    Param()

    Begin {
        Write-Verbose "[$((Get-Date).TimeofDay) BEGIN  ] Starting $($myinvocation.mycommand)"
    } #begin
    Process {
        Write-Verbose "[$((Get-Date).TimeofDay) PROCESS] Showing Task Bar Search"

        Try {
            $splat = @{
                Path        = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'
                Name        = 'SearchBoxTaskbarMode'
                Value       = 2
                Type        = 'DWord'
                Force       = $True
                ErrorAction = 'Stop'
            }
            Set-ItemProperty @splat
            if ($WhatIfPreference) {
                #return false if using -Whatif
                $False
            }
            else {
                $True
            }
        }
        Catch {
            $False
            Throw $_
        }

        Restart-Explorer
    } #process
    End {
        Write-Verbose "[$((Get-Date).TimeofDay) END    ] Ending $($myinvocation.mycommand)"
    } #end
}

Disable-TaskBarSearch


