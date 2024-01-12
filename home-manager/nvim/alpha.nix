{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      alpha-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/alpha.lua);
  };
}
