# `@ElisR` Dotfiles

## Instructions (for myself)

On a new system, to get the dotfiles, run

```shell
git clone --bare https://github.com/ElisR/dotfiles.git $HOME/.dotfiles
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dot checkout
dot config --local status.showUntrackedFiles no
```

To get `nix` working, do

```shell
sh <(curl -L https://nixos.org/nix/install)
nix run home-manager/master
home-manager switch
```
