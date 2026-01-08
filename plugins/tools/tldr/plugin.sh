plugin_describe() { echo "tldr - Collaborative cheatsheets for console commands"; }

plugin_install() {
  if command -v tldr >/dev/null 2>&1 || command -v tealdeer >/dev/null 2>&1; then
    echo "✅ tldr/tealdeer is already installed"
    return
  fi

  echo "📦 Installing tldr..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm tealdeer ;;
    dnf)    
        sudo dnf install -y tealdeer || sudo dnf install -y tldr 
        ;;
    apt)    
        sudo apt install -y tldr 
        # apt tldr requires initially updating cache
        echo "ℹ️ Updating tldr cache..."
        tldr --update || true
        ;;
  esac
}
