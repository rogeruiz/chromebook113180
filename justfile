# vim: set ft=make :

all: build-nix build-hm

build-nix:
  sudo nixos-rebuild switch --flake .#cb113180

build-hm:
  home-manager --impure switch --flake ./home-manager#yo
