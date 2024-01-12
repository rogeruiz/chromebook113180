{ pkgs, lib, ... }:

let
  fromGitHub = import ../functions/fromGitHub.nix;
in

{
  # La orden aqui es importante, el ultimo archivo se pone al principio de el
  # archivo de `~/.config/nvim/init.lua`.
  imports = [
    # plugins
    ./alpha.nix
    ./autopairs.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./neo-tree.nix
    ./telekasten.nix
    ./telescope.nix
    ./todo-comments.nix
    ./toggleterm.nix
    ./which-key.nix

    ./language-server.nix

    ./colorscheme.nix

    # tiene que estar al final pa que se imprime al principio
    ./base.nix
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      (
        nvim-treesitter.withPlugins (
          p: [
            p.c
            p.cpp
            p.go
            p.lua
            p.markdown
            p.markdown_inline
            p.python
            p.query
            p.rust
            p.tsx
            p.typescript
            p.vim
            p.vimdoc
          ]
        )
      )
      plenary-nvim

      vim-fugitive
      vim-sleuth

      popup-nvim
      vim-dadbod
      vim-dadbod-ui
      vim-dadbod-completion

      editorconfig-nvim
      vim-illuminate

      {
        plugin = neodev-nvim;
        config = "lua require('neodev').setup()";
      }
    ];
  };
}
