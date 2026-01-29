# CV de William Jolivet

Ce repo est vivant. J’y construis mon CV au fil de mes projets concrets et des choses que je code réellement.

## Le but du repo
- Avoir un CV qui évolue avec mon parcours, pas un document figé.
- Garder une trace claire de mon évolution technique et de mes choix.
- Rendre visible mon cheminement : chaque commit raconte une étape.

## Ma philosophie
Je suis dev, donc je « dev » mon CV. Je préfère montrer des réalisations concrètes plutôt que raconter.

## Suivre mon parcours
Si tu veux comprendre mon évolution, suis simplement l’historique des commits.

## Release automatique (PDF)
Un workflow GitHub Actions publie automatiquement une Release quand tu pushes un tag qui commence par `v` (ex: `v1.2.3`).
Les PDF générés (`CV_WILLIAM_JOLIVET_fr.pdf` + `CV_WILLIAM_JOLIVET_en.pdf`) sont attachés à la Release.

### Créer une release
Option simple via le script :
```bash
./scripts/release-tag.sh v1.2.3
```

Option manuelle :
```bash
git tag v1.2.3
git push origin v1.2.3
```

### Test local (act)
Si tu utilises `act`, il faut fournir un token GitHub, sinon l’étape `action-gh-release` échoue :
```bash
act --container-architecture linux/amd64 -s GITHUB_TOKEN=ghp_xxx
```

## Feedback bienvenu
N’hésite pas à ouvrir une issue pour un retour, une remarque ou une idée d’amélioration. C’est vraiment cool.
