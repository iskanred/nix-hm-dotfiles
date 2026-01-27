# fzf defaults
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# open file in nvim via fd+fzf, do nothing on ESC
function vf() {
  local file
  file="$(fd --type f --hidden --follow --exclude .git . | fzf --exit-0)"
  [[ -n "$file" ]] || return 0
  nvim "$file"
}
