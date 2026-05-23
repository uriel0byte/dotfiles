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