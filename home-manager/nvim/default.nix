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
    ./colorizer.nix
    ./colorscheme.nix
    ./fidget.nix
    ./gitsigns.nix
    ./gopher.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./neo-tree.nix
    ./none-ls.nix
    ./telekasten.nix
    ./telescope.nix
    ./todo-comments.nix
    ./toggleterm.nix
    ./which-key.nix

    # Este no es un plugin en si pero un archivo de Lua que
    # aggrega LSP y autocompletion y mas.
    #./language-server.nix
    ./lsp-diagnostics.nix
    ./lsp-fmt.nix
    ./lsp-highlights.nix
    ./lsp-keymaps.nix
    ./lsp-ui.nix
    ./lsp-complete.nix

    # tiene que estar al final pa que se imprime al principio
    ./base.nix
  ];
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      (
        nvim-treesitter.withPlugins (
          p: [
            p.go
            p.lua
            p.markdown
            p.markdown_inline
            p.nix
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

      editorconfig-nvim
      vim-illuminate

      neodev-nvim

      (fromGitHub {
        user = "echasnovski";
        repo = "mini.surround";
      })
      (fromGitHub {
        user = "echasnovski";
        repo = "mini.pairs";
      })
      (fromGitHub {
        user = "nvim-focus";
        repo = "focus.nvim";
      })
    ];
  };
}
