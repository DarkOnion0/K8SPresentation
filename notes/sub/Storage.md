**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Volumes | Kubernetes](https://kubernetes.io/docs/concepts/storage/volumes/#volume-types)
[Storage Classes | Kubernetes](https://kubernetes.io/docs/concepts/storage/storage-classes/)
[kubernetes - What is the difference between persistent volume (PV) and persistent volume claim (PVC) in simple terms? - Stack Overflow](https://stackoverflow.com/questions/48956049/what-is-the-difference-between-persistent-volume-pv-and-persistent-volume-clai)
%%

> [!warning]  
> Je n'expose ici que les concepts généraux, le stockage étant une chose sensible et complexe sous kubernetes. Je vous recommande de chercher les solutions de stockage qui vous conviennent le mieux

# Intro

Comme vu précédemment on peut monter des volumes venant de myriades de sources différentes, le vaste choix est ainsi permis par les Storages Types.
Dans notre cas d'auto-hébergement + baremetal, les seuls providers qui nous intéressent vraiment sont ceux qui ne concernent pas les clouds providers, ce qui nous amène ainsi dans le cœur du sujet. **Les solutions de stockages pour K8S**

# Volume a.k.a Traditional Storage

> _On parle ici juste des `Types of volumes` mis dans la template de pods_

Pratique de prime abord pratique, mais limitée, car très _manuelle_ et force la configuration du stockage dans chaque template -> lié au fonctionnement du pod  
=> pas foule de solutions _pratiques_ non plus

## NFS

> [!info]
>
> - [nfs-server-provisioner 1.3.0 · raphael/raphael](https://artifacthub.io/packages/helm/raphael/nfs-server-provisioner)
> - [Using persistent NFS volumes in ReadWriteMany for k8s](https://www.padok.fr/en/blog/readwritemany-nfs-kubernetes)

On doit avoir un serveur NFS et configurer les volumes à partager en amont  
=> pas automatisé et géré par K8S -> pas pratique

Des solutions existent pour automatiser son déploiement, mais on ne va pas les évoque rdans ce tutoriel pour diverses raisons (support communautaire, tendance à abandonner le NFS dans les divers projets K8S \#[rook](https://github.com/rook/nfs/tree/6bee1a7852318c6b67828ee982604f724b5a7088#nfs))

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: foo
spec:
  containers: ...
  volumes:
    - name: test-volume
      nfs:
        server: my-nfs-server.example.com
        path: /my-nfs-volume
        readOnly: true
```

## HostPath

> [!danger]  
> Les volumes HostPath présentent de nombreux risques pour la sécurité et il est préférable d'éviter leur utilisation dans la mesure du possible. Lorsqu'un volume HostPath doit être utilisé, il doit être limité au fichier ou au répertoire requis et monté en lecture seule.  
> => parfois nécessaire pour certains type d'application

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: bar
spec:
  containers:
    ...
  volumes:
	hostPath:
      path: /data # Le chemin du dossier sur le node
      type: Directory # Type de montage (opt)
```

# PV & PVC a.k.a Cloud Native Storage

Conçut pour s'intégrer dans Kubernetes -> intègre la mécanique de PV et de PVC

> [!todo]
> reprendre la ph

Le PV permet de fournir le stockage à PVC, celui-ci est déjà disponible / configuré manuellement -> permet de découpler les fonctions de stockage du pod. Il contient tous les détails de la backend de stockage

Le PVC fait office de requête de stockage  
=> dit qu'un PV va être créé + dit à Kubernetes quoi créer / à qui l'associer ensuite…

---

Avec cette mécanique, pour fournir un volume de 10go à un pod il faut :

1. créer un PVC + PV **manuellement et correspondant l'un à l'autre**
2. fournir le PVC au [[Pods|Pod]]

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: task-pv-volume
  labels:
    type: local

spec:
  storageClassName: manual # L'identifiant
  capacity:
    storage: 10Gi # Quoi fournir
  accessModes: # La façon de monter le volume => Read Only...
    - ReadWriteOnce
  hostPath: # La config du volume comme au départ
    path: "/mnt/data"
```

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: foobar-storage
spec:
  storageClassName: manual # L'identifiant à utiliser
  accessModes: # La façon de monter le volume => Read Only...
    - ReadWriteOnce
  resources: # Quoi fournir
    requests:
      storage: 2.5Gi
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: foobar
spec:
  replicas: 1
  selector:
    matchLabels:
      app: foobar
  template:
    metadata:
      labels:
        app: foobar
    spec:
      containers:
        - name: foobar
          image: gcr.io/kuar-demo/kuard-amd64:blue
          volumeMounts:
            - name: quz-volume
              mountPath: /etc/baz/
          ...
      volumes:
        - name: quz-volume
          persistentVolumeClaim:
            claimName: foobar-storage
```

## Rook

> [!info]
>
> - [Rook](https://rook.io/)

Une solution qui utilise (principalement) CEPH en arrière-plan  
=> CNCF Graduated ✅

---

> [!warning]  
> Malgré son aspect pratique rook semble cependant subir certains problèmes suivant mes lectures, de plus il semble aussi manquer de snapshot des volumes sans passer par des outils externes \#[[K8S Admin Apps]]

![Rook's Storage Architecture](https://rook.io/docs/rook/v1.11/Getting-Started/ceph-storage/kubernetes.png)

## Longhorn

> [!info]
>
> - [Longhorn](https://longhorn.io/)

> [!warning] Disclaimer  
> Je parle beaucoup de cette solution, car c'est celle que j'ai le plus utilisée

Une applications qui utilise une solution de stockage maison  
=> CNCF Incubating ✅

---

Longhorn possède de nombreux avantages à ne pas utiliser de sous système de stockage comme [[#Rook]] avec [[Ceph]]

1. Stockage persistant hautement disponible pour Kubernetes -> utilise directement le stockage disponible sur les nœuds pour le fournir à Kubernetes, que ce soit un disque, une partition d'un disque… Il se démarque ainsi de [[#Rook]] qui lui doit avoir [des disques vierges](https://rook.io/docs/rook/v1.11/Getting-Started/Prerequisites/prerequisites/#ceph-prerequisites) à cause de [[Ceph]]  
   => pratique++
2. Sauvegardes / snapshot instantanées incrémentielles faciles
3. Disaster recovery intégrée
   > [!warning]  
   > Nécessite un serveur NFS / S3

> [!warning]  
> Prévenir des petits PB perso avec cette solutions

![Longhorn's storage architecture](https://longhorn.io/img/diagrams/architecture/how-longhorn-works.svg)

# Storage Class

Vous devez surement vous demander en quoi les [[#Cloud Native Storage]] sont si cloud native, la réponse est simple. Ceux-ci ne s'utilisent pas comme nous l'avons fait depuis le début avec les [[#Traditional Storage]], ils utilisent le mécanisme des _Storage Classes_.

Les _Storage Classes_ sont un moyen de définir un type de stockage dans un cluster Kubernetes.

Ainsi, elles permettent le _dynamique provisionning_ avec l'aide des PVC. Cela nous permet donc d'éviter de devoir fournir à chaque fois un volume préconfiguré manuellement à notre application et de juste indiquer à Kubernetes que faire, le rêve 🤤

%%  
[D2 Playground](https://play.d2lang.com/?script=3FNNS8UwELzvr5g_oDzbCpJr7yr4eHiNbSiPFxMJrSLS_y6btNHWrR9Xb8nMZpbMzubxKrT-xRFNIVB4I-DB-uaUjkCsVyh2OwJGAlhwRV5lUg-9j-ETnwPxmzPHV7ZBoQvGuAV2Nj-M6DjJP2o3aPs37WDaXykPTtsb18h_21T3QbvO_NhgJNrzzrHn2uLA4TbYvz5NkjneChUR0HC2j86Ei_M4GpWG8pkpNplyk6mWDAG3hzq3SO4msJDAUgKrFRhRSVOSlBQFwbveNyfdmZnhDLKntfVDi2vdH58NFwXdGdznU52qVwZf_iuD88YtPV7CpQxXX-FkNrsXzftoPa_HN-N4DwAA__8%3D&)  
%%

```d2
direction: down

classes: {
  block: {
    width: 200
  }
  line: {
    width: 800
  }
  automated: {
    width: 200
    style: {
      stroke: green
      stroke-width: 2
    }
  }
  manual: {
    width: 200
    style: {
      stroke: red
      stroke-width: 2
    }
  }
  maunalOnce: {
    width: 800
    style: {
      stroke: orange
      stroke-width: 2
    }
  }
}

Traditional Volume Type: {
  grid-rows: 4

  container1.class: block
  container2.class: block
  container3.class: block
  container4.class: block

  PVC1.class: manual
  PVC2.class: manual
  PVC3.class: manual
  PVC4.class: manual

  PV1.class: manual
  PV2.class: manual
  PV3.class: manual
  PV4.class: manual

  Stockage.class: line
}

Cloud Native Storage X Storage Class: {
  grid-rows: 5

  container1.class: block
  container2.class: block
  container3.class: block
  container4.class: block

  PVC1.class: manual
  PVC2.class: manual
  PVC3.class: manual
  PVC4.class: manual

  PV1.class: automated
  PV2.class: automated
  PV3.class: automated
  PV4.class: automated

  StorageClass.class: maunalOnce

  Stockage.class: line
}
```

---

> [!note]  
> Example StorageClass + PVC

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: longhorn-fast-durable # Le nom de la classe
provisioner: driver.longhorn.io
allowVolumeExpansion: true
reclaimPolicy: Retain # La facons de gérer les PVs apprès que les PVC soit delete
parameters:
  numberOfReplicas: "1" # Nombre de réplicas
  staleReplicaTimeout: "2880" # 48 hours in minutes
  fromBackup: ""
  fsType: ext4
  diskSelector: "nvme"
```

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: foobar-storage
spec:
  storageClassName: longhorn-fast-durable # La storage class à utiliser
  accessModes: # La facons de monter le volume => Read Only...
    - ReadWriteOnce
  resources: # Quoi fournir
    requests:
      storage: 2.5Gi
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: foobar
spec:
  replicas: 1
  selector:
    matchLabels:
      app: foobar
  template:
    metadata:
      labels:
        app: foobar
    spec:
      containers:
        - name: foobar
          image: gcr.io/kuar-demo/kuard-amd64:blue
          volumeMounts:
            - name: quz-volume
              mountPath: /etc/baz/
          ...
      volumes:
        - name: quz-volume
          persistentVolumeClaim:
            claimName: foobar-storage
```
