{ pkgs, ... }:

{
  programs.neovim = {
    packages = with pkgs.vimPlugins; [
      none-ls-nvim
      nvim-lspconfig
    ];
    extraLuaConfig = (builtins.readFile ./lua/none-ls.lua);
  };
}
