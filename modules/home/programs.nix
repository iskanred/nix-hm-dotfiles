{ config, pkgs, ... }:

let
  # Use path-based flakes so local.nix can stay gitignored and untracked.
  hmFlakeRef = "path:${config.home.homeDirectory}/.config/home-manager#${config.home.username}";
in
{
  programs.zsh = {
    enable = true;

    # Autocompletion
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
        "vi-mode"
      ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    # More Linux-like behavior
    history = {
      size = 100000;
      save = 100000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    # Base aliases
    shellAliases = {
      # eza defaults: icons + grouped directories for a richer ls replacement.
      ls = "eza --icons=always --group-directories-first";
      l = "eza --tree --level=1 --icons=always --group-directories-first";
      la = "eza -a --icons=always --group-directories-first";
      ll = "eza -la --icons=always --group-directories-first --git";
      lt = "eza --tree --level=2 --icons=always";

      cat = "bat";
      top = "htop";

      clr = "clear";
      find = "fd";
      hm = "home-manager --flake '${hmFlakeRef}'";
    };

    initContent = ''
      source "$HOME/.config/zsh/init.zsh"
    '';
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      onedark-nvim
      nvim-cmp
      cmp-nvim-lsp
    ];
  };

  programs.fzf.enable = true;
}
