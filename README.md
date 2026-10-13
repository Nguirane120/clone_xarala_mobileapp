# Xarala Mobile — clone de l'application e-learning

Reproduction en Flutter de l'application mobile de [Xarala](https://www.xarala.co), plateforme sénégalaise de formation en ligne, réalisée comme projet d'apprentissage.

<!-- Ajouter une capture d'écran ici, par exemple : ![Accueil](docs/home.png) -->

## Fonctionnalités

- **Catalogue de cours** : liste des cours, catégories et carrousel sur l'écran d'accueil.
- **Détail d'un cours** : onglets Description et Chapitres, formateur, langue et statut (gratuit ou payant).
- **Cours sauvegardés** : ajout et retrait de favoris, conservés entre deux lancements de l'application (HydratedBloc).
- **Authentification Firebase** : inscription, connexion par e-mail ou avec Google, mot de passe oublié, changement de mot de passe et déconnexion.
- **Profil utilisateur** : informations enregistrées dans Firestore, modification du profil et photo envoyée sur Firebase Storage.
- **Liens dynamiques** Firebase pour ouvrir l'application depuis un lien.

## Stack technique

| Couche | Technologies |
| --- | --- |
| Mobile | Flutter, Dart |
| Gestion d'état | flutter_bloc, HydratedBloc, Equatable |
| Backend | Firebase Auth, Cloud Firestore, Firebase Storage, Firebase Dynamic Links, Google Sign-In |

## Lancer le projet

```bash
git clone https://github.com/Nguirane120/clone_xarala_mobileapp.git
cd clone_xarala_mobileapp
flutter pub get
flutter run
```

Pour utiliser votre propre projet Firebase, régénérez la configuration avec `flutterfire configure`.

## Auteur

**Alioune Badara Nguirane** — Développeur Full Stack Web & Mobile
[GitHub](https://github.com/Nguirane120) · [LinkedIn](https://www.linkedin.com/in/alioune-badara-nguirane-711820197/)
