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

## Files

- `install.sh` — installs dependencies and configures the environment.
- `zshrc` — Oh My Zsh, theme, and plugin configuration.
- `p10k.zsh` — Powerlevel10k prompt configuration.
