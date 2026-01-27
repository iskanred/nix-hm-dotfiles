# === Vim-like keybindings ===
bindkey -v
export KEYTIMEOUT=1

# Start each prompt in vi NORMAL mode
function zle-line-init {
  zle -K vicmd
}
zle -N zle-line-init
