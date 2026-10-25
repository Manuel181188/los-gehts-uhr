# Los-geht's-Uhr

Etappen-Timer für Kinder mit ADHS: vom Ziel aus rückwärts planen, mit
Zeitscheibe, Vorwarnung, Puffer und einem Weg zum Ziel. Läuft als Web-App
auf dem iPad, auch ohne Internet.

**App öffnen:** https://manuel181188.github.io/los-gehts-uhr/

## Auf dem iPad installieren

1. Die Adresse oben in **Safari** öffnen (z. B. per AirDrop vom iPhone schicken).
2. Auf **Teilen** tippen (Quadrat mit Pfeil nach oben) und **„Zum Home-Bildschirm“** wählen.
3. Die App einmal mit WLAN öffnen. Danach funktioniert sie auch offline.

Alle Aufgaben, Pläne und Einstellungen bleiben nur auf dem iPad gespeichert.

## Eigene Aufgaben und Ziele

**⚙️ Eltern** → Rechenaufgabe lösen → **Aufgaben-Bibliothek → Bearbeiten**.
Dort neue Aufgaben mit Regelzeit und Bild anlegen, ändern oder löschen.
Oben auf **Ziele** umschalten für eigene Ziele (z. B. „Zum Reiten“).

## Aufbau

- `index.html` ist die Quelle der App.
- `./build.sh` baut daraus die installierbare App in `docs/`.
  GitHub Pages veröffentlicht den Ordner `docs/`.
- Nach einer Änderung: `./build.sh` ausführen und alles committen.
  Die App auf dem iPad holt sich die neue Version beim nächsten Öffnen mit Internet.
