{ config, ... }:

let
  local = import ../../local.nix;
  # Keep one canonical fd expression for shell and fzf integration.
  fdFindCmd = "fd --type f --hidden --follow --exclude .git";
in
{
  home.username = local.username;
  home.homeDirectory = local.homeDirectory;

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  xdg.enable = true;

  home.sessionVariables = {
    # XDG base dirs
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";

    # Pager defaults
    LESS = "-R";
    PAGER = "less";

    # fzf defaults (so they apply everywhere)
    FZF_DEFAULT_COMMAND = fdFindCmd;
    FZF_CTRL_T_COMMAND = fdFindCmd;
  };

  # PATH additions (instead of export PATH=...)
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
