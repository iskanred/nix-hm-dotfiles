{ config, ... }:

{
  xdg.configFile."zsh/init.zsh".source = ../../files/zsh/init.zsh;
  xdg.configFile."zsh/environment.zsh".source = ../../files/zsh/environment.zsh;
  xdg.configFile."zsh/functions.zsh".source = ../../files/zsh/functions.zsh;
  xdg.configFile."zsh/interactive.zsh".source = ../../files/zsh/interactive.zsh;

  xdg.configFile."nvim" = {
    source = ../../files/nvim;
    force = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ../../files/yazi/yazi.toml;
  xdg.configFile."kitty/kitty.conf".source = ../../files/kitty/kitty.conf;
  xdg.configFile."kitty/themes" = {
    source = ../../files/kitty/themes;
    force = true;
  };
  xdg.configFile."kitty/theme.conf" = {
    text = "include themes/${config.home.sessionVariables.KITTY_THEME}.conf\n";
    force = true;
  };

  home.file.".p10k.zsh".source = ../../files/zsh/.p10k.zsh;
}
