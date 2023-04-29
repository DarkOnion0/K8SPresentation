---
share: true
---

**Types**:: #🌲  
**Tags**:: [[Server]], [[Kubernetes]], [[K8SPresentation]]  
**Zotero**:: denelScalabiliteHorizontaleVs

---

%%
[Scalabilité horizontale vs scalabilité verticale | SmartWave](https://www.smartwavesa.com/blog-articles/scalabilite-horizontale-vs-scalabilite-verticale/)
%%

# Scalabilité Verticale

Cela revient à ajouter des ressources à un unique serveur (RAM, CPU…)

| ✅                                                                                      | ❌                                                                                         |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| - Solution la plus pragmatique -> applicatifs en production depuis de nombreuses années | - Coûts exponentiels <br> - Limitation dans la scalabilité (`x5` / `x100` -> pas possible) |

# Scalabilité Horizontale

Cela revient a rajouter des serveurs à l'infrastructure -> même type de taches

| ✅                                                                                                                  | ❌                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| - _Commodity hardware_ (hardware standardisé) <br> - Meilleure résilience ([[SLA]]) <br> - Update sans interruption | - L’application doit être stateless <br> - Eviter des données en local -> sinon reverse proxy => [[Sticky Session]] |
