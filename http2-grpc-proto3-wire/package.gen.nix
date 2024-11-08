{ mkDerivation, base, binary, bytestring, case-insensitive
, http2-grpc-types, lib, proto3-wire, zlib
}:
mkDerivation {
  pname = "http2-grpc-proto3-wire";
  version = "0.1.0.1";
  src = ./.;
  libraryHaskellDepends = [
    base binary bytestring case-insensitive http2-grpc-types
    proto3-wire zlib
  ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell#readme";
  description = "Encoders based on `proto3-wire` for gRPC over HTTP2";
  license = lib.licenses.bsd3;
}
