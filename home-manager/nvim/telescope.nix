{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/telescope.lua);
  };
}
