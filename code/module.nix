{pkgs, ...}: {
  packages = with pkgs; [
    podman
    buildah
  ];

  languages.rust.enable = true;

  pre-commit.hooks = {
    clippy.enable = true;
    rustfmt.enable = true;
    cargo-check.enable = true;
  };
}
