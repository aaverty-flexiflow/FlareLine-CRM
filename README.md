
# FlareLine CRM

Un CRM moderne développé avec Flutter, offrant une interface utilisateur intuitive pour la gestion des contacts, deals et tâches.

## 🚀 Fonctionnalités

- **Gestion des contacts** : Ajout, modification et suppression de contacts
- **Gestion des deals** : Suivi des opportunités commerciales avec tableau Kanban
- **Gestion des tâches** : Organisation des tâches avec drag & drop entre colonnes
- **Interface moderne** : Design responsive et intuitif
- **Architecture MVVM** : Code bien structuré et maintenable

## 🏗️ Architecture

Le projet utilise une architecture MVVM (Model-View-ViewModel) avec :

- **Models** : Entités de données (Contact, Deal, Task)
- **Views** : Interface utilisateur
- **ViewModels** : Logique métier et gestion d'état
- **Services** : Gestion des données et API

## 🔧 Configuration des Flavors

Le projet supporte deux flavors pour différents environnements :

### Flavor "dev" (par défaut)
- Interface sans données
- Idéal pour le développement et les tests d'UI
- Service de données vide

### Flavor "mocked"
- Interface avec données simulées
- Idéal pour les démonstrations et tests
- Service de données avec fausses données

## 🚀 Lancement du projet

### Flavor Dev (par défaut)
```bash
flutter run --flavor dev
```

### Flavor Mocked
```bash
flutter run --flavor mocked
```

### Compilation pour production
```bash
# Web
flutter build web --flavor dev
flutter build web --flavor mocked

# Android
flutter build apk --flavor dev
flutter build apk --flavor mocked

# iOS
flutter build ios --flavor dev
flutter build ios --flavor mocked
```

## 📱 Fonctionnalités principales

### Gestion des contacts
- Liste des contacts avec recherche
- Ajout de nouveaux contacts
- Modification des informations existantes
- Suppression de contacts

### Gestion des deals
- Tableau Kanban avec colonnes : Next, Prospect, Proposal, Won
- Drag & drop entre colonnes pour changer le statut
- Ajout de nouveaux deals
- Modification et suppression

### Gestion des tâches
- Tableau Kanban avec colonnes : À faire, En cours, À réviser, Terminé
- Drag & drop entre colonnes
- Ajout de nouvelles tâches
- Modification et suppression
- Attribution d'utilisateurs

## 🛠️ Technologies utilisées

- **Flutter** : Framework de développement cross-platform
- **Flutter Bloc** : Gestion d'état
- **Syncfusion Flutter** : Composants UI avancés
- **Faker** : Génération de données simulées
- **Google Fonts** : Typographie

## 📁 Structure du projet

```
lib/
├── core/
│   ├── models/          # Modèles de données
│   ├── services/        # Services de données
│   └── theme/           # Thème et couleurs
├── pages/               # Pages de l'application
│   ├── contacts/        # Gestion des contacts
│   ├── deals/           # Gestion des deals
│   ├── tasks/           # Gestion des tâches
│   └── auth/            # Authentification
└── main.dart            # Point d'entrée principal
```

## 🔄 Drag & Drop

Le projet implémente un système de drag & drop complet pour :

- **Deals** : Déplacer entre les statuts (Next → Prospect → Proposal → Won)
- **Tâches** : Déplacer entre les étapes (À faire → En cours → À réviser → Terminé)

Chaque élément peut être glissé et déposé dans une nouvelle colonne, mettant à jour automatiquement son statut.

## 🎨 Personnalisation

### Couleurs
Les couleurs sont définies dans `lib/core/theme/crm_colors.dart` et peuvent être facilement modifiées.

### Thème
Le thème global est configuré dans `lib/core/theme/global_theme.dart`.

## 📝 Contribution

1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🤝 Support

Pour toute question ou problème, n'hésitez pas à ouvrir une issue sur GitHub.
