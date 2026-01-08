plugin_describe() { echo "jq - Command-line JSON processor"; }

plugin_install() {
  if command -v jq >/dev/null 2>&1; then
    echo "✅ jq is already installed"
    return
  fi

  echo "📦 Installing jq..."
  case "$PM" in
    pacman) sudo pacman -S --needed --noconfirm jq ;;
    dnf)    sudo dnf install -y jq ;;
    apt)    sudo apt install -y jq ;;
  esac
}
