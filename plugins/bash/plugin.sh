plugin_describe() {
  echo "shell     - Bash shell configuration"
}

plugin_install() {
  if ! command -v starship >/dev/null; then
      echo "📦 Installing Starship prompt..."
      curl -sS https://starship.rs/install.sh | sh -s -- -y
  fi
  install_bash_config
}
