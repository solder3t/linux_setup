plugin_describe() { echo "htop - Interactive process viewer"; }

plugin_install() {
  if command -v htop >/dev/null 2>&1; then
    echo "✅ htop is already installed"
    return
  fi

  echo "📦 Installing htop..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm htop ;;
    dnf)    sudo dnf install -y htop ;;
    apt)    sudo apt install -y htop ;;
  esac
}
