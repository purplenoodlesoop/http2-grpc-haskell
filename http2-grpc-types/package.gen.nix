{ mkDerivation, base, binary, bytestring, case-insensitive, lib
, zlib
}:
mkDerivation {
  pname = "http2-grpc-types";
  version = "0.5.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base binary bytestring case-insensitive zlib
  ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell#readme";
  description = "Types for gRPC over HTTP2 common for client and servers";
  license = lib.licenses.bsd3;
}
