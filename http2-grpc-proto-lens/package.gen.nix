{ mkDerivation, base, binary, bytestring, case-insensitive
, http2-grpc-types, lib, proto-lens, zlib
}:
mkDerivation {
  pname = "http2-grpc-proto-lens";
  version = "0.1.1.0";
  src = ./.;
  libraryHaskellDepends = [
    base binary bytestring case-insensitive http2-grpc-types proto-lens
    zlib
  ];
  homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell#readme";
  description = "Encoders based on `proto-lens` for gRPC over HTTP2";
  license = lib.licenses.bsd3;
}
