{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = (builtins.readFile ./lua/lsp-fmt.lua);
  };
}
