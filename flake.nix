{
  description = "Infra Lab";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nmattia/naersk";
  };

  outputs = { self, nixpkgs, utils, naersk }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        naersk-lib = naersk.lib."${system}";
      in

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # General
            just

            # Infrastructure
            tfswitch
            packer

            # Nix
            nixpkgs-fmt
          ];

        };
      
}
