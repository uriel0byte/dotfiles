# =====================================================================
# URIEL'S BLUE TEAM LAB DEPLOYMENT SCRIPT
# =====================================================================

# 1. Request Administrator Privileges (Required for Symlinks)
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Write-Host "Starting Environment Deployment..." -ForegroundColor Cyan

# 2. Install Core CLI & Security Tools via Winget
$packages = @(
    "eza-community.eza"
    "JanDeDobbeleer.OhMyPosh"
    "sharkdp.fd"
    "junegunn.fzf"
    "aristocratos.btop"
    "sxyazi.yazi"
    "BurntSushi.ripgrep.MSVC"
    "jqlang.jq"
    "yt-dlp"
    "ajeetdsouza.zoxide"
    "Gyan.FFmpeg"
    "7zip.7zip"
    "ImageMagick.ImageMagick"
    "voidtools.Everything"
    "FlowLauncher.FlowLauncher"
)

Write-Host "`n[1/2] Installing CLI Toolkit..." -ForegroundColor Yellow
foreach ($pkg in $packages) {
    winget install --id $pkg -e --accept-source-agreements --accept-package-agreements
}

# 3. Create Symbolic Links
Write-Host "`n[2/2] Linking Configuration Files..." -ForegroundColor Yellow
$DotfilesDir = "$Home\Documents\GitHub\dotfiles"

# Helper function to silently remove and link
function Link-File {
    param ($Target, $Link)
    # Ensure the parent directory exists
    $Parent = Split-Path -Path $Link
    if (!(Test-Path -Path $Parent)) { New-Item -ItemType Directory -Path $Parent -Force | Out-Null }
    
    Remove-Item -Path $Link -Force -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $Link -Target $Target -Force | Out-Null
    Write-Host "  Linked: $Link -> $Target" -ForegroundColor DarkGray
}

# PowerShell
Link-File -Target "$DotfilesDir\PowerShell\Microsoft.PowerShell_profile.ps1" -Link $PROFILE
Link-File -Target "$DotfilesDir\PowerShell\atomic.omp.json" -Link "$Home\Documents\PowerShell\atomic.omp.json"

# Discord (System24)
Link-File -Target "$DotfilesDir\Discord\system24.theme.css" -Link "$Home\AppData\Roaming\BetterDiscord\themes\system24.theme.css"

# Spicetify
Link-File -Target "$DotfilesDir\Spicetify\color.ini" -Link "$env:APPDATA\spicetify\Themes\text\color.ini"
Link-File -Target "$DotfilesDir\Spicetify\user.css" -Link "$env:APPDATA\spicetify\Themes\text\user.css"

# Komorebi
Link-File -Target "$DotfilesDir\Komorebi\komorebi.json" -Link "$Home\komorebi.json"

# YASB
Link-File -Target "$DotfilesDir\YASB\config.yaml" -Link "$Home\.config\yasb\config.yaml"
Link-File -Target "$DotfilesDir\YASB\styles.css" -Link "$Home\.config\yasb\styles.css"

Write-Host "`nDeployment Complete! Restart your terminal for profile changes to take effect." -ForegroundColor Green
Pause