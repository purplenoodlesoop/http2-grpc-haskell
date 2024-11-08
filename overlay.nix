{
  lib,
  genName,
  packages,
}:
self: super: {
  haskellPackages = super.haskellPackages.override {
    overrides =
      hSelf: hSuper:
      lib.foldl' (
        packages: name:
        packages
        // {
          ${name} = hSelf.callPackage ./${name}/${genName} { };
        }
      ) { } packages;
  };
}
