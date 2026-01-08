plugin_describe() { echo "fastfetch - Like neofetch, but much faster"; }

plugin_install() {
  if command -v fastfetch >/dev/null 2>&1; then
    echo "✅ fastfetch is already installed"
    return
  fi

  echo "📦 Installing fastfetch..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm fastfetch ;;
    dnf)    sudo dnf install -y fastfetch ;;
    apt)    
        # Available in newer Ubuntu/Debian versions.
        # If not, users might need PPA or manual install, but we'll try apt first.
        # Fallback to direct binary could be an option but let's stick to package manager for now.
        sudo apt install -y fastfetch || echo "⚠️ fastfetch might not be in your apt repos (needs Ubuntu 24.10+ or PPA)"
        ;;
  esac
}
