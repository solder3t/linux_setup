plugin_describe() { echo "fzf - Command-line fuzzy finder"; }

plugin_install() {
  if command -v fzf >/dev/null 2>&1; then
    echo "✅ fzf is already installed"
    return
  fi

  echo "📦 Installing fzf..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm fzf ;;
    dnf)    sudo dnf install -y fzf ;;
    apt)    sudo apt install -y fzf ;;
  esac
}
