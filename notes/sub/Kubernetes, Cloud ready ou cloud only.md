---
share: true
---

**Types**:: #🌲, #👶  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Cloud computing — Wikipédia](https://fr.wikipedia.org/wiki/Cloud_computing)
[Comprendre ce qu'est une application cloud-native](https://www.redhat.com/fr/topics/cloud-native-apps) -> pas utiliser, mais utile
[Kubernetes: Up and Running, 3rd Edition [Book]](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
%%

> [!note]  
> Voir si les gens font bien le lien entre le titre et le paradygme de K8S

Comme vu précédemment Kubernetes a été principalement développé par Google dans [[L'histoire et les origines de kubernetes|le point historique]] avec une volonté de standardisation de l'infrastructure. Cette simplicité à l'utilisation a forcément un cout à un moment, comme le dit Lavoisier « _Rien ne se pert, rien ne se créer tout se  
transforme_ », ainsi on retrouve une complexité relativement forte à l'installation et à la maintenance.

Cette complexité n'est souvent pas prise en compte dans les différents tutoriels / présentation, car Kubernetes, au-delà d'apporter un tout nouveau type de déploiement au monde du serveur, apporte un véritable paradigme centré sur l'utilisation du cloud, le _cloud native_.

Le _cloud native_ est la pratique consistant à utiliser des serveurs informatiques à distance et hébergés sur internet pour stocker, gérer et traiter des données, plutôt qu'un serveur local.  
Ce cloud s'organise quasiment exclusivement autour des GAFAM avec AWS pour Amazon ou encore GCP pour Google pour ne citer que ces grands noms.  
Ce paradigme nous confronte alors à un problème de taille que ce soit sur le plan financier, sur la consommation très forte de ressources matérielles ou tout simplement sur le point de vue éthique dans le cadre de notre association.

Heureusement pour nous depuis maintenant 5 ans des variantes de Kubernetes, un peu à l'image des myriades de dérivées d'Ubuntu, apparaissent et simplifient ce processus pour permettre aux communs des mortels d'héberger et d'installer Kubernetes sans avoir des data-centers entiers et des dizaines de staffs pour le gérer.  
Ainsi même si le Kubernetes est pensé comme _cloud ready_, celui-ci n'est pourtant pas que _cloud only_, comme on le verra avec la distribution Kubernetes que nous utiliserons tout au long de la présentation.
