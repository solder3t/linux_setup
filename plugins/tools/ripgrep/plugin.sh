plugin_describe() { echo "ripgrep - Recursively search directories for a regex pattern"; }

plugin_install() {
  if command -v rg >/dev/null 2>&1; then
    echo "✅ ripgrep is already installed"
    return
  fi

  echo "📦 Installing ripgrep..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm ripgrep ;;
    dnf)    sudo dnf install -y ripgrep ;;
    apt)    sudo apt install -y ripgrep ;;
  esac
}
