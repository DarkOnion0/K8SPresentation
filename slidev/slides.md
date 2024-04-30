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

<Toc maxDepth=1 />

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

<v-clicks>

- Compléxité à la maintenance
- Nouveau paradigme -> *cloud native*
- Couteux ! 💸
- Distributions alternatives de Kubernetes

</v-clicks>

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

## L'aspect modulaire de Kubernetes

<img style="height: 75%;" class="m-auto" src="https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg" />

---
layout: center
---

## Les distributions Kubernetes

---
layout: items
cols: 2
---

### Concepts

::items::

<v-clicks>

  <div>
    <img style="height: 60%;" class="m-auto" src="https://www.lego.com/cdn/cs/set/assets/blt70237dec0eef084a/10696.jpg?format=webply&fit=bounds&quality=75&width=800&height=800&dpr=1%201x,%20https://www.lego.com/cdn/cs/set/assets/blt70237dec0eef084a/10696.jpg?format=webply&fit=bounds&quality=60&width=800&height=800&dpr=2%202x,%20https://www.lego.com/cdn/cs/set/assets/blt70237dec0eef084a/10696.jpg?format=webply&fit=bounds&quality=55&width=800&height=800&dpr=3%203x,%20https://www.lego.com/cdn/cs/set/assets/blt70237dec0eef084a/10696.jpg?format=webply&fit=bounds&quality=70&width=800&height=800&dpr=1.5%201.5x" />
    <p>Kubernetes</p>
  </div>

  <div>
    <img style="height: 50%;" class="m-auto" src="https://www.lego.com/cdn/cs/set/assets/bltec012c948c003fba/10316_alt16.png?format=webply&fit=bounds&quality=75&width=800&height=800&dpr=1 1x, https://www.lego.com/cdn/cs/set/assets/bltec012c948c003fba/10316_alt16.png?format=webply&fit=bounds&quality=60&width=800&height=800&dpr=2 2x, https://www.lego.com/cdn/cs/set/assets/bltec012c948c003fba/10316_alt16.png?format=webply&fit=bounds&quality=55&width=800&height=800&dpr=3 3x, https://www.lego.com/cdn/cs/set/assets/bltec012c948c003fba/10316_alt16.png?format=webply&fit=bounds&quality=70&width=800&height=800&dpr=1.5 1.5x" />
    <p>Les Distributions Kubernetes</p>
  </div>

</v-clicks>

---
layout: items
cols: 3
---

### 3 grandes distributions

::items::

<v-clicks>

<img style="height: 30vh;" class="m-auto" src="https://www.rancher.com/assets/img/brand-guidelines/project-logos/rke/logo-horizontal-rke.svg" />

<img style="height: 15vh;" class="m-auto" src="https://k0sproject.io/images/k0s-logo.svg" />

<img style="height: 30vh;" class="m-auto" src="https://k3s.io/img/k3s-logo-light.svg" />

</v-clicks>

---
layout: center
---

## Démonstration

---

### Prérequis

<v-clicks>

1. Aller dans le dossier que je vous ai fait télécharger
2. Aller dans le répertoire VM
3. Exécuter la commande suivante `vagrant up`
4. Ouvrez 2 fenêtres en parallèle pour se connecter au 2 serveurs en direct
	1. `vagrant ssh kubemaster` -> master node
	2. `vagrant ssh kubeworker` -> worker node

</v-clicks>

---

### Installation


<v-clicks>

<div>

#### Master

```bash
# Install K3S with unsafe settings but that are easier to use
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" K3S_TOKEN=123456 sh -s -
```

</div>

<div>

#### Worker

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL=https://192.168.244.2:6443 K3S_TOKEN=123456 sh -s -
```

</div>

<div>

#### Récupérer les accès

```bash
sudo cat /etc/rancher/k3s/k3s.yaml
```

</div>

`127.0.0.1` -> `192.168.244.2`

<div>

#### Check Finale

```bash
kubectl get nodes
```

</div>

**🎉 Vous venez d'avoir votre 1re interaction avec le cluster 🎉**

</v-clicks>

---
layout: center
---

# Les concepts de Kubernetes

---
layout: center
---

## Kubectl

---

### Read

<v-clicks>

```bash
# Affiche les éléments dans un cluster k8s suivant le contexte utilisé
kubectl get $OBJECT_CATEGORIE

# Affiche l'élément de la catégorie séléctionnée dans un cluster k8s suivant le contexte utilisé
kubectl get $OBJECT_CATEGORIE $NAME
```

```bash
kubectl get deployments -n kube-system
kubectl get deployments coredns -n kube-system
```

<hr class="my-10">

```bash
# Affiche les informations détaillés d'un objet suivant le contexte utilisé
kubectl describe $OBJECT_CATEGORIE $NAME 
```

```bash
kubectl describe deployments coredns -n kube-system
```

</v-clicks>

---

### Create / Update

<v-clicks>

```bash
# Applique la configuration des fichiers spécifés au cluster suivant le contexte utilisé
kubectl apply -f $FILES
```

```bash
kubectl apply -f ./assets/kuard.yaml
kubect get pods
```

</v-clicks>

---

### Delete

<v-clicks>

```bash
# Applique la configuration des fichiers spécifés au cluster suivant le contexte utilisé
kubectl delete -f $FILES
```

```bash
kubectl delete -f ./assets/kuard.yaml
kubect get pods
```

</v-clicks>

---

### Logs

<v-clicks>

```bash
 kubectl logs $POD_NAME # Affiche les logs
```

```bash
 kubectl logs coredns-[...] # Affiche les logs de coredns
```

</v-clicks>

---

### Interagir Avec Le Conteneur

<v-clicks>

```bash
kubectl exec -it $POD_NAME -- bash # Permet de se *connecter* au pods
```

```bash
kubectl exec -it coredns-[...] -- bash # Permet de se *connecter* au pods coredns
```

</v-clicks>

---

### Le Port-forwarding

```bash
kubectl port-forward $POD_NAME $PORT_HOST:$PORT_KUB
```

---

## Nodes

<v-clicks>

<!--
TODO: Le mettre en SVG et l'animer
-->
<img style="height: 40vh;" class="m-auto" src="/kubeXgopher.svg" />

```bash
kubectl get nodes -o wide
```

</v-clicks>

---

## La structure des ressources déployables

```yaml {all|1|2|3|4|5|6-7}
apiVersion: apps/v1 # Donne la version du fichier de configuration
kind: bar # Définit le type de ce que l'on veut configurer
metadata: # Ajoute des données supplémentaires au déploiement utilisable par d'autres applications / kubernetes, des métadonées quoi 😁
  name: HelloWorld # Donne un nom à notre config
  namespace: foo # Donne le namespace ou celui-ci va s'appliquer, par defaut kubernets le met dans le namespasce `default`
spec: # La configuration
  ...
```

---
layout: center
---

## Pods

---

### Présentation

<v-clicks>

```yaml {all|1-5|6|7|8}
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers: # Définie les conteneur à déployer dans le pods
    - name: nginx # Nom du conteneur
      image: nginx:1.14.2 # Nom de l'image à télécharger
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: kuard
    image: gcr.io/kuar-demo/kuard-amd64:blue
```

</v-clicks>

---

### Manipulation - Déploiment

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: kuard
    image: gcr.io/kuar-demo/kuard-amd64:blue
```

<v-clicks>

1. `kubectl apply -f [PATH_TO_FILE]/kuard_pods.yaml`
2. `kubectl get pods --watch` -> attendre que cela retourne ready
3. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
4. Aller sur [http://localhost:8080/](http://localhost:8080/)
5. ✨ It works !!! ✨

</v-clicks>

---

### Manipulation - Test

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: kuard
    image: gcr.io/kuar-demo/kuard-amd64:blue
```

<v-clicks>

1. `kubectl get pods --watch` -> executer les commandes dans des nouveaux terminaux
2. `kubectl delete pods kuard-…` -> essayez de supprimer le pods
3. Le pods à disparu
6. ✨ It works !!! ✨

</v-clicks>

---
layout: center
---

## Storage

---

### Les volumes

<v-clicks>

- Stocker des informations
- Sortes de partitions pour conteneur

</v-clicks>

<v-click>

```yaml {all|9-11|10|11|12-14|13|14}
apiVersion: v1
kind: Pod
metadata:
  name: foo
spec:
  containers:
  - name: bar
    image: baz
	volumeMounts: # Monte un volume dans le conteneur
      - name: quz # Prends le volume importé dans le pods du nom de `quz`
        mountPath: /config # Monte le volume dans `/config`
  volumes: # Définit les volumes dans un pod
    - name: quz # Crééer un volume du nom `quz`
      {{ .StorageType }} # Les configs spécifiques aux types de volumes
```

</v-click>

---
layout: center
---

## Deployments

---

### Présentation

<v-clicks>

- Le moyens le plus simple pour déployer un *workload*
- Gère les états des pods et autre éléments nécessaires
- $\text{pods config} \subset \text{deployment config}$

</v-clicks>

---

### Analyse du fichier

```yaml {all|7|8-10|11-23}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard-deployment
  namespace: default
spec:
  replicas: 1 # Paramètre le deployment, lui indique combien de pods doit-il générer, 1 par défaux
  selector: # Paramètre le deployment, lui indique quel pod il doit manager
    matchLabels:
      app: kuard-deployment
  template: # Le fichier de config du pod -> [Pods | Kubernetes](https://kubernetes.io/docs/concepts/workloads/pods/#pod-templates)
    metadata:
      labels:
        app: kuard-deployment
    spec:
      containers:
        - name: kuard-deployment
          image: gcr.io/kuar-demo/kuard-amd64:blue
	      ports:
	        - containerPort: 80 # Le port à exposer
	          hostPort: 8080 # Le port exposé sur un noeud
	          protocol: TCP
	          name: web # Donne un nom au port pour le retrouver plus simplement
```

---

### Manipulation - Déploiment

<v-clicks>


1. `kubectl apply -f [PATH_TO_FILE]/kuard.yaml`
2. `kubectl get deployments -o wide --watch` -> attendre que cela retourne ready
3. `kubectl get pods` -> voir que le pod est bien créé en parallèle
4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
5. Aller sur [http://localhost:8080/](http://localhost:8080/)
6. ✨ It works !!! ✨

</v-clicks>

---

### Manipulation - Test

<v-clicks>

1. `kubectl get deployments -o wide --watch` et `kubectl get pods --watch` -> executer les commandes dans des nouveaux terminaux
2. `kubectl delete pods kuard-…` -> essayez de supprimer le pods
3. Le pod est recréé => un des roles du deployments
6. ✨ It works !!! ✨

</v-clicks>

---
layout: center
---

## Services

---

### Présentation

<v-clicks>

- Résoudre le problème de découvertes des services
- Addons du DNS pour K8S
- Regroupe plusieurs IPs sous une IP plus stable
- Redistribue les requêtes
- `$SERVICE_NAME.svg.$NAMESPACE_NAME.cluster.local`

</v-clicks>

---

### Types

<v-click>

#### ClusterIP

Service de base

</v-click>


<v-click>

#### NodePorts

</v-click>

<v-clicks>

- Plage de ports entre `30000-32767`
- `.spec.type` à `NodePorts`
- Expose sur tous les nodes

</v-clicks>

---

### Manip

```yaml {all|7|8-11|9|10|11|12-13|all}
apiVersion: v1
kind: Service
metadata:
  namespace: default
  name: kuard
spec:
  type: ClusterIP # Définit le type (déjà le par défaut, juste pour l'exemple)
  ports: # Définit les ports du service
    - port: 9080 # Définit le port du service
      protocol: TCP # Définit le protocole
      targetPort: web # Définit le port de déstination
  selector: # Applique les règles pour choisirs à qui rediriger le flux
    app: kuard-svc
```

<v-clicks>

1. `kubectl apply -f [PATH_TO_FILE]/kuard_svc.yaml`
2. `kubectl get service`
3. `kubectl port-forward services/kuard 8080:9080`
4. C'est tout 😅 

</v-clicks>

---

### Schéma du trafique

<img style="width: 100%;" class="m-auto" src="/networkSVC.svg" />

---
layout: center
---

## IngressRoute

---

### Présentation

<v-clicks>

- Configure l'ingress
- Reverse Proxy (ingress)
- LoadBalancer (ingress)

</v-clicks>

---

### Présentation du fichier

```yaml {all|7-9|10-15|12|13-15|14|15}
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: foo
  namespace: default
spec: # Configuration de l'IngressRoute
  entryPoints: # Spécifie sur quel port d'entré associé l'IngressRoute
    - websecure
    - web
  routes: # Définit les réels paramètres de rediréctions
    - kind: Rule # ???
      match: Host(`foo.bar.com`) # indique les paramètres et conditions à remplir pour appliquer cette règle
      services: # fait la redirections avec les services
        - name: foo # le nom du service, /!\ Il faut que le service soit dans le même namespace que celui de l'ingressroute /!\
          port: 8080 # le port du service
```

---

### Manip - Fichier

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: kuard
  namespace: default
spec:
  entryPoints:
    - websecure
    - web
  routes:
    - kind: Rule
      match: Host(`kuard.kubemaster.local`)
      services:
        - name: kuard
          port: 9080
```

<v-clicks>

1. `kubectl apply -f [PATH_TO_FILE]/kuard_ingress.yaml`
2. `kubectl get ingressroutes.traefik.containo.us`
3. Ouvrir votre navigateur
4. Aller à [http://kuard.kubemaster.local](http://kuard.kubemaster.local)
5. ✨ It works !!! ✨

</v-clicks>

---

### Schéma du trafique

<img style="width: 100vw" class="m-auto" src="/networkINGRESSROUTE.svg" />

---
layout: center
---

## Secrets & ENV Vars

---

### Présentation

<v-clicks>

- Moyens de configuration (ENV)
- Contienent des tokens (SECRETS)
- Peuvent être utilisés comme des ENVs (SECRETS)
- Stockés en base64 (SECRETS)

</v-clicks>

<v-clicks>

```bash
echo "MY_SUPER_SECRET_VALUE" | base64 -w 0
```

<div>
<br />

<twemoji-warning /> **Warning :** base64 != chiffrement

```bash
echo "BASE64_STRING" | base64 --decode
```

<br />
</div>
</v-clicks>

---

### Analyse du fichier - Secrets

<v-clicks>

```yaml {all|5|6-8|7|8|all}
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque # Dit que le secret peut contenir des valeurs arbitraires
data: # Contient les datas du secret
  username: YWRtaW4= # Chaine en bas64 -> admin
  password: MWYyZDFlMmU2N2Rm # Chaine en base64 -> 1f2d1e2e67df
```

```yaml {all|6|7-8|8}
apiVersion: v1
kind: Secret
metadata:
  name: myregistrykey
  namespace: awesomeapps
type: kubernetes.io/dockerconfigjson # Dit que le secret contient des identifiants à un registry sous format JSON
data:
  .dockerconfigjson: UmVhbGx5IHJlYWxseSByZWVlZWVlZWVlZWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGx5eXl5eXl5eXl5eXl5eXl5eXl5eSBsbGxsbGxsbGxsbGxsbG9vb29vb29vb29vb29vb29vb29vb29vb29vb25ubm5ubm5ubm5ubm5ubm5ubm5ubm5ubmdnZ2dnZ2dnZ2dnZ2dnZ2dnZ2cgYXV0aCBrZXlzCg== # Chaine en base64 -> Really really reeeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaalllllllllllllllllllllllllllllllyyyyyyyyyyyyyyyyyyyy llllllllllllllooooooooooooooooooooooooooonnnnnnnnnnnnnnnnnnnnnnnnggggggggggggggggggg auth keys
```

</v-clicks>

---

### Analyse du fichier - ENVs & Secrets 

```yaml {all|6-23|16-23|17-18|17|18|19-23|19|20|21|22|23}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kuard
  template:
    metadata:
      labels:
        app: kuard
    spec:
      containers:
        - name: kuard
          image: gcr.io/kuar-demo/kuard-amd64:blue
		  env: # Définit des variables d'environement
		    - name: FOO # Le nom de la variable
		      value: HelloWorld # Sa valeur

		    - name: BAR # Le nom de la variable
```

---

### Manip - Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: kuard
  namespace: default
type: Opaque
data:
	BAR: S3ViZXJuZXRlcyBpcyBjb29sLCBpc24ndCBpdCA/IDopCg== # Kubernetes is cool, isn't it ? :)
```

---

### Manip - Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard-secret
  namespace: default
spec:
  replicas: 1
  selector:
    ...
  template:
    ...
    spec:
      containers:
        - name: kuard-secret
          image: gcr.io/kuar-demo/kuard-amd64:blue
          ...
          env:
		    - name: FOO
		      value: HelloWorld
		    - name: BAR
		      valueFrom:
                secretKeyRef:
                  name: kuard
                  key: BAR 
```

---

### Manip - Commandes

<v-clicks>

1. `kubectl apply -f [PATH_TO_FILE]/kuard_sec.yaml`
2. `kubectl get secret`
3. `kubectl get pods --watch` -> attendre que cela retourne ready
4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
5. Aller sur [http://localhost:8080/-/env](http://localhost:8080/-/env) 
6. ✨ It works !!! ✨

</v-clicks>

---
layout: center
---

## ConfigMaps

---

### Présentation

<v-clicks>

- Contient max 1Mo
- Sorte de système de fichiers déclaratif

</v-clicks>

---

### Analyse du fichier - ConfigMaps

```yaml {all|5-17|7|8|10-17}
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data: # Les données à définir
  # Ce sont des valeurs définies comme des variables d'environnement; chaque clé fait référence à une valeur simple
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # Ce sont des valeurs semblables à des fichiers
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```

---

### Analyse du fichier - Imports

```yaml {all|14-25|15-19|15|16|17|18|19|20-21|22-25|24|25}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kuard
  template:
    metadata:
      labels:
        app: kuard
    spec:
      containers:
        - name: kuard
          image: gcr.io/kuar-demo/kuard-amd64:blue
		  env: # Définit des variables d'environnement
		    - name: BAR # Le nom de la variable
		      valueFrom: # Indique que la valeur doit être cherchée dans un autre fichier
                configMapKeyRef: # Dit qu'il s'agit d'une Configmaps
                  name: foobar # Le nom du Configmaps /!\ Il faut que le Configmaps soit dans le même namespace que celui du deployment /!\
                  key: BAR # Indique quelle valeur prendre dans la Configmaps
		 volumeMounts: # Monte la configmaps
		    - name: foobarbaz
		      mountPath: /config
	  volumes:
	    - name: foobarbaz
	      configMap: # Précise que le volume est du genre configmaps
	        name: qux # indique le nom de la configmaps
```
---

### Manip - ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: kuard
  namespace: default
data:
  FOO: HelloWorld
  BAR: "Kubernetes is cool, isn't it ? :)"
  k8s.md: |
    **💙 K8S 💙**
```

---

### Manip - Deployment & Commandes

Ouvrez le fichier `kuard_configmap.yaml` <twemoji-grinning-face-with-sweat />

<v-clicks>

1. `kubectl apply -f [PATH_TO_FILE]/kuard_configmap.yaml`
2. `kubectl get configmaps`
3. `kubectl get pods --watch` -> attendre que cela retourne ready
4. `kubectl port-forward kuard-… 8080:8080` -> permet d'accéder à l'application, c'est comme du port forwarding avec ssh
5. Allez sur [http://localhost:8080/-/env](http://localhost:8080/-/env) 
6. Allez sur [http://localhost:8080/fs/](http://localhost:8080/fs/) 
7. Allez dans le dossier config et regarder les fichiers de la configmap
8. ✨ It works !!! ✨


</v-clicks>

---
layout: center
---

# Les mots de la fin

---
layout: center
---

## Applications *Système*

---
layout: center
---

## Applications De Déploiements

---
layout: center
---

## Applications de gestion de cluster

---

## Ressources pour continuer

### K8S

- https://xavki.blog/kubernetes-tutoriaux-francais/
- https://www.youtube.com/@justmeandopensource/playlists
- https://www.youtube.com/@TechnoTim/playlists
- https://www.youtube.com/@TechWorldwithNana/playlists
- https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/

### Apps

- https://xavki.blog/prometheus-grafana-tutoriaux-francais/
- https://xavki.blog/helm-tutoriels-fr-et-gratuits/

---

## Conclusion

<v-clicks>

- Orchestrateur de conteneur
- Configuration déclarative
- Parfois compliqué
- **MAIS** super communauté / ecosystème => simple
- Bien plus qu'une simple plateforme d'auto-héberbement...

</v-clicks>
