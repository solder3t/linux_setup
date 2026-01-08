plugin_describe() { echo "neovim - Hyperextensible Vim-based text editor"; }

plugin_install() {
  if command -v nvim >/dev/null 2>&1; then
    echo "✅ neovim is already installed"
    return
  fi

  echo "📦 Installing neovim..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm neovim ;;
    dnf)    sudo dnf install -y neovim ;;
    apt)    
        # Check for glibc version or ubuntu version, as older ones have very old nvim.
        # But for simplicity in this setup, we'll install standard repo version or snap if requested, 
        # but pure package manager is safer for consistency.
        # Ideally, we add ppa:neovim-ppa/unstable or stable, but let's stick to default first to avoid external repo complexity unless needed.
        sudo apt install -y neovim 
        ;;
  esac
}
