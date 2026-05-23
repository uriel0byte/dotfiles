# 🦅 Uriel's Blue Team & TUI Triage Environment

![Environment Preview](Assets/Screenshot1.png) 

![Environment Preview](Assets/Screenshot2.png) 

![Environment Preview](Assets/Screenshot3.png) 

This repository contains the configuration files, CLI toolkits, and symlink structures necessary to recreate my specialized Windows 11 environment. 

The goal of this setup is to create a high-contrast, monochrome, keyboard-centric workspace that emulates a native Linux terminal environment. This architecture optimizes muscle memory for SOC operations, log analysis, and OSINT investigations.

---

## 🛠️ The Core Toolkit (Linux on Windows)

I rely on the following command-line tools to bypass standard Windows GUI operations and parse data at speed.

### File Navigation & Management
| Tool | Purpose | Installation |
| :--- | :--- | :--- |
| **Yazi** | Blazing-fast terminal file manager (Vim-like navigation) | `winget install sxyazi.yazi` |
| **Zoxide** | Smarter `cd` alternative that learns directory habits | `winget install ajeetdsouza.zoxide` |
| **Eza** | Modern `ls` replacement (Icons, colors, grouping) | `winget install eza-community.eza` |
| **FD** | Lightning-fast alternative to the standard `find` command | `winget install sharkdp.fd` |

### Data Parsing & Investigation (Blue Team / OSINT)
| Tool | Purpose | Installation |
| :--- | :--- | :--- |
| **Ripgrep (`rg`)** | Extremely fast regex search inside files/logs | `winget install BurntSushi.ripgrep.MSVC` |
| **FZF** | Command-line fuzzy finder for filtering lists and history | `winget install junegunn.fzf` |
| **JQ** | Command-line JSON processor for formatting API/log data | `winget install jqlang.jq` |
| **yt-dlp** | Video downloading engine for OSINT artifact collection | `winget install yt-dlp` |

### System Utilities
| Tool | Purpose | Installation |
| :--- | :--- | :--- |
| **BTOP** | Native Linux-style resource and process monitor | `winget install aristocratos.btop` |
| **Oh My Posh** | Custom terminal prompt styling (`atomic` theme) | `winget install JanDeDobbeleer.OhMyPosh` |
| **FFmpeg** | Core engine for audio/video conversion and analysis | `winget install Gyan.FFmpeg` |
| **7-Zip** | Command-line archiving and extraction utility | `winget install 7zip.7zip` |

---

## ⚡ Command Hub (Flow Launcher)

PowerToys Run has been replaced by **Flow Launcher**, operating with a custom monochrome dark theme. It acts as the central execution hub, triggered via `Alt + Space`.

**Active Security Plugins:**
* **Everything:** Instant system-wide file indexing and retrieval.
* **Hash:** Instant MD5, SHA1, and SHA256 generation for malware artifact verification.
* **IP Address:** One-click retrieval and copying of local/public network IPs.
* **Sysinternals:** Instant execution of Microsoft diagnostic tools (Procmon, Autoruns).

---

## 🗺️ Workflow & Muscle Memory Cheat Sheet

A quick reference for daily operations without touching the mouse:

* **Jump to a directory:** `z <folder-name>` (e.g., `z dotfiles`)
* **List files:** `ls` or `ll` (triggers `eza`)
* **Visual File Manager:** `yazi` (Use arrow keys or `hjkl` to navigate, `q` to quit)
* **Search inside logs:** `rg "failed login" <filename>`
* **Format a JSON log:** `cat data.json | jq`
* **Monitor system resources:** `btop`
* **Trigger Flow Launcher:** `Alt + Space`

---

## 🎨 Theme Architecture

The visual design language across all applications is strictly high-contrast monochrome (Black/Grey/White) with pure red (`#FF0000`) reserved exclusively for critical system alerts.

* **Terminal:** Windows Terminal (Campbell/Black scheme) + `atomic` Oh My Posh theme.
* **Taskbar:** Custom GlazeWM/YASB configuration.
* **Discord:** [System24](https://github.com/refact0r/system24) custom TUI theme via BetterDiscord.
* **Spotify:** [Spicetify](https://spicetify.app/) running the `text` theme with custom HEX overrides.
* **Typography:** System-wide default monospace font is `JetBrainsMono Nerd Font`.

---

## 🚀 Restoration Guide

*When setting up a fresh Windows installation, follow these steps to restore the environment:*

1.  **Clone the Repository:**
    `git clone https://github.com/YOUR_USERNAME/dotfiles.git $Home\Documents\GitHub\dotfiles`
2.  **Install Base Requirements:** Install Winget, Git, Windows Terminal, and PowerShell 7.
3.  **Run Tool Installations:** Install the utilities listed in the tables above.
4.  **Execute Symlinks:** Remove original configurations and create hardlinks back to this repository. *(Symlink script pending).*