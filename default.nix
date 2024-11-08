{
  pkgs,
  lib,
  ...
}:
let
  packages = [
    "warp-grpc"
    "http2-grpc-types"
    "http2-grpc-proto3-wire"
    "http2-grpc-proto-lens"
    "http2-client-grpc"
  ];
  mapPackages = lib.flip lib.map packages;
  genName = "package.gen.nix";
in
{
  flake = {
    shell = with pkgs; [
      cabal2nix
    ];

    packages = lib.foldl' (
      packages: name:
      packages
      // {
        ${name} = pkgs.haskellPackages.callPackage ./${name}/${genName} { };
      }
    ) { } packages;
  };

  tasks.gen-packages = mapPackages (name: "cabal2nix ./${name} > ${genName}");

}
