{ user, repo, ref ? "HEAD", buildScript ? ":" }:

let
  pkgs = import <nixpkgs> {};
in

pkgs.vimUtils.buildVimPluginFrom2Nix {
  package_name = "${lib.strings.sanitizeDerivationName repo}";
  version = ref;
  src = builtins.fetchGit {
    url = "https://github.com/${repo}.git";
    ref = ref;
  };
}
