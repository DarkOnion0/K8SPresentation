{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11"; # We want to use packages from the binary cache

    flake-utils.url = "github:numtide/flake-utils";

    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    devenv,
    ...
  }:
    flake-utils.lib.eachSystem [flake-utils.lib.system.x86_64-linux flake-utils.lib.system.aarch64-linux flake-utils.lib.system.i686-linux] (system: let
      inherit (builtins) substring;

      # to work with older version of flakes
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      devShell = devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = [
          {
            # Apps
            difftastic.enable = true;
            starship.enable = true;
            
            # Packages
            packages = with pkgs; [
              git
              alejandra
            ];

            scripts = {
              run-dev.exec = "cargo run -- ";
              run-prod.exec = "nix run .# -- ";
            };

            pre-commit.hooks = {
              # Nix
              alejandra.enable = true;

              # Markdown...
              prettier.enable = true;
            };
          }
        ];
      };
    });
}
