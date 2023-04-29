---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

# Intro

> [!warning]  
> Configure un ingress pas K8S directement

L'ingressRoute est le composant final pour permettre à notre application d'être utilisée en dehors du cluster. Il va permettre de d'indiquer à K8S les règles de rediréctions à appliquer entre un noms de domaine par example et un service à l'intérieur du cluster, ce n'est rien d'autre qu'une moyens de configurer un reverse proxy comme NGINX ou Traefik par example.

> [!warning]  
> C'est une ressource custom (CRD) pour Traefik, cet example ne fonctionne pas avec d'autre ingress controller

> [!info]  
> La config des middlewares est omises volontairemens par soucis de temps / simpliciter

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: foo
  namespace: default
spec: # Configuration de l'IngressRoute
  entryPoints: # Spécifie sur quel port d'entré associé l'IngressRoute
    - websecure
    - web
  routes: # Définit les réls paramètres de rediréctions
    - kind: Rule # ???
      match: Host(`foo.bar.com`) # indique les paramètres conditions à remplir pour appliquer cette règle
      services: # fait la redirections avec les service
        - name: foo # le nom du service, /!\ Il faut que le service soit dans le meme namespace que celui de l'ingressroute /!\
          port: 8080 # le port du service
```

# Manip

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

1. `kubectl apply -f [PATH_TO_FILE]/kuard_ingress.yaml`
2. `kubectl get ingressroutes.traefik.containo.us`
3. Ouvrir votre navigateur
4. Aller à [http://kuard.kubemaster.local](http://kuard.kubemaster.local)
5. ✨ It works !!! ✨

```d2
Trafic réseau simplifié: {
  shape: sequence_diagram

  computer: Ordinateur local
  server: Kubemaster (traefik) {
    ingress
  }

  service: Kuard (SVC)
  pods: Kuard (PODS)

  ext: Trafique externe au cluster {
    computer -> server.ingress: Envoie la requette au serveur associé au nom de domaine, \nici le master, avec l'url kuard.kubemaster.local
  }
  int: Trafique interne au cluster {
    server.ingress -> service: Traefik suit la config donnée et le renvoie à l'addresse interne\n kuard.svc.default.cluster.local:9080
    service -> pods: Le service le renvoie à son endpoint \nXXX.XXX.XXX.XXX:8080
    pods -> server.ingress: L'application renvoie la réponse
  }
  ext: Trafique externe a cluster {
    server.ingress -> computer: L'application renvoie la réponse
  }
}
```
