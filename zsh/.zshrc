# Mostly copied from this guide
# https://www.bitdoze.com/starship-ghostty-terminal/

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit

eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"

# Quick edit configuration files
alias editstarship="vim ~/.config/starship.toml"
alias editghost="vim ~/.config/ghostty/config"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"

# Quick directory navigation
alias dev="cd ~/Development"
alias docs="cd ~/Documents"

alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
