# Enable Linux-style Autocomplete (PSReadLine)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

# Initialize Oh My Posh (Pulling a clean, native Linux-style prompt directly from the web)
oh-my-posh init pwsh --config "$Home\Documents\PowerShell\atomic.omp.json" | Invoke-Expression

# Linux Muscle Memory Aliases (Removed native ones, kept the missing ones)
Set-Alias -Name grep -Value Select-String
Set-Alias -Name touch -Value New-Item

# Forcefully remove Windows' default ls alias
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue

# Eza mappings
function ls { eza --icons --group-directories-first $args }
function ll { eza -al --icons --group-directories-first $args }

# ==========================================
# MODERN CLI TOOLS & ALIASES
# ==========================================

# Initialize Zoxide (Replaces 'cd' with 'z' for smart jumping)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Alias 'grep' to ripgrep for lightning-fast log hunting
Set-Alias -Name grep -Value rg

# Set up FZF default options for a cleaner look
$env:FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=dark"

# (Optional) Bind FZF to Ctrl+T and Ctrl+R if you want to use it for history/file searching
# Set-PSReadLineKeyHandler -Key Ctrl+t -ScriptBlock { Invoke-Fzf }