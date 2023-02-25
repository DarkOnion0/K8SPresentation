{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs @ {
    flake-parts,
    devenv,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      debug = true;
      systems = ["x86_64-linux" "aarch64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devShells = let
          defaultConfig = {
            enterShell = "fish"; # Change default shell

            packages = with pkgs; [
              # Mandatory tools
              git
              alejandra
              fish
              tmux

              # Base editors
              neovim
              nano
              vim
            ];

            pre-commit.hooks = {
              # Nix
              alejandra.enable = true;

              # Markdown...
              prettier.enable = true;
            };
          };
        in rec {
          default =
            devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [
                defaultConfig
              ];
            }
            // slidev
            // vm
            // code;

          slidev = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              defaultConfig
              (import ./slidev/module.nix)
            ];
          };

          vm = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              defaultConfig
              (import ./vm/module.nix)
            ];
          };

          code = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              defaultConfig
              (import ./code/module.nix)
            ];
          };
        };
      };
    };
}
