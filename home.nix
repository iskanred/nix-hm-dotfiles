{ config, pkgs, ... }:

let
  local = import ./local.nix;
  lib = pkgs.lib;
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
{
  home.username = local.username;
  home.homeDirectory = local.homeDirectory;

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = 
    (with pkgs; [
      # Common: MacOS + Linux
      # Sanity check
      hello

      # GNU userland (Linux-like)
      coreutils
      findutils
      gnused
      gnugrep
      gawk
      gnutar

      # Modern alternatives
      eza  	  # ls
      duf     # df
      dust    # du
      tldr	  # 
      direnv	#

      # Daily CLI
      git
      tmux
      ncdu
      bat
      fd
      yazi
      jq

      # Network
      inetutils
      net-tools
      nmap

      # Virtualization
      qemu
      ubridge
      vpcs

      # Binary manipulations
      binwalk

      # Processes
      htop
      btop
      ripgrep
      pstree

      # AI agents
      codex

      # Nvim
      neovim-remote
    ])
    ++ lib.optionals isLinux (with pkgs; [
      # Linux-only
      iproute2
    ])
    ++ lib.optionals isDarwin (with pkgs; [
      # macOS-only
      iproute2mac
    ]);

  xdg.enable = true;

  xdg.configFile."zsh/init.zsh".source = ./files/zsh/init.zsh;
  xdg.configFile."zsh/00-options.zsh".source = ./files/zsh/00-options.zsh;
  xdg.configFile."zsh/10-nix-path.zsh".source = ./files/zsh/10-nix-path.zsh;
  xdg.configFile."zsh/20-env.zsh".source = ./files/zsh/20-env.zsh;
  xdg.configFile."zsh/30-keybindings.zsh".source = ./files/zsh/30-keybindings.zsh;
  xdg.configFile."zsh/40-fzf.zsh".source = ./files/zsh/40-fzf.zsh;
  xdg.configFile."zsh/50-guard.zsh".source = ./files/zsh/50-guard.zsh;
  xdg.configFile."zsh/60-yazi.zsh".source = ./files/zsh/60-yazi.zsh;
  xdg.configFile."zsh/70-hm.zsh".source = ./files/zsh/70-hm.zsh;

  xdg.configFile."nvim/init.lua".source = ./files/nvim/init.lua;
  xdg.configFile."yazi/yazi.toml".source = ./files/yazi/yazi.toml;

  home.file.".p10k.zsh" = {
    source = ./files/zsh/p10k.zsh;
  };

  home.file.".local/bin/v" = {
    executable = true;
    source = ./files/nvim/nvr.sh;
  };

  home.sessionVariables = {
    # XDG base dirs
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_CACHE_HOME  = "${config.home.homeDirectory}/.cache";
    XDG_DATA_HOME   = "${config.home.homeDirectory}/.local/share";

    # Pager defaults
    LESS  = "-R";
    PAGER = "less";

    # fzf defaults (so they apply everywhere)
    FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git";
    FZF_CTRL_T_COMMAND  = "fd --type f --hidden --follow --exclude .git";
  };

  # PATH additions (instead of export PATH=...)
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

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
      ls = "eza";
      ll = "eza -la";

      cat = "bat";
      top = "htop";

      clr = "clear";
      find = "fd";
      hm = "home-manager";
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
  };

  programs.fzf = {
    enable = true;
  };
}
