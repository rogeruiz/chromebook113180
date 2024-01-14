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

  home.stateVersion = "23.11";

  home.file = {
    ".config/starship.toml".source = ./config/starship.toml;

    # Copiar unos archivos de Neovim que no se pueden configurar con Nix por
    # ahora.
    ".config/nvim/lua/icons.lua".source = ./nvim/lua/icons.lua;
    ".config/nvim/lua/figlet_headers.lua".source = ./nvim/lua/figlet_headers.lua;
    ".config/nvim/ftplugin/lua.lua".source = ./nvim/lua/ftplugin/lua.lua;
    ".config/nvim/.stylua.toml".source = ./nvim/lua/.stylua.toml;
    # ".config/nvim/spell" = {
    #   recursive = true;
    #   source = ./nvim/spell;
    # };

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
      update = "sudo nixos-rebuild switch --flake ~/Developer/oss/rogeruiz/github/chromebook113180/#cb113180";
      hupdate = "home-manager --impure switch --flake ~/Developer/oss/rogeruiz/github/chromebook113180/home-manager#yo";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    initExtraFirst = "eval \"$(starship init zsh)\"";
  };

}
