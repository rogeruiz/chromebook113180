{ pkgs, ... }:
{
  # La opcion de `home.packages` se usa pa' instalar Nix pkgs en mi
  # medioambiente
  home.packages = with pkgs; [
    lynx
    eza
    ripgrep
    uutils-coreutils-noprefix
    jq

    gh

    blahaj

    bat
    du-dust
    fd
    procs
    sd
    tealdeer
    zoxide

    httpie
    htop

    entr

    universal-ctags

    tree-sitter
    lua-language-server
    shellcheck

    irssi
    exercism
  ];
}
