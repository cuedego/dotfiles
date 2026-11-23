# Dotfiles

Personal Zsh configuration featuring Oh My Zsh, the Powerlevel10k theme, and
the `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins.

## Installation

On Ubuntu or Debian, clone this repository and run:

```bash
./install.sh
```

The installer uses `sudo` to install dependencies and set Zsh as your default
shell. It also installs Oh My Zsh, the theme, and plugins, then links the
configuration files into your home directory. Restart your terminal when it
finishes.

## Windows setup

### Install a Nerd Font

Powerlevel10k uses a Nerd Font for its prompt icons. MesloLGS NF is recommended:

1. Download the MesloLGS NF font files from the
   [Powerlevel10k manual font installation guide](https://github.com/romkatv/powerlevel10k#manual-font-installation).
2. Install the downloaded `.ttf` files in Windows (right-click and select
   **Install**).
3. In Windows Terminal, open **Settings** > your Ubuntu profile >
   **Appearance**, then select **MesloLGS NF** as the font face.

### Set up WSL and Windows Terminal

1. In PowerShell, install Ubuntu with `wsl --install -d Ubuntu`, then restart
   Windows if prompted.
2. Open Ubuntu from Windows Terminal and complete the initial setup by creating
   a Linux username and password.
3. In Ubuntu, clone this repository and follow the [installation](#installation)
   steps above.
4. Open Windows Terminal settings and make Ubuntu your preferred profile, or
   select Ubuntu from the profile menu. Set its font face to **MesloLGS NF** as
   described above.

### Use PuTTY for SSH

Install the same MesloLGS NF font on Windows, then configure your PuTTY session:

1. Under **Window** > **Appearance**, choose **MesloLGS NF** as the font.
2. Under **Window** > **Translation**, set the remote character set to
   **UTF-8**.
3. Under **Connection** > **Data**, set the terminal-type string to
   `xterm-256color`.
4. Save the session settings and connect to the SSH server.

The dotfiles and Zsh configuration must be installed on the remote SSH server
for Powerlevel10k to load there. The font is installed and configured locally
in PuTTY.

## Files

- `install.sh` — installs dependencies and configures the environment.
- `zshrc` — Oh My Zsh, theme, and plugin configuration.
- `p10k.zsh` — Powerlevel10k prompt configuration.
