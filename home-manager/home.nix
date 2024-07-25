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
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    DISABLE_AUTO_TITLE = "true";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      g = "git";
      nv = "nvim";
      nvd = "nvim -d";
      "-- -" = "cd -";
      ".." = "cd ..";
      "..." = "cd ../..";
      l = "exa -xa";
      ll = "exa -lah --git";
      _ = "sudo";
      pls = "sudo";
      please = "sudo";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    initExtraFirst = ''
      eval "$(starship init zsh)"
      eval "$(direnv hook zsh)"
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      fuzzback
      jump
      resurrect
      sensible
      tmux-thumbs
    ];
    mouse = true;
    shell = "/home/yo/.nix-profile/bin/zsh";
    shortcut = "b";
    terminal = "tmux-256color";
    tmuxp.enable = true;
  };

}
