{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    core-flake = {
      url = "github:purplenoodlesoop/core-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  # 
  outputs =
    {
      core-flake,
      ...
    }:
    with core-flake;
    lib.evalFlake {
      imports = [
        ./.
        nixosModules.tasks
      ];
    };
}
