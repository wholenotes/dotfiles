{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  nixDotfiles = "${homeDir}/.dotfiles/nix";

  wnVim = callPackage "${nixDotfiles}/wholenotes-vim.nix" { inherit pkgs; };
  wnDevenv = callPackage "${nixDotfiles}/wholenotes-devenv.nix" { wholenotesVim=wnVim; inherit pkgs; };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    wholenotesDevenv = wnDevenv;
  };
}

