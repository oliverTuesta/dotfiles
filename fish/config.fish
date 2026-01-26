alias tx="tmux"
alias vi="nvim"

fnm env --use-on-cd | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
export PATH="$HOME/.local/bin:$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
