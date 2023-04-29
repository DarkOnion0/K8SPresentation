---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Server]], [[Kubernetes]], [[K8SPresentation]]

%%
[Overview | Kubernetes](https://kubernetes.io/docs/concepts/overview/)
[Qu'est-ce que Kubernetes ?  |  Google Cloud  |  Google Cloud](https://cloud.google.com/learn/what-is-kubernetes?hl=fr)
[Kubernetes: Up and Running, 3rd Edition [Book]](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
%%

---

![](https://d33wubrfki0l68.cloudfront.net/26a177ede4d7b032362289c6fccd448fc4a91174/eb693/images/docs/container_evolution.svg)

# Container

> [!warning]  
> docker $!=$ container  
> => conteneur est un moyens de faire tourner des conteneurs, **MAIS** ce n'est pas le seul moyens

> [!summary]  
> C'est un moyens d'avoir des applications prêtes à tourner en quelque ligne de commande (une sorte de flatpak pour serveur)  
> => ce sont les développeurs qui dev & package les applications COMME ELLES DOIVENT ÊTRE !
>
> > [!tip]  
> > Pour plus d'information vous pouvez aller ecouter ce podcast en anglais -> [LINUX Unplugged 502: Docker Shocker](https://linuxunplugged.com/502)

En bref un gestionnaire d'application dynamique et portable s'intégrant aussi un peu avec le système

| ➕                                                                                         | ➖                                                                                                                                                               |
| ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| - Léger <br>- Facilement déployable/transférable <br>- Limitation des ressources possibles | - Partage du noyau kernel -> PBs de sec éventuels <br>- Tout nouveau fonctionnement <br>- Pas propice à toutes les applications <br>- Peut de scalabilité en soi |

# K8S

En bref c'est une OS 2.0 pensé pour la gestion d'applicatifs cotés serveurs => docker au stéroides

| ➕                                                                                                                                                                                                                                                                             | ➖                                                                                                                              |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| - Lourd / Moyenne consommation (voir léger avec K3S) <br>- Facilement déployable/transférable <br>- Limitation des ressources possibles <br>- Scalabilité très forte <br>- Environnement d'application standardisé / Monitoring++<br>- **Enorme** ecosystème -> sa vraie force | - Partage du noyau kernel -> PBs de sec eventuels <br>- Tout nouveau fonctionnement <br>- Pas propice à toutes les applications |

---

Mon choix perso est plus _spéciale_

1. kubernetes est **amusant** -> tirer profit à fonds des conteneurs  
   => m'a permit de ne pas abandonner l'auto-herbergement
2. rends les déploiments un peu comme de la programmation => agréable, car standardisée
3. permet de simplement tiré profit de la puissance de plusieurs machines
4. permet aussi quand il est bien huilé de **NE PAS PERDRE DE TEMPS ! 🥳**

# VM

Permet de faire des OSs dans des OSs

| ➕                                                                                                                                       | ➖                                      |
| ---------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- |
| - Limitation des ressources possibles <br>- Compatible avec tous les types d'applications quasiment <br>- Isolation totale des processus | - Lourd <br>- Peu de scalabilité en soi |

# Baremetal $==$ Moyen Traditionnel De Déploiement

Un OS **.**

| ➕                                                     | ➖                                                                                                                                                        |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| - Très Léger <br>- Forme traditionnelle bien maitrisée | - Aucune isolation -> PBs de sec éventuels <br>- Pas de scaling <br>- Pas de limite de ressources <br>- Déploiement parfois compliqué et peu transférable |
