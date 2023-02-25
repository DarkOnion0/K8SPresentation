{pkgs, ...}: {
  packages = with pkgs; [
    nodePackages.pnpm
  ];

  languages.javascript.package = true;

  pre-commit.hooks = {
    # Markdown...
    prettier.enable = true;
  };
}
