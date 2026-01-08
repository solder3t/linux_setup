plugin_describe() { echo "fd - Simple, fast and user-friendly alternative to find"; }

plugin_install() {
  if command -v fd >/dev/null 2>&1 || command -v fdfind >/dev/null 2>&1; then
    echo "✅ fd is already installed"
    # Link for ubuntu
    if command -v fdfind >/dev/null 2>&1 && ! command -v fd >/dev/null 2>&1; then
        mkdir -p "$HOME/.local/bin"
        ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
    fi
    return
  fi

  echo "📦 Installing fd..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm fd ;;
    dnf)    
        # Usually fd-find
        sudo dnf install -y fd-find 
        ;;
    apt)    
        sudo apt install -y fd-find
        mkdir -p "$HOME/.local/bin"
        ln -sf /usr/bin/fdfind "$HOME/.local/bin/fd"
        ;;
  esac
}
