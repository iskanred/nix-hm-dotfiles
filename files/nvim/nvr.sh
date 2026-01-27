  #!/usr/bin/env bash
  set -euo pipefail

  addr="${NVIM_LISTEN_ADDRESS:-$HOME/.local/state/nvim/server.sock}"
  mkdir -p "$(dirname "$addr")"

  if [[ -S "$addr" ]]; then
    exec nvr --servername "$addr" --remote-silent "$@"
  else
    exec nvim --listen "$addr" "$@"
  fi
