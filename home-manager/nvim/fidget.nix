{ pkgs, ... }:

{
  programs.neovim = {
    packages = with pkgs.vimPlugins; [
      fidget-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/fidget.lua);
  };
}
