plugin_describe() { echo "ncdu - NCurses Disk Usage"; }

plugin_install() {
  if command -v ncdu >/dev/null 2>&1; then
    echo "✅ ncdu is already installed"
    return
  fi

  echo "📦 Installing ncdu..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm ncdu ;;
    dnf)    sudo dnf install -y ncdu ;;
    apt)    sudo apt install -y ncdu ;;
  esac
}
