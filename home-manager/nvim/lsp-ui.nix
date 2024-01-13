{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = (builtins.readFile ./lua/lsp-ui.lua);
  };
}
