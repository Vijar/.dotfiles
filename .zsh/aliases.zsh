# dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# vim using
nvim --version > /dev/null 2>&1
NEOVIM_INSTALLED=$?
if [ $NEOVIM_INSTALLED -eq 0 ]; then
  alias vim="nvim"
  alias vi="nvim"
fi

# Alias Editing
alias ae='vim ~/.zsh/aliases.zsh' #alias edit
alias ar='source ~/.zsh/aliases.zsh'  #alias reload

# vimrc editing
alias ve='vim ~/.config/nvim/init.vim'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Moving around
alias cdb='cd -'

# Show human friendly numbers and colors
alias df='df -h'
alias l='ls -al'
alias ls='ls -alGh'
alias du='du -h -d 2'

# Git Aliases
alias gs='git status'
alias gcm='git ci -m'
alias gd='git diff'
alias gf='git fetch'
alias gc='git co'
alias gcb='git nb' # new branch aka checkout -b

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }
