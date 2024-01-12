{ pkgs, ... }:

{
  programs.neovim = {
    extraLuaConfig = (builtins.readFile ./lua/base.lua);
  };
}
