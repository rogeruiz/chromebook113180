{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/gitsigns.lua);
  };
}
