# yazi: cd into last directory on exit
function y() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi --cwd-file="$tmp" "$@"

  local cwd=""
  if [[ -f "$tmp" ]]; then
    cwd="$(cat "$tmp")"
    rm -f "$tmp"
  fi

  if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    cd "$cwd"
  fi
}

# Ctrl+Y to launch yazi (our y() function)
function _yazi_widget {
  y

  # Force prompt refresh for themes that compute prompt in precmd (eg p10k)
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done

  # Ensure vi NORMAL mode after returning from yazi
  zle -K vicmd

  zle reset-prompt
}
zle -N _yazi_widget
bindkey -M viins '^Y' _yazi_widget
bindkey -M vicmd '^Y' _yazi_widget
