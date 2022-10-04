# dotfiles

You can use GNU Stow to place the configuration files into their correct places. 

```zsh
stow */
```

For `tmux` you need to install its plugin manager first. Start by cloning the `tpm` repository and then you can install plugins with `<c-b> I` keybind.

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
