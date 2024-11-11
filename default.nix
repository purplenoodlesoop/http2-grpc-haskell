{
  pkgs,
  lib,
  ...
}:
let
  data = import ./data.nix { inherit lib; };
in
{
  tasks.gen-packages =
    with data;
    lib.map (name: "${lib.getExe pkgs.cabal2nix} ./${name} > ${genName}") packages;

  flake.packages = data.foldl (name: pkgs.haskellPackages.${name});
}
