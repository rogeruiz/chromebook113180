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

    just

    python3

    gh

    blahaj

    bat
    du-dust
    fd
    procs
    sd
    tealdeer
    # zoxide

    httpie
    htop

    entr

    rofi

    universal-ctags

    tree-sitter
    lua-language-server
    nixd
    yaml-language-server
    typescript
    nodePackages.typescript-language-server
    python311Packages.python-lsp-server
    marksman
    go
    shellcheck

    irssi
    exercism
  ];
}
