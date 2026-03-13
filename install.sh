#!/usr/bin/env zsh
set -e

DOTFILES="$HOME/.dotfiles"

echo "==> Installing Homebrew packages..."
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install stow starship zoxide eza fnm \
  zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search

echo "==> Installing fonts..."
brew install --cask font-commit-mono-nerd-font

echo "==> Stowing dotfiles..."
cd "$DOTFILES"

# Remove existing files that would conflict before stowing
[ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
[ -f "$HOME/.zprofile" ] && [ ! -L "$HOME/.zprofile" ] && mv "$HOME/.zprofile" "$HOME/.zprofile.bak"
[ -f "$HOME/.config/starship.toml" ] && [ ! -L "$HOME/.config/starship.toml" ] && mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.bak"

[ -f "$HOME/.config/ghostty/config" ] && [ ! -L "$HOME/.config/ghostty/config" ] && mv "$HOME/.config/ghostty/config" "$HOME/.config/ghostty/config.bak"

stow zsh starship ghostty

echo ""
echo "Done! Open a new shell to apply changes."
