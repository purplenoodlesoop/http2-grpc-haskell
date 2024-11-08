{
  pkgs,
  lib,
  ...
}:
let
  inherit (import ./data.nix) packages genName;
in
{
  flake = {
    shell = with pkgs; [
      cabal2nix
    ];
    packages = lib.foldl' (acc: el: acc // { ${el} = pkgs.haskellPackages.${el}; }) { } packages;
  };

  tasks.gen-packages = lib.map (name: "cabal2nix ./${name} > ${genName}") packages;
}
