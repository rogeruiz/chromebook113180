{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = (builtins.readFile ./lua/lsp-highlights.lua);
  };
}

