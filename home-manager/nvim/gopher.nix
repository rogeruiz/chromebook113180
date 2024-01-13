{ pkgs, ... }:

let
  fromGitHub = import ../functions/fromGitHub.nix;
in

{
  programs.neovim = {
    plugins = [
      (fromGitHub {
        user = "olexsmir";
        repo = "gopher.nvim";
      })
    ];
    extraLuaConfig = (builtins.readFile ./lua/gopher.lua);
  };
}
