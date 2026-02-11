{ pkgs, ... }:

let
  lib = pkgs.lib;
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;

  commonPackages = with pkgs; [
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
    eza
    duf
    dust
    tldr
    direnv
    kitty

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
    virt-viewer

    # Binary manipulations
    binwalk

    # Processes
    htop
    btop
    ripgrep
    pstree

    # AI agents
    codex

    # JS
    nodejs_22

    # Java
    jdk21
    jdt-language-server
  ];

  fontsPackages = with pkgs; [
    nerd-fonts.fira-code
  ];

  linuxPackages = with pkgs; [
    iproute2
  ];

  darwinPackages = with pkgs; [
    iproute2mac
  ];
in
{
  # lib.optionals keeps one package list portable across Darwin and Linux.
  home.packages =
    commonPackages
    ++ fontsPackages
    ++ lib.optionals isLinux linuxPackages
    ++ lib.optionals isDarwin darwinPackages;
}
