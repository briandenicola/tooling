param(
    [string] $UtilsPath = "C:\Utils",
    [string] $CodePath = "C:\Code"
)

$GitRepo = "https://github.com/briandencola/psscripts.git"

New-Item -Path $Path -ItemType Directory | Out-Null
winget install --silent --location $Path --scope user Microsoft.WindowsTerminal
winget install --silent --location $Path --scope user Microsoft.PowerShell
winget install --silent --location $Path --scope user JanDeDobbeleer.OhMyPosh

winget install --silent --location $Path --scope user Canonical.Ubuntu.2004

winget install --silent --location $Path --scope user Microsoft.DotNet.SDK.7
winget install --silent --location $Path --scope user Microsoft.VisualStudioCode
winget install --silent --location $Path --scope user Git.Git

winget install --silent --location $Path --scope user Microsoft.AzureCLI
winget install --silent --location $Path --scope user Microsoft.Azure.StorageExplorer
winget install --silent --location $Path --scope user Microsoft.SQLServerManagementStudio
winget install --silent --location $Path --scope user Microsoft.sqlcmd
winget install --silent --location $Path --scope user paolosalvatori.ServiceBusExplorer

winget install --silent --location $Path --scope user Helm.Helm
winget install --silent --location $Path --scope user Kubernetes.kubectl
winget install --silent --location $Path --scope user Hashicorp.Terraform

winget install --silent --location $Path --scope user Microsoft.Sysinternals.ProcessExplorer
winget install --silent --location $Path --scope user Microsoft.Sysinternals.TCPView

New-Item -Path $CodePath -ItemType Directory
Set-location $CodePath

git clone $GitRepo
Set-Location -Path (Join-Path -Path $CodePath -ChildPath "psscripts\Miscellaneous")
.\Update-PSModules.ps1

Update-PathVariable -Path "C:\Program Files\PowerShell\7\pwsh.exe" -Target Machine
Update-PathVariable -Path "C:\Program Files\PowerShell (x86)\7\pwsh.exe" -Target Machine -Remove
Update-PathVariable -Refresh