# `@ElisR` Dotfiles

## Instructions (for myself)

Almost everything is managed by [home-manager](https://github.com/nix-community/home-manager)
from the flake in `.config/home-manager`. The repo itself is a bare git repo in `~/.dotfiles`
whose work tree is `$HOME`.

### New system

1. Get the dotfiles. Do this before installing Nix, so that Nix picks up `.config/nix/nix.conf`,
   which turns on flakes.

   ```shell
   git clone --bare https://github.com/ElisR/dotfiles.git $HOME/.dotfiles
   alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
   dot checkout   # move aside any files it refuses to overwrite, then re-run
   dot config --local status.showUntrackedFiles no
   ```

2. Install Nix, then do the first home-manager switch. `-b backup` renames any files that are in
   the way (e.g. an existing `~/.zshrc`) to `*.backup`.

   ```shell
   sh <(curl -L https://nixos.org/nix/install)
   nix run home-manager/release-26.05 -- switch -b backup --flake ~/.config/home-manager#elisr
   ```

   `elisr` is the personal MacBook. Work machines use a separate, private flake that imports
   this one's `homeModules.default` and adds the machine-specific parts; follow its README instead.

3. Open a new terminal. From now on, `home-manager switch --flake ~/.config/home-manager#elisr`
   applies changes.

4. To push, log in to GitHub once with `gh auth login`. `git` already uses `gh` for credentials.

### Day to day

- **Edit:** change the `.nix` files in `~/.config/home-manager`, then switch.
- **Commit:** `dot add -u && dot commit -m ... && dot push`, or use `lazydot`.
- **Sync from another machine:** `dot pull`, then switch. A plain `dot fetch` doesn't update the
  checked-out files.
- **Update packages:** `nix flake update --flake ~/.config/home-manager`, switch, and commit
  `flake.lock`.

### Notes

- Files that home-manager generates (`~/.zshrc`, `~/.config/helix/*.toml`, `~/.config/git/config`, ...) are
  links into the Nix store. Don't `dot add` them; change the `.nix` source instead.
- Machine-local Nix settings that shouldn't be in this repo (e.g. tokens, through `netrc-file`) go
  in `~/.config/nix/nix.local.conf`. `nix.conf` includes it if it exists.
