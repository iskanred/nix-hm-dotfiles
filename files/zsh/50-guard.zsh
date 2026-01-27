# --- BSD guard: warn if command goes from /bin or /usr/bin
function bsd_guard() {
  local cmd="$1"
  local p
  p="$(command -v "$cmd" 2>/dev/null || true)"
  if [[ -n "$p" && ( "$p" == /bin/* || "$p" == /usr/bin/* ) ]]; then
    echo "❌ BSD $cmd detected: $p" >&2
    return 1
  fi
  return 0
}

# Guard for commands where difference (BSD vs GNU) matters
function guard() { bsd_guard "$1" || return 1; command "$@"; }

alias sed='guard sed'
alias grep='guard grep'
alias find='guard find'
alias tar='guard tar'
alias ls='guard ls'
