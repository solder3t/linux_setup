PLUGINS_LOADED=()
load_plugins() {
  for plugin in "$ROOT_DIR/plugins"/*/*/plugin.sh "$ROOT_DIR/plugins"/*/plugin.sh; do
    [[ -f "$plugin" ]] || continue
    # Don't source here, just track the file
    PLUGINS_LOADED+=("$plugin")
  done
}

run_plugin_hook() {
  local hook="$1"
  for plugin in "${PLUGINS_LOADED[@]}"; do
    # Run in subshell to avoid polluting global namespace
    (
      source "$plugin"
      if declare -f "plugin_$hook" >/dev/null; then
        plugin_"$hook"
      fi
    )
  done
}


INSTALLED_SUMMARY=()

run_selected_plugins() {
  local hook="$1"; shift
  local targets=("$@")

  for plugin in "${PLUGINS_LOADED[@]}"; do
    local p_name
    p_name="$(basename "$(dirname "$plugin")")"
    
    for t in "${targets[@]}"; do
      if [[ "$p_name" == "$t" ]]; then
        (
          source "$plugin"
          if declare -f "plugin_$hook" >/dev/null; then
            plugin_"$hook"
          fi
        )
        # Track success (assuming subshell didn't exit script, which it won't)
        # Verify success via return code?
        if [[ $? -eq 0 && "$hook" == "install" ]]; then
           INSTALLED_SUMMARY+=("$p_name")
        fi
      fi
    done
  done
}

run_default_profile() {
  echo "📦 Running default linux-setup profile"
  DEFAULT=(integrations zsh ccache clang android)
  run_selected_plugins install "${DEFAULT[@]}"
}
