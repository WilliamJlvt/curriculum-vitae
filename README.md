# Repository Guidelines

## Project Structure & Module Organization
- `cv.tex`: Single-source LaTeX for the CV. Keep content and styling edits here.
- `Makefile`: Convenience targets to build and clean artifacts.
- Generated artifacts: `cv.pdf`, `cv.aux`, `cv.log`, `cv.out` (cleaned via `make clean`).
- Assets: `photo.jpg` is the portrait embedded in the CV. Keep dimensions reasonable; use JPG/PNG only.

## Build, Test, and Development Commands
- `make` — compile `cv.tex` to `cv.pdf` with `pdflatex`.
- `make re` — clean then rebuild (use after package updates or style changes).
- `make clean` — remove aux/log outputs (`*.aux *.log *.out *.toc *.nav *.snm`).
- Direct call: `pdflatex -interaction=nonstopmode cv.tex` for quick one-off builds.

## Coding Style & Naming Conventions
- LaTeX formatting: prefer short commands/macros over repeated markup; keep custom macros in the “Commandes personnalisées” block.
- Indentation: 4 spaces for nested environments (`itemize`, `tabular`, `tikz`).
- Text casing: section headers are uppercase via `\sectionheader`; keep item labels sentence case with bold for emphasis.
- Skill pills: use `\skilltag[<size>]{Label}`; default size is `\small`, downscale long labels with `\scriptsize`.
- Assets: keep filenames lowercase with hyphens/underscores (e.g., `photo.jpg`).

## Testing Guidelines
- No automated test suite; verification is visual. Always open `cv.pdf` after changes to confirm layout, line breaks, and that tags do not overflow columns.
- Check the LaTeX log for overfull/underfull boxes; resolve by shortening labels or adjusting sizes (`\skilltag[\scriptsize]{...}`).

## Commit & Pull Request Guidelines
- Commits: concise, imperative subject lines (e.g., “Adjust skill tag sizing”, “Add Makefile for builds”); group related LaTeX changes together.
- Pull requests: include a brief summary of what changed, screenshots or mention of visual diffs when layout is affected, and note any remaining warnings (overfull boxes) from the build log.
- Reference related tasks/issues if applicable; keep PRs small and focused on a single layout/content concern.

## Security & Configuration Tips
- Fonts and packages are standard TeX Live; avoid adding network-fetched assets. Commit only local images and TeX sources.
- Do not embed sensitive data in the CV. Double-check contact info and links before publishing.

## Rapport Stratégique : Optimisation du CV Technique pour Développeur Senior et Consultant (2025-2026)

### 1. Introduction : le changement de paradigme dans le recrutement technique avancé
L'écosystème du recrutement technologique en France et à l'international se transforme avec l'IA générative, la rationalisation économique et le travail hybride/freelance. Pour un développeur avancé ou un consultant senior, le CV est un outil de marketing personnel devant franchir les filtres ATS et convaincre les décideurs (CTO, lead tech, clients). Ce rapport décode les mécanismes de sélection et trace une feuille de route pour un profil capable de prouver sa valeur ROI en 2025. La distinction CV "Employé" vs CV "Consultant" (dossier de compétences) reste clé dans le contexte ESN français.

#### 1.1. État du marché en 2025 : compétences vs titres
Le marché 2025 privilégie la compétence démontrable (skills-based hiring) et l'impact chiffré plutôt que le nom des employeurs. La capacité à travailler en remote ou hybride et à collaborer avec des équipes internationales est désormais standard. Le CV doit être optimisé pour une lecture écran et un passage ATS robuste.

### 2. Ingénierie du CV : comprendre et maîtriser les ATS (Applicant Tracking Systems)
Les ATS filtrent, analysent et classent plus de 75% des CV avant toute lecture humaine.

#### 2.1. Parsing et structure
- Format : le .docx reste la référence pour un parsing sans faille, surtout sur systèmes legacy ; fournir un PDF testé en complément.
- Colonnes/tableaux : privilégier une colonne unique. Les colonnes mélangent les contenus au parsing. Éviter tableaux invisibles et graphiques (barres de compétence) non lus par l'ATS.
- En-têtes/pieds : ne pas placer les coordonnées dans l'en-tête Word ; les mettre dans le corps du document.

#### 2.2. Optimisation sémantique et mots-clés
- Densité naturelle (2-3%) et vocabulaire exact de l'offre. Couvrir variantes sémantiques ("Gestion de projet" et "Pilotage d'affaires").
- Proscrire les mots-clés cachés (police blanche) : détectés et disqualifiants.
- Écrire acronymes et formes longues lors de la première occurrence (AWS / Amazon Web Services).

#### 2.3. Normalisation des dates
Utiliser MM/AAAA avec séparateur standard. Éviter les formats flous ("Été 2018") ou uniquement l'année.

### 3. Architecture de contenu pour profil senior/consultant
- En-tête : titre ciblé ("Architecte Logiciel Senior", "Consultant Expert DevOps"), liens pro (LinkedIn personnalisé, GitHub/portfolio), localisation ville/pays.
- Résumé opérationnel : 3-5 lignes de proposition de valeur (qui je suis + ce que j'apporte) pour CV employé ou freelance (disponibilité, posture plug & play).
- Matrice de compétences : catégoriser (Langages & Backend, Cloud & DevOps, Architecture, Data & SGBD, Méthodologies, Soft skills). Pas de barres/étoiles ; préférer contexte d'utilisation.
- Expérience : appliquer STAR implicitement et quantifier résultats. Pour ESN, lister l'employeur principal puis détailler missions clients (client/secteur, rôle, durée, techno, résultats). Labelliser les missions courtes (Mission/Projet/CDD) et combler les creux par projets/formation.
- Formation/certifications : pour un senior, en fin de CV. Mettre en avant certifications (AWS, PMP, Scrum Master) pour justifier le TJM et rassurer clients.

### 4. Spécificité française : dossier de compétences ESN vs CV freelance
- Dossier de compétences ESN : document exhaustif (5-10 pages), souvent anonymisé, riche en environnements techniques. Préparer une version master détaillée pour les appels d'offres.
- CV freelance : posture entreprise unipersonnelle. Justifier le TJM via expertise de niche ou delivery rapide. Insister sur autonomie, intégration immédiate, statut/assurances, portfolio/GitHub actif.

### 5. Quantification du soft skill et leadership
Montrer plutôt que dire : intégrer les soft skills dans les réalisations.
- Mentorat : "Conception et animation d'un mentorat pour 5 juniors, autonomie atteinte en 3 mois."
- Communication/conflit : "Médiation backend/frontend, -40% de bugs d'intégration."
- Leadership : "Pilotage d'une équipe agile de 12 en contexte de crise, livraison avec 2 semaines d'avance."
- Esprit critique : "Audit de code legacy identifiant 20+ failles critiques, plan de refonte défini."

### 6. Design visuel, typographie et lisibilité humaine
- Polices recommandées pour écran : Arial, Calibri, Helvetica, Roboto, Verdana, Tahoma. Alternatives serif corporate : Georgia, Garamond, Cambria. Éviter Times New Roman (daté), Comic Sans, scripts/cursives.
- Tailles : corps 10-12 pt, titres 14-18 pt.
- Mise en page : marges 1.5-2.5 cm, espace blanc suffisant, hiérarchie visuelle avec gras parcimonieux sur résultats chiffrés et technos clés.
- Longueur : 2 pages idéal pour un senior ; 3 pages tolérées. Dossier ESN sans limite (exhaustivité technique).

### 7. Nuances par profil
- Tech Lead : équilibre 50/50 code et management. Mots-clés : code review, architecture, roadmap, recrutement, onboarding.
- Architecte logiciel : vision big picture. Mots-clés : scalabilité, haute dispo, cloud native, trade-offs, stakeholders, urbanisation SI.
- Développeur senior IC : expertise profonde, résolution de bugs complexes, optimisation perf, contributions open source/bibliothèques internes.

### 8. Red flags (perspective CTO)
- Expertise déclarative excessive (longue liste d'expertises absolues).
- Stagnation (1 an répété 10 fois) sans progression de responsabilité/complexité.
- Manque de veille technologique (technos obsolètes sans ouverture cloud/conteneurs).
- Description de tâches vs résultats ("J'ai codé l'API" vs "API pour 10k req/s").

### 9. Conclusion et checklist finale
Positionner le consultant comme partenaire stratégique. Vérifications avant envoi :
- Format : .docx (ou PDF testé).
- Structure : colonne unique, pas de tableaux invisibles.
- Coordonnées : dans le corps du texte.
- Dates : format MM/AAAA standardisé.
- Résumé : proposition de valeur claire.
- Mots-clés : présents (acronymes + formes longues) et contextuels.
- Expérience : STAR + résultats chiffrés.
- Soft skills : prouvés par exemples.
- Liens : LinkedIn et portfolio/GitHub actifs et fonctionnels.
