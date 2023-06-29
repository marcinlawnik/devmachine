# Boxstarter script for amrcinlawnik windows machines
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

#utilities
choco install firefox
choco install notepadplusplus
choco install anydesk.install
choco install 7zip
choco install keepassxc

#communication
choco install discord

#media
choco install vlc
choco install gimp



