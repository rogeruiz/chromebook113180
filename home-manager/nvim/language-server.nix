{ pkgs, ... }:


{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      lsp-zero-nvim

      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-path
      cmp-snippy
      cmp-spell
      cmp_luasnip
      luasnip
      nvim-cmp
      nvim-snippy
    ];
    extraLuaConfig = (builtins.readFile ./lua/language-server.lua);
  };
}
