plugin_describe() { echo "eza - A modern, maintained replacement for ls"; }

plugin_install() {
  if command -v eza >/dev/null 2>&1; then
    echo "✅ eza is already installed"
    return
  fi

  echo "📦 Installing eza..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm eza ;;
    dnf)    
        # Might need copr on old fedora, trying standard
        sudo dnf install -y eza
        ;;
    apt)    
        # Needs gpg key usually... 
        # For now, let's try apt, and warn.
        sudo apt install -y eza || echo "⚠️ eza usually requires adding a gpg key/repo for Apt. Please check eza docs."
        ;;
  esac
}
