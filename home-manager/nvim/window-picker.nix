{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-window-picker
    ];
    extraLuaConfig = (builtins.readFile ./lua/window_picker.lua)
  };
}
