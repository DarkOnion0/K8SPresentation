**Types**:: #🏷️  
**Links**:: [[Server]], [[Server/Kubernetes]]

---

[Présentation de Kubernetes, pour orchestrer ses conteneurs comme un chef ! - Root66](https://root66.net/?post/2023/04/22/Pr%C3%A9sentation-de-Kubernetes)

# Résumé

Présentation de Kubernetes, avantages, inconvénients. Introduction à l'utilisation de Kubernetes pour l'auto-hébergement à direction de bidouilleurs et curieux déjà familiarisés avec cette notion. Manipulation autour des concepts étudiés.

# Plan

1. Intro générique
   1. Présentation personnelle
   2. Plan
2. Intro K8S
   1. Comparaisons avec les systèmes existants
      1. [[Les différents types de déploiment d'applications possibles]] ✅
      2. [[Les différents types de scalabilités dans la tech|Les différents types de scalabilités]] ✅
   2. [[L'histoire et les origines de kubernetes|Le petit point histoire]] ✅
   3. [[Kubernetes, Cloud ready ou cloud only|Kubernetes, Cloud ready ou cloud only ?]] ✅
   4. [[Kubernetes X YAML]] ✅
3. Installation
   1. [[L'architecture de déploiement de k8s]] ✅
   2. [[L'aspect modulaire]] ✅
   3. [[Les distribs]] ✅
   4. [[Installation de K3S sur RokyLinux 9|Démonstration]] ✅
4. Les idiomes de K8S -> pratique pour chaque concept
   1. [[Kubectl|Les bases des intéractions avec le cluster]] ✅ -> faire maintenant, car utile dans tout le reste des manips
   2. [[Nodes]] ✅
   3. [[La structure des ressources déployables]] ✅
   4. [[Pods]] ✅
   5. Storage
      1. [[Les volumes dans docker et kubernetes en général]] ✅ -> prérequis pour comprendre la suite
      2. [[Storage]] ✅ -> le nerf de la guerre
   6. [[Deployments]] ✅ -> exemple $==$ kuard
   7. [[Services]] ✅ -> exemple $==$ kuard
   8. [[IngressRoute]] 🧪 -> exemple $==$ kuard
   9. ~~[[DaemonSets]] ❌ -> exemple $==$ pihole (reprends tous les concepts de `4.6` à `4.8`) => utile ?~~
   10. [[Secrets & ENV Vars]] ✅ -> exemple $==$ kuard
   11. [[Configmaps]] ✅ -> exemple $==$ kuard
5. Conclusion
   1. Liens utiles / Un aperçus de l'écosystème
      1. [[K8S Cluster Compononents|Applications « système »]] ❌ -> parler de CNCF, \#[Cloud Native Landscape](https://landscape.cncf.io/?license=open-source)
      2. [[Deployment Apps|Applications plus génériques de déploiment]] ❌
      3. [[K8S Admin Apps|Applications de gestion/administration de cluster]] ❌
   2. [[K8S Usefull Links|Ressources pour continuer]] 👷
   3. **VRAIE** message de fin

# Links

```dataview
LIST
WHERE contains(Tags, [[Kubernetes]]) and contains(Tags, [[K8SPresentation1]])
```
