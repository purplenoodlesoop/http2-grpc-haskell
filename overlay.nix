{ lib }:
self: super:
let
  data = import ./data.nix { inherit lib; };
in
{
  haskellPackages = super.haskellPackages.override {
    overrides = hSelf: hSuper: with data; foldl (name: hSelf.callPackage ./${name}/${genName} { });
  };
}
