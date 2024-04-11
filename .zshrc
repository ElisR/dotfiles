alias ls="exa --icons"

alias zj="zellij --layout compact"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/e.roberts/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/e.roberts/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/e.roberts/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/e.roberts/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/e.roberts/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/e.roberts/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/e.roberts/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/e.roberts/opt/google-cloud-sdk/completion.zsh.inc'; fi

# Set Helix to be default editor
export EDITOR="hx"

# Managing dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazydot='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Set up zoxide to complete cd commands
eval "$(zoxide init zsh)"

# Set up Starship
eval "$(starship init zsh)"

# Do `conda config --set changeps1 False` to stop conda environment from being shown twice
