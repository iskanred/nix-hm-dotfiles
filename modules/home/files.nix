{ ... }:

{
  xdg.configFile."zsh" = {
    source = ../../files/zsh;
    force = true;
  };

  xdg.configFile."nvim" = {
    source = ../../files/nvim;
    force = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ../../files/yazi/yazi.toml;
  xdg.configFile."kitty/kitty.conf".source = ../../files/kitty/kitty.conf;

  home.file.".p10k.zsh".source = ../../files/zsh/.p10k.zsh;
}
