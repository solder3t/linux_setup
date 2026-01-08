plugin_describe() { echo "lazygit - Simple terminal UI for git commands"; }

plugin_install() {
  if command -v lazygit >/dev/null 2>&1; then
    echo "✅ lazygit is already installed"
    return
  fi

  echo "📦 Installing lazygit..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm lazygit ;;
    dnf)    sudo dnf install -y lazygit ;;
    apt)    
        # LazyGit often requires PPA or direct install on older Ubuntus
        # We will try apt, if fail, suggest PPA? Or just do the go install/binary?
        # Let's try apt first.
        # For robustness, we could pull the binary from github releases if apt fails, 
        # but that's complex for this snippet.
        sudo apt install -y lazygit
        ;;
  esac
}
