{ config, local, ... }:

let
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
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";

    # Pager defaults
    LESS = "-R";
    PAGER = "less";

    # fzf defaults (so they apply everywhere)
    FZF_DEFAULT_COMMAND = fdFindCmd;
    FZF_CTRL_T_COMMAND = fdFindCmd;

    # Theme defaults
    NVIM_THEME = "one-dark";
    BAT_THEME = "OneHalfDark";
  };

  # PATH additions (instead of export PATH=...)
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
