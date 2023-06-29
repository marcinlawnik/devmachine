# Boxstarter script for amrcinlawnik windows machines
# Created after one too many reinstalls

# To run: START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/marcinlawnik/devmachine/main/boxstarter.ps1

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Boxstarter options
# https://boxstarter.org/winconfig
Disable-GameBarTips


choco install git
choco install firefox
