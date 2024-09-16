{
  description = "Infra Lab";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nmattia/naersk";
  };



  outputs = { self, nixpkgs, utils, naersk }:
    utils.lib.eachDefaultSystem (system:
      let
        # Hashicorp uses a BSL licenses so we need config.allowUnfree = true
        pkgs = import nixpkgs { system = "${system}"; config.allowUnfree = true; };
        naersk-lib = naersk.lib."${system}";


      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # General
            just

            # Infrastructure
            tfswitch
            packer
            pulumi-bin

            # Nix
            nixpkgs-fmt
          ];

        };
      });
      
}
