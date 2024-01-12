{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-autopairs
      nvim-cmp
    ];
    extraLuaConfig = (builtins.readFile ./lua/autopairs.lua);
  };
}

