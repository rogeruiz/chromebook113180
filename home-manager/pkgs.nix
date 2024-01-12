{ pkgs, ... }:
{
  # La opcion de `home.packages` se usa pa' instalar Nix pkgs en mi
  # medioambiente
  home.packages = with pkgs; [
    eza
    ripgrep
    uutils-coreutils-noprefix
    jq
    # diffr

    lua-language-server
  ];
}
