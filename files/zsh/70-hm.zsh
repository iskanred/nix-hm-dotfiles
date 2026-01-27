# home-manager: Ctrl+U runs switch and refreshes prompt

function _hm_switch_widget {
  # optional: show message area cleanly
  zle -I

  # run switch
  home-manager switch

  # reload shell so new config is actually used
  exec zsh
}

zle -N _hm_switch_widget

# bind in both vi keymaps
bindkey -M viins '^U' _hm_switch_widget
bindkey -M vicmd '^U' _hm_switch_widget
