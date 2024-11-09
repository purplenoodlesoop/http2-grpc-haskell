{ lib }:
rec {
  packages = [
    "warp-grpc"
    "http2-grpc-types"
    "http2-grpc-proto3-wire"
    "http2-grpc-proto-lens"
    "http2-client-grpc"
  ];
  genName = "package.gen.nix";
  foldl = f: lib.foldl' (packages: name: packages // { ${name} = f name; }) { } packages;
}
