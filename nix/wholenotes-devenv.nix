{ pkgs
, wholenotesVim }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {

  name = "wholenotes-devenv";
  paths = with pkgs; [
    bash
    bashCompletion
    bashInteractive

    wget
    curl
    unzip
    zip
    ack

    wholenotesVim

    nix-repl
    nix-prefetch-scripts

    gitAndTools.gitFull
    gitAndTools.tig
  ];
}

