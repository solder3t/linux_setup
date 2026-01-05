PLUGINS_LOADED=()
load_plugins() {
  for plugin in "$ROOT_DIR/plugins"/*/*/plugin.sh "$ROOT_DIR/plugins"/*/plugin.sh; do
    [[ -f "$plugin" ]] || continue
    source "$plugin"
    PLUGINS_LOADED+=("$plugin")
  done
}

run_plugin_hook() {
  local hook="$1"
  for plugin in "${PLUGINS_LOADED[@]}"; do
    grep -q "plugin_install()" "$plugin" && plugin_install
  done
}

run_selected_plugins() {
  local hook="$1"; shift
  local targets=("$@")

  for plugin in "${PLUGINS_LOADED[@]}"; do
    for t in "${targets[@]}"; do
      if [[ "$plugin" == *"/$t/"* ]]; then
        grep -q "plugin_${hook}()" "$plugin" && plugin_${hook}
      fi
    done
  done
}

run_default_profile() {
  echo "📦 Running default linux-setup profile"
  DEFAULT=(integrations zsh ccache clang android)
  run_selected_plugins install "${DEFAULT[@]}"
}
