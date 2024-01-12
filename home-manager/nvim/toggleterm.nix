{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      toggleterm-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/toggleterm.lua);
  };
}
