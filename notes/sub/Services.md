---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Kubernetes]], [[K8SPresentation]], [[Server]]

---

%%
[Kubernetes Services explained | ClusterIP vs NodePort vs LoadBalancer vs Headless Service - YouTube](https://www.youtube.com/watch?v=T4Z7visMM4E)
[Service | Kubernetes](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)
[Service | Kubernetes](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport)
[https://www.oreilly.com/library/cover/9781098110192/](https://www.oreilly.com/library/cover/9781098110192/)
%%

> [!warning]  
> C'est une notion complexe, mais **très utile**

# Intro

Comme répété depuis le début de cette présentation, K8S brise les codes plus _traditionnels_ des déploiements d'applications => abstraction++

Les services sont là pour résoudre les problèmes de découverte des applications de façon ultra dynamique, abstraite et très éphémère de Kubernetes, c'est donc une sorte d'addons du DNS designé pour K8S. Il fonctionne par le simple fait de créer une adresse IP stable (ne changeant pas avec le déploiement de chaque pods) et pouvant regrouper plusieurs applications sous une même IP qui servira ensuite à redistribuer les requêtes comme un load-balancer et surtout comme couche d'abstraction entre les paramètres DNS et les pods

On peut y accéder avec la structure suivante

```txt
$SERVICE_NAME.svg.$NAMESPACE_NAME.cluster.local
```

```yaml
apiVersion: v1 # La version de l'objet
kind: Service # Décrit le fait que c'est un service
metadata:
  name: my-service # Lui donne des métadonnées pour être répéré par d'autres applications...
spec:
  type: ServiceType # Définit le type de service voulu
    selector: # Définit les critères à avoir pour être choisi comme endpoint par le service
      app.kubernetes.io/name: MyApp
    ports: # Définit les ports
      - name: PortsName # Définit le nom du port (obligatoire que en présence de plusieurs pods dans le même service)
        protocol: TCP
        port: 80 # Port à exposer
        targetPort: 9376 # Port sur lequel il faut rediriger -> celui du/des pods. On peut aussi utiliser un nom qui doit alors corréspondre à celui défini dans le déployment
```

# Types

Il existe plein de types, mais nous allons en couvrir 2 les plus utilisés pour héberger des applications chez soi

## ClusterIP

C'est le type de service par défaut, il permet de regrouper tout un ensemble de pods sous une seule et même IP **à l'intérieur du cluster K8S**.

Elle peut ensuite être utilisée en combinaison avec un ingress controller pour permettre d'accéder au service

## NodePorts

> [!note]  
> Les plages de ports sont à choisir entre `30000-32767`

> [!info]  
> Il faut mettre le `.spec.type` à `NodePorts`

C'est un autre type de service qui permet de regrouper tout un ensemble de pods et de les exposer sur un port local de **TOUS** les nodes  
=> pas très utile, sauf pour certains cas \#vpn

# Manip

```yaml
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

1. `kubectl apply -f [PATH_TO_FILE]/kuard_svc.yaml`
2. `kubectl get service`
   [3. `kubectl port-forward services/kuard 8080:9080`]()
3. C'est tout 😅 => Let's go to [[IngressRoute]] pour voir le réel avantage

```d2
Trafic réseau simplifié: {
  shape: sequence_diagram

  computer: Ordinateur local

  service: Kuard (SVC) {
    exchange
  }
  pods: Kuard (PODS)

  ext: Trafique externe au cluster {
    computer -> service.exchange: Envoie la requette au service concerné à l'addresse kuard.svc.default.cluster.local:9080
  }
  int: Trafique interne au cluster {
    service -> pods: Le service le renvoie à son endpoint XXX.XXX.XXX.XXX:8080
    pods -> service.exchange: L'application renvoie la réponse
  }
  ext: Trafique externe a cluster {
    service.exchange -> computer: L'application renvoie la réponse
  }
}
```
