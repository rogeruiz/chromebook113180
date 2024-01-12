{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nvim-navic
    ];
    extraLuaConfig = (builtins.readFile ./lua/lualine.lua);
  };
}
