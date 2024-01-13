{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      fidget-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/fidget.lua);
  };
}
