{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
      nui-nvim
      plenary-nvim
      nvim-web-devicons
    ];
    extraLuaConfig = (builtins.readFile ./lua/neo-tree.lua);
  };
}
