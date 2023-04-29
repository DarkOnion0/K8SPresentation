**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

> [!note]
> Aussi disponible via Github Gist [K8SPresentation Install Manual.md · GitHub](https://gist.github.com/DarkOnion0/de1a65423586e15380f9c8499eaed302)

# Installer Nix

1. Installez nix -> `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
2. Suivre les instructions dans le terminale 😉

# Récupérer Le Dépôt

> [!note]  
> Le dépôt GIT n'est toujours pas disponible au public sur GitHub, si vous voulez y avoir accès avant la présentation, faites moi un mail avec votre identifiant GitHub SVP

1. Aller dans le dossier de votre choix
2. Exécutez la commande suivante : `nix flake clone github:DarkOnion0/K8SPresentation --dest K8SPresentation` -> Cella permet de récupérer les éléments nécessaire pour la présentation
3. Aller dans le dossier `K8SPresentation`

# Télécharger Les Dépendances

## VM

La présentation se base entièrement sur des machines virtuelles, il est donc impératif d'installer et de configurer votre ordinateur pour supporter **libvirtd / qemu**. Vous pouvez trouver les liens vers le wiki de votre distribution dans le tableau suivant.

| OS        | Wiki                                                                                                                                                                |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ubuntu    | [libvirt](https://guide.ubuntu-fr.org/server/libvirt.html#libvirt-installation)                                                                                     |
| Fedora    | [Virtualisation : KVM, Qemu, libvirt en images — Wiki Fedora-Fr](https://doc.fedora-fr.org/wiki/Virtualisation_:_KVM,_Qemu,_libvirt_en_images#En_ligne_de_commande) |
| ArchLinux | [libvirt - ArchWiki](https://wiki.archlinux.org/title/libvirt#Installation)                                                                                         |

## Nix

> [!warning]  
> Il y a un nombre relativement important de choses à télécharger, je vous invite donc à effectuer ces commandes avant d'aller à la présentation pour éviter de perdre du temps à les re-télécharger une fois là-bas.

1. Exécutez la commande suivante pour télécharger les dépendances : `nix develop .#vm`
2. Aller dans le dossier VM
3. Executez la commande `vagrant up`
4. Quand la commande précédante est terminée, vous pouvez éxecuter la commande suivante qui eteindra les machines virtuelles, `vagrant halt`
5. **Venez à la présentation 🥳**

%%

# Kubectl Tweaking

Pour le bon déroulement de la présentation, il est fortement recommandé d'installer la complétion des commandes de kubectl rendant le contrôle de k8s par le cli beaucoup plus agréable et surtout accessible. Pour ceux sur **bash** ou **zsh**, [allez sur le site de Kubernetes](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-autocomplete) et suivez leur tutoriel
%%
