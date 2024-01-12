{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      telekasten-nvim
      telescope-nvim
      calendar-vim
    ];
    extraLuaConfig = (builtins.readFile ./lua/telekasten.lua);
  };
}
