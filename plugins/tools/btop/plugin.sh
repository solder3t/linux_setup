plugin_describe() { echo "btop - Resource monitor that shows usage and stats"; }

plugin_install() {
  if command -v btop >/dev/null 2>&1; then
    echo "✅ btop is already installed"
    return
  fi

  echo "📦 Installing btop..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm btop ;;
    dnf)    sudo dnf install -y btop ;;
    apt)    sudo apt install -y btop ;;
  esac
}
