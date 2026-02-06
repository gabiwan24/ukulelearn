# Loop Master Mobile

Eine mobile Web-App zum Üben von Video- und Audio-Loops: Loop-Start (A) und -Ende (B) setzen, Loop ein/aus, Bibliothek und Backup – alles lokal im Browser.

## Live-Demo

Nach dem Aktivieren von GitHub Pages erreichbar unter:

**https://[dein-username].github.io/ukulelearn/**

## Features

- **Video/Audio laden** – Lokale Dateien (video/*, audio/*)
- **Loop-Bereich** – Start (A) und Ende (B) per Buttons oder Nudge (+/- 0,05 s)
- **Timeline** – Playhead per Touch/Maus verschieben
- **Loop ein/aus** – Zentrale Schaltfläche
- **Bibliothek** – Loops benennen und speichern (localStorage)
- **Backup** – Export/Import als JSON (ohne Cloud)

## Technik

- React 18 (CDN), Babel (JSX), Tailwind CSS, FontAwesome
- Eine statische `index.html`, kein Build-Schritt
- Optimiert für Mobile (Touch, kein Pull-to-Refresh)

## Lokal starten

Einfach `index.html` in einem Browser öffnen oder einen lokalen Server nutzen:

```bash
# Mit Python 3
python -m http.server 8000

# Mit Node (npx)
npx serve .
```

Dann z. B. **http://localhost:8000** aufrufen.

## GitHub Pages einrichten

1. Repository auf GitHub anlegen (z. B. `ukulelearn`).
2. Code pushen (siehe unten).
3. **Settings** → **Pages** → **Source**: „Deploy from a branch“.
4. Branch: `main` (oder `master`), Ordner: **/ (root)**.
5. Speichern – nach 1–2 Minuten ist die App unter  
   `https://[username].github.io/ukulelearn/` erreichbar.

## Repository aufsetzen (von diesem Ordner aus)

```bash
git init
git add index.html README.md
git commit -m "Loop Master Mobile – initial"
git branch -M main
git remote add origin https://github.com/DEIN-USERNAME/ukulelearn.git
git push -u origin main
```

Ersetze `DEIN-USERNAME` durch deinen GitHub-Benutzernamen. Wenn das Repo schon existiert, nur `git remote add` und `git push` anpassen.

## Lizenz

Projekt zum eigenen Gebrauch – Anpassungen und Weitergabe nach Belieben.
