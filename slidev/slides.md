---
theme: default
layout: cover
background: https://source.unsplash.com/collection/94734566/1920x1080
highlighter: shiki
lineNumbers: true
info: |
  Source de la présentation -> [Github - K8SPresentation/slidev](https://github.com/DarkOnion0/K8SPresentation/tree/main/slidev)  
  Source des assets utilisées -> [Github - K8SPresentation/vm](https://github.com/DarkOnion0/K8SPresentation/tree/main/vm)

  This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.

fonts:
  serif: "Fira Code"
  sans: "Fira Code"
hideInToc: true
---

# Kubernetes pour orchestrer ses conteneurs comme un chef!

---
layout: presenter
presenterImage: https://avatars.githubusercontent.com/u/68606322?v=4
hideInToc: true
---

# Alexandre PERUGGIA

---
hideInToc: true
---

# Plan

<Toc maxDepth=2 />

---
layout: center
---

# Présentation de Kubernetes

---
layout: center
---

## Comparaison avec les systèmes existants

---
layout: image
image: 
---

### Les différents types de déploiments

![](https://d33wubrfki0l68.cloudfront.net/26a177ede4d7b032362289c6fccd448fc4a91174/eb693/images/docs/container_evolution.svg)

---

### Les différents types de scalabilités

<img style="height: 75%;" class="m-auto" src="https://imgs.search.brave.com/SiImnaPOmV8jqu2fwHtTOyN-XpOY9uWr1a071YZuOis/rs:fit:900:712:1/g:ce/aHR0cHM6Ly9iaXRw/YW5kYS1hY2FkZW15/LmltZ2l4Lm5ldC9u/dWxsZDRjYjJmNzEt/OTUzYi00MzA4LThl/ZGMtNjM0MDhiYzM1/YTFiL2JpdHBhbmRh/LWFjYWRlbXktaW50/ZXJtZWRpYXRlLTE1/LXNjYWxpbmctaW5m/b2dyYXBoaWMucG5n/P2F1dG89Y29tcHJl/c3MlMkNmb3JtYXQm/Zml0PW1pbiZmbT1q/cGcmcT04MCZ3PTkw/MA" />

---

## Le petit point histoire

<img style="height: 75%;" class="m-auto" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/1200px-Kubernetes_logo_without_workmark.svg.png" alt="Kubernetes logo without workmark.svg">

---

## Kubernetes, Cloud Ready ou cloud only

- Compléxité à la maintenance
- Nouveau paradigme -> *cloud native*
- Couteux ! 💸
- Distribution alternative de Kubernetes

---
layout: center
---

# Installation de Kubernetes

---
layout: center
---

## L'architecture de déploiment de K8S

---

### Serveur

<img style="height: 75%;" class="m-auto" src="https://d33wubrfki0l68.cloudfront.net/283cc20bb49089cb2ca54d51b4ac27720c1a7902/34424/docs/tutorials/kubernetes-basics/public/images/module_01_cluster.svg" />

---

### Organisation interne (namespace)

<v-clicks>

<img style="height: 55%;" class="m-auto" src="/namespace.svg" />

``` bash
kubectl --namespace $NAME [...] # Version longue + reste de la commande
kubectl -n $NAME [...] # Version courte + reste de la commande
```

```bash
$HOME/.kube/config
```

</v-clicks>

---

### Architecture - Minimal


<img style="height: 75%;" class="m-auto" src="/setup_mini.svg" />

---

### Architecture - Minimal++

<img style="height: 75%;" class="m-auto" src="/setup_mini_extra.svg" />

---

### Architecture - Recommendé (perso)

<img style="height: 75%;" class="m-auto" src="/setup_recommende.svg" />

---

### Architecture - HA

<img style="height: 75%;" class="m-auto" src="/setup_ha.svg" />

---

## Kubernetes ❤️ YAML

```yaml {all|1|2|3-8|4|5-8|6|7|8|10|12-17}
foo: hello world # Une clé d'un dictionnaire en chaine de caractère
bar: 123456789 # Une clé d'un dictionnaire en nombre
baz: # Une clé d'un dictionnaire contenant elle aussi un dictionnaire
  foo: 💙 nixos # Une clé d'un dictionnaire en chaine de caractère
  bar: # Une clé d'un dictionnaire contenant une liste
    - foo # Un élément de liste sous la forme d'une chaine de caractère
    - 123 # Un élément de liste sous la forme d'un nombre
    - baz: test # Un élément de liste représentant un dictionnaire, avec 1 clé et sa valeur sous la forme d'une chaine de caractère

--- # Sépare 2 documents YAML, ca reviendrait à créer 2 fichiers séparée et à importer les 2. C'est très pratique pour regroupper plusieurs configs dans le meme fichier

data: | # Permet d'écrire du texte sur plusiers ligne, c'est pratique pour configurer des fichiers dans les ConfigMaps
   There once was a tall man from Ealing
   Who got on a bus to Darjeeling
       It said on the door
       "Please don't sit on the floor"
   So he carefully sat on the ceiling
```

---
layout: center
---

# Les concepts de Kubernetes

---
layout: center
---

# Les mots de la fin

