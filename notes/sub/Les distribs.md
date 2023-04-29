---
share: true
---

**Types**:: #🌲, #⏳  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Installer kubeadm | Kubernetes](https://kubernetes.io/fr/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
%%

Comme dit dans [[L'aspect modulaire]], Kubernetes est en fait un gigantesque Lego. Ainsi même si cela permet une grande flexibilité, cela est plus limitant pour un débutant que ce soit en terme de complexité ou tout simplement de performance. Le vanilla Kubernetes installable avec `kubeadm` est par exemple très lourd avec 2 Go et 2 vCPU ou plus pour **chaque** serveur [[L'architecture de déploiement de k8s|du cluster]]. Ainsi ces prérequis peuvent être un facteur limitant pour l'utilisation sur des machines moins puissantes comme des PI4.

---

> [!todo]  
> détailler un peu plus les distros et pourquoi j'ai choisies certaines et pas d'autres

Arrivent alors les distributions K8S 🥳. En reprenant l'image des LEGOs celles-ci sont en quelque sorte une boite de construction de véhicules au lieu de simples briques. Celles-ci viennent préconfigurer et chacune avec leurs avantages et inconvénients. De ce fait elles sont parfois intégrées dans tout un ecosystème ou encore optimisées pour des appareils peu puissants…

On peut alors citer 3 distributions qui ont retenu mon intérêt

1. [RKE](https://rke.docs.rancher.com/) -> toute prête et sécurisée, mais lourde => ❌
2. [K0S](https://k0sproject.io/) -> légère et sécurisée => ❌
3. [K3S](https://k3s.io/) -> très légère, simple et fortement utilisée => ✅
