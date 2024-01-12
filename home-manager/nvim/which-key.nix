{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      which-key-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/which-key.lua);
  };
}
