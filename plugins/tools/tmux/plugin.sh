plugin_describe() { echo "tmux - Terminal multiplexer"; }

plugin_install() {
  if command -v tmux >/dev/null 2>&1; then
    echo "✅ tmux is already installed"
    return
  fi

  echo "📦 Installing tmux..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm tmux ;;
    dnf)    sudo dnf install -y tmux ;;
    apt)    sudo apt install -y tmux ;;
  esac
}
