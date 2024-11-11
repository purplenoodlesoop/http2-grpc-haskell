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
      overlay = import ./overlay.nix {
        inherit (nixpkgs) lib;
      };
    in
    core-flake.lib.evalFlake {
      overlays = [ overlay ];
      perSystem.imports = [
        core-flake.nixosModules.tasks
        ./.
      ];
      topLevel.overlays.default = overlay;
    };
}
