{pkgs, ...}: {
  packages = with pkgs; [
    # K8S toolings
    kubectl
    lens
    kubernetes-helm

    # VM
    vagrant
    packer
  ];
}
