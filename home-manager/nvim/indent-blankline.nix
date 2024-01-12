{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/indent_blankline.lua);
  };
}
