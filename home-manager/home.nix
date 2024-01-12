{ config, pkgs, ... }:

{
  imports = [
    # Aqui estan definido mis pkgs para mi usario
    ./pkgs.nix
    # Aqui estan las definaciones de mi configuracion de Neovim.
    ./nvim
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yo";
  home.homeDirectory = "/home/yo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/starship.toml".source = ./config/starship.toml;
    ".config/nvim/lua/icons.lua".source = ./nvim/lua/icons.lua;
    ".config/nvim/lua/figlet_headers.lua".source = ./nvim/lua/figlet_headers.lua;
    ".gitconfig".source = ./config/gitconfig;
    ".gitignore_global".source = ./config/gitignore_global;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      g = "git";
      nv = "nvim";
      ".." = "cd ..";
      "..." = "cd ../..";
      l = "exa -xa";
      ll = "exa -lah --git";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
      # tf = "terraform";

      # Estas alias son para hacer mi vida un poco mas facil
      update = "sudo nixos-rebuild switch --flake ~/Developer/oss/rogeruiz/srht/chromebook113180/#cb113180";
      hupdate = "home-manager switch --flake ~/Developer/oss/rogeruiz/srht/chromebook113180/home-manager#yo";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    initExtraFirst = "eval \"$(starship init zsh)\"";
  };

}
