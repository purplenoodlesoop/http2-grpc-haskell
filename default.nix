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
  genName = "package.gen.nix";
in
{
  flake.overlays.default = import ./overlay.nix {
    inherit
      lib
      genName
      packages
      ;
  };

  tasks.gen-packages = lib.map (name: "${lib.genExe pkgs.cabal2nix} ./${name} > ${genName}") packages;
}
