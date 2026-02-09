# Environment and shell behavior defaults
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Nix profile environment (ensure nix + profile bins are on PATH)
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
fi

# Prompt config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
