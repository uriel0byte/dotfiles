# 🦅 Uriel's Windows Blue Team Environment (Dotfiles)

This repository contains the configuration files, CLI tool lists, and symlink scripts necessary to recreate my specialized Windows 11 environment. 

The goal of this setup is to create a high-contrast, monochrome, keyboard-centric workspace that emulates a native Linux terminal environment—optimizing muscle memory for Cybersecurity SOC operations, Active Directory management, and OSINT investigations.

---

## 🛠️ CLI Toolkit (The "Linux on Windows" Stack)

I rely on the following command-line tools to replace standard Windows GUI operations.

| Tool | Purpose | Installation (Winget) |
| :--- | :--- | :--- |
| **eza** | Modern `ls` replacement (Icons, colors, sorting) | `winget install eza-community.eza` |
| **Oh My Posh** | Custom terminal prompt styling (`atomic` theme) | `winget install JanDeDobbeleer.OhMyPosh` |
| **FD** | Lightning-fast alternative to `find` | `winget install sharkdp.fd` |
| **FZF** | Command-line fuzzy finder for interactive filtering | `winget install junegunn.fzf` |
| **BTOP** | Native Linux-style resource monitor | `winget install aristocratos.btop` |
| **Yazi** | Blazing fast terminal file manager | `winget install sxyazi.yazi` |

## 🎨 Theme Architecture (Monochrome TUI)

The visual design language across all applications is strictly high-contrast monochrome (Black/Grey/White) with pure red `#FF0000` reserved exclusively for critical system alerts and unread notifications.

* **Terminal:** Windows Terminal (Campbell/Black scheme) + `atomic` Oh My Posh theme.
* **Discord:** [System24](https://github.com/refact0r/system24) custom TUI theme via BetterDiscord.
* **Spotify:** [Spicetify](https://spicetify.app/) running the `text` theme with custom monochrome HEX overrides.
* **Typography:** System-wide default monospace font is `JetBrainsMono Nerd Font`.

## ⚙️ PowerShell Aliases (Linux Muscle Memory)

To maintain command parity with Linux environments during active recall study sessions, the `$PROFILE` maps the following native Windows commands:
* `ls` / `ll` -> `eza`
* `grep` -> `Select-String`
* `touch` -> `New-Item`
* `cat` -> `Get-Content`

## 🚀 Restoration Guide (How to Apply These Dotfiles)

*When setting up a fresh Windows installation, follow these steps to restore the environment:*

1.  **Clone the Repository:**
    `git clone https://github.com/YOUR_USERNAME/dotfiles.git $Home\Documents\GitHub\dotfiles`
2.  **Install Base Requirements:** Install Winget, Git, Windows Terminal, PowerShell 7, and BetterDiscord.
3.  **Run Symlinks:**
    *(Add your symlink script here or create an `install.ps1` script in the repo later to automate this).*