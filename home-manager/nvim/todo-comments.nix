{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      todo-comments-nvim
    ];
    extraLuaConfig = (builtins.readFile ./lua/todo-comments.lua);
  };
}
