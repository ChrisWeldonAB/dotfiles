# Dotfiles
This is a master repo which manages my dotfiles and configurations.
The main items tracked are:
 - nvim
 - tmux
 - ghostty
 - zsh
among others.

All of the folders contained in `xdg_config_home/` will be installed to `$XDG_CONFIG_HOME` and all which are in `home/` will be installed to `$HOME`.

## Installation

You have two options for installation:

1) Install everything with chrisweldon-dotfiles-setup
    - Installation is completed for your
2) Install piecemeal manually

Either way, I recommend you familiarize yourself wiht GNU `stow`. This will allow you to easily stay up to date on latest dotfile changes, and also keep your system as clean as possible.

### 1) Install with chrisweldon-dotfiles-setup
Ensure you have `XDG_CONFIG_HOME` set to a location that you are happy with. My preference is `~/.config`.

You can do this by editing your `~/.zshenv` file, or your `~/.zshprofile`. I recommend setting all your personalized env variables 
in the `~/.zshenv` file.

```
echo 'export XDG_CONFIG_HOME=<path/to/config/home>' > ~/.zshenv
```

Now run `chrisweldon-dotfiles-setup`. Reload your session.

NOTE: `chrisweldon-dotfiles-setup` will append your `.zshenv` file with necessary edits to ensure the adoption of the new configs.
If you have predefined config files that exist in the target location, chrisweldon-dotfiles-setup will stop

### 2) Install manually

## TODO
- Secrets
- Pip
- UV TOML
