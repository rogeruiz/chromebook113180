{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = (builtins.readFile ./lua/lsp-complete.lua);
  };
}

