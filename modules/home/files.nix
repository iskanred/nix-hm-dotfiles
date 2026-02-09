{ ... }:

{
  xdg.configFile."zsh/init.zsh".source = ../../files/zsh/init.zsh;
  xdg.configFile."zsh/environment.zsh".source = ../../files/zsh/environment.zsh;
  xdg.configFile."zsh/functions.zsh".source = ../../files/zsh/functions.zsh;
  xdg.configFile."zsh/interactive.zsh".source = ../../files/zsh/interactive.zsh;

  xdg.configFile."nvim/init.lua".source = ../../files/nvim/init.lua;
  xdg.configFile."yazi/yazi.toml".source = ../../files/yazi/yazi.toml;

  home.file.".p10k.zsh".source = ../../files/zsh/p10k.zsh;

}
