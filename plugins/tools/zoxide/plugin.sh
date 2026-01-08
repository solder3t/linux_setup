plugin_describe() { echo "zoxide - A smarter cd command"; }

plugin_install() {
  if command -v zoxide >/dev/null 2>&1; then
    echo "✅ zoxide is already installed"
    return
  fi

  echo "📦 Installing zoxide..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm zoxide ;;
    dnf)    
        # Older fedora might not have it, but recent ones do.
        sudo dnf install -y zoxide || {
            echo "⚠️ zoxide not found in dnf, trying simple curl install..."
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        }
        ;;
    apt)    
        sudo apt install -y zoxide || {
            echo "⚠️ zoxide not found in apt, trying simple curl install..."
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        }
        ;;
  esac
}
