{ pkgs, ... }:

let
  fromGitHub = import ../functions/fromGitHub.nix;
in
{
  programs.neovim = {
    plugins = [
      (fromGitHub {
        user = "norcalli";
        repo = "nvim-colorizer.lua";
      })
    ];
    extraLuaConfig = (builtins.readFile ./lua/colorizer.lua);
  };
}

