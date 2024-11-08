{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    core-flake = {
      url = "github:purplenoodlesoop/core-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      core-flake,
      ...
    }:
    let
      inherit (import ./data.nix) packages genName;
      overlay = self: super: {
        haskellPackages = super.haskellPackages.override {
          overrides =
            hSelf: hSuper:
            nixpkgs.lib.foldl' (
              packages: name:
              packages
              // {
                ${name} = hSelf.callPackage ./${name}/${genName} { };
              }
            ) { } packages;
        };
      };
    in
    core-flake.lib.evalFlake {
      overlays = [ overlay ];

      module = {
        imports = [
          ./.
          core-flake.nixosModules.tasks
        ];

        flake.overlays.default = overlay;
      };
    };
}
