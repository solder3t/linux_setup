plugin_describe() { echo "delta - A syntax-highlighting pager for git, diff, and grep"; }

plugin_install() {
  if command -v delta >/dev/null 2>&1; then
    echo "✅ delta is already installed"
    return
  fi

  echo "📦 Installing delta..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm git-delta ;;
    dnf)    
        # git-delta usually
        sudo dnf install -y git-delta || sudo dnf install -y delta
        ;;
    apt)    
        # Has git-delta in newer repos?
        sudo apt install -y git-delta || echo "⚠️ delta might require manual install (cargo/binary) on older apt systems"
        ;;
  esac
}
