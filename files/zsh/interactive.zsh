# Keymaps
bindkey -v
export KEYTIMEOUT=1

function zle-line-init {
  zle -K vicmd
}
zle -N zle-line-init

# Ctrl+Y widget for yazi and prompt refresh
function _yazi_widget {
  y

  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done

  zle -K vicmd
  zle reset-prompt
}

zle -N _yazi_widget
bindkey -M viins '^Y' _yazi_widget
bindkey -M vicmd '^Y' _yazi_widget
