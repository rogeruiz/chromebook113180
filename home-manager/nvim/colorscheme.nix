{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/catppuccin.lua);
  };
}
