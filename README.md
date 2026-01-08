# 🎯 Contexte et besoin

## 📌 Description du besoin

Le projet consiste à **enregistrer des scénarios utilisateurs sur une application web** (Liferay DXP dans notre cas) puis à **rejouer automatiquement ces scénarios sur plusieurs environnements identiques** (DEV, INT, REC, PROD), ou sur d'autres sites d'un même environnement.

Un scénario correspond à une suite d’actions réalisées dans le navigateur :
- Navigation entre pages
- Clics sur des boutons / menus
- Saisie de formulaires (login, création de contenu, etc.)
- Interactions avancées (iframes, drag & drop, menus dynamiques)

L’objectif principal n’est **pas un test fonctionnel**, mais surtout :
- La **reproductibilité des parcours métiers**
- La **validation rapide après déploiement**
- La possibilité de **record & playback** pour accélérer la création des scénarios

---

## 🧩 Contraintes techniques issues du contexte

- Application web moderne (SPA, JavaScript, iframes)
- Utilisation de **Liferay** (DOM dynamique, Shadow DOM, iframes, drag & drop)
- Exécution dans des **environnements Docker**
- Scénarios rejoués sur plusieurs URLs (via variable `BASE_URL`)
- Besoin d’un outil **maintenable**, lisible et évolutif

---

# 🛠️ Outils étudiés

Les trois outils suivants sont comparés :
- **Playwright**
- **Selenium (IDE / WebDriver)**
- **Robot Framework**

Le comparatif est réalisé en tenant compte du **record & playback**, de la facilité d’usage et de l’adéquation avec le besoin.

---

# 📊 Tableau comparatif global

| Critère | Playwright | Selenium | Robot Framework |
|------|-----------|----------|-----------------|
| Langages supportés | JS / TS / Python / Java / C# | Multi-langages | Python / mots-clés |
| Record & Playback | ✅ Playwright Codegen | ⚠️ Selenium IDE uniquement | ❌ Pas natif |
| Qualité du code généré | ⭐⭐⭐⭐ | ⭐⭐ | ❌ |
| Support SPA / JS moderne | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Gestion iframes / Shadow DOM | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| Drag & Drop | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| Stabilité des tests | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Vitesse d’exécution | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Installation Docker | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| Maintenance long terme | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Courbe d’apprentissage | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |

---

# 🎥 Focus : Record & Playback

## ▶️ Playwright

- Outil natif : **Playwright Codegen**
- Enregistrement en temps réel via navigateur Chromium / Firefox / WebKit
- Génère du **code propre et maintenable** (`test()`, `locator`, `getByRole`)
- Le scénario enregistré peut être :
  - Nettoyé
  - Paramétré (`BASE_URL`, données dynamiques)
  - Réutilisé sur plusieurs environnements

👉 Très adapté à notre besoin.

---

## ▶️ Selenium

- Outil principal : **Selenium IDE** (extension navigateur)
- Enregistrement possible mais :
  - Code peu maintenable
  - Peu robuste sur DOM dynamique
  - Mauvaise gestion des iframes et SPA

👉 Acceptable pour des démos simples, **peu fiable pour Liferay**.

---

## ▶️ Robot Framework

- Pas de record & playback natif
- Les scénarios sont écrits manuellement sous forme de mots-clés
- Très lisible pour des profils non développeurs

👉 Excellent pour tests fonctionnels structurés, **moins adapté à l’enregistrement de parcours complexes**.

---

# ✅ Avantages et inconvénients par outil

## 🟢 Playwright

**Avantages**
- Enregistrement automatique (Codegen)
- Très robuste sur applications modernes
- Excellente gestion des iframes, SPA, drag & drop
- Rapide, stable, bien maintenu
- Idéal pour Docker & CI/CD

**Inconvénients**
- Nécessite des bases en JavaScript / TypeScript
- Record & playback = point de départ, pas une finalité

---

## 🟠 Selenium

**Avantages**
- Historique et très répandu
- Multi-langages

**Inconvénients**
- Selenium IDE limité
- Tests fragiles
- Maintenance coûteuse
- Moins adapté aux applications modernes

---

## 🔵 Robot Framework

**Avantages**
- Syntaxe lisible
- Très utilisé en QA fonctionnel
- Facile à lire par des non-développeurs

**Inconvénients**
- Pas de vrai record & playback
- Moins flexible pour interactions complexes
- Couche supplémentaire au-dessus de Selenium

---

# 🏁 Conclusion

## 🎯 Outil le plus adapté au besoin

### ✅ **Playwright** est clairement le meilleur choix

**Pourquoi ?**
- Il répond **nativement** au besoin de **record & playback** via Codegen
- Il est parfaitement adapté aux **applications modernes comme Liferay**
- Il permet de transformer rapidement un scénario enregistré en **test robuste, maintenable et paramétrable**
- Il s’intègre naturellement avec **Docker et CI/CD**

👉 **Conclusion finale** :

>On utilisera **Playwright + Codegen** pour enregistrer les scénarios, puis les structurer comme des tests E2E réutilisables sur tous les environnements.

---

📌 *Selenium peut être envisagé pour des contextes legacy, Robot Framework pour des équipes QA très orientées métier, mais pour notre besoin précis, Playwright est le choix le plus pertinent et durable.*

