# Open file in nvim via fd+fzf, do nothing on ESC
function vf() {
  local file
  file="$(fd --type f --hidden --follow --exclude .git . | fzf --exit-0)"
  [[ -n "$file" ]] || return 0
  nvim "$file"
}

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
