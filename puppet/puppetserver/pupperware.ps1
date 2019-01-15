# install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install build tooling
choco install -y git golang make

# make build tools available in current session
# by setting environment variable and importing Chocolatey PowerShell
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
Update-SessionEnvironment

# use `go get` to clone and build linuxkit source
# verbose output since this will generally take a while
# https://github.com/linuxkit/linuxkit/issues/3207 follows the upstream issue
go get -v -u github.com/Iristyle/linuxkit/src/cmd/linuxkit

# verify linuxkit built
# go copies binaries to $Env:GOPATH by default unless explicitly configured
& $Env:USERPROFILE\go\bin\linuxkit.exe help

# copy LCOW kernel source and build it with linuxkit
Push-Location $Env:Temp
git clone https://github.com/linuxkit/lcow
Push-Location lcow
$Env:Path += ";$Env:USERPROFILE\go\bin"
linuxkit build lcow.yml

# install the LCOW kernel image
New-Item "$Env:ProgramFiles\Linux Containers" -Type Directory -Force
Copy-Item .\lcow-initrd.img "$Env:ProgramFiles\Linux Containers\initrd.img"
Copy-Item .\lcow-kernel "$Env:ProgramFiles\Linux Containers\kernel"

# write version info to sidecar text file for posterity
git rev-parse head > "${Env:ProgramFiles}\Linux Containers\versions.txt"
type .\lcow.yml >> "${Env:ProgramFiles}\Linux Containers\versions.txt"