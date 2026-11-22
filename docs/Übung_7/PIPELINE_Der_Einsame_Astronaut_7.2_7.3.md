# PIPELINE.md – Der Einsame Astronaut

**Projekt:** Der Einsame Astronaut  
**Status:** Arbeitsfassung – Regeln für die weitere Entwicklung  
**Engine:** Godot (im TDD angegeben: 4.7.2)  
**Sprache:** GDScript  
**Versionsverwaltung:** GitHub Desktop / Git LFS

## 1. Projekt- und Ordnerstruktur

Das **gesamte Git-Repository** liegt im Ordner `Point_and_Click_Adventure/`. Das eigentliche **Godot-Projekt** befindet sich darin im Unterordner `point-and-click-adventure/`. Die Ordner `design_docs/` und `art_assets/` gehören damit zum Repository, liegen aber außerhalb des Godot-Projektordners.

```text
Point_and_Click_Adventure/                # Git-Repository (Repository-Root)
├── .git/                                # Git-Verwaltung
├── .gitignore                           # Git-Ausschlussregeln im Repository-Root
├── docs/                                # Technische Entwicklungsdokumentation
│   ├── PIPELINE.md                      # dieses Dokument
│   ├── Definition_of_Done.md            # geplant für Übung 7.4
│   └── adr/                             # Architekturentscheidungen
├── design_docs/                         # Design-Dokumente vom Game Designer
├── art_assets/                          # Asset-Übergabe durch den Artist
└── point-and-click-adventure/           # eigentliches Godot-Projekt
    ├── .godot/                          # generierte Godot-Daten; nicht committen
    ├── Assets/                          # für Godot verwendete Spielgrafiken
    ├── Ressources/                      # Godot-Resources, z. B. Item-Daten
    ├── Skripte/                         # GDScript-Dateien
    │   ├── Interaktionen/               # Skripte für Spielweltinteraktionen
    │   ├── UI/                          # Skripte der Benutzeroberfläche
    │   ├── main.gd                      # raumbezogene Navigation/Interaktionen
    │   ├── protagonist.gd               # Spielfigur
    │   ├── globals.gd                    # globaler Inventarzustand
    │   └── item.gd                       # Item-Resource
    ├── Szenen/                          # Godot-Szenen
    │   ├── Interactions/                # Interaktionsszenen
    │   ├── Räume/                       # Räume
    │   └── UI/                          # UI-Szenen
    ├── .gitattributes                   # LFS-Regeln innerhalb des Godot-Projekts
    ├── .gitignore                       # ggf. zusätzliche Ignorierregeln
    └── project.godot                    # Godot-Projektdatei
```

*Die Abbildung zeigt die aus den Screenshots erkennbare Struktur. Einzelne Dateien sind exemplarisch und nicht als vollständiger Verzeichnisinhalt aufgeführt. `Definition_of_Done.md` und `adr/` sind die vorgesehenen Ablageorte, falls sie noch nicht existieren.*

**Zuständigkeiten:** Der Game Designer legt Design-Dokumente in `design_docs/` ab. Der Artist stellt seine Assets in `art_assets/` bereit. Ich übernehme passende Exporte in den Godot-Ordner `Assets/` und integriere sie dort in die Szenen. Die technische Dokumentation wird unter `docs/` im Repository-Root verwaltet.

## 2. Namens- und Coding-Konventionen

| Element | Konvention | Beispiel |
|---|---|---|
| GDScript-Dateien | `snake_case` | `inventory_container.gd` |
| Variablen, Funktionen und Signals | `snake_case` | `interaction_type`, `closed_dialog` |
| Klassen mit `class_name` | `PascalCase` | `Item`, `Slot` |
| Konstanten | `CONSTANT_CASE` | `MAX_INVENTORY_SIZE` |
| Szenen | einheitliche, aussagekräftige Namen; vorzugsweise `snake_case` | `control_room.tscn` |
| Assets | kleingeschrieben, `snake_case`, nach Inhalt benannt | `player_idle.png`, `reactor_background.png` |
| Einrückung | Tabs | GDScript-Einrückung |

Diese Konventionen gelten für neue Dateien und Änderungen. Bestehende Funktionsnamen wie `activateSlots()` und `pickFromSlot()` werden bei einer späteren Bereinigung vereinheitlicht; dies ist noch nicht vollständig umgesetzt.

## 3. Asset-Pipeline und Import-Einstellungen

### Erstellung und Übergabe

1. Pixel-Art wird in **Aseprite** erstellt.
2. Bearbeitbare Quelldateien werden im Aseprite-Format (`.aseprite`) aufbewahrt, sofern sie mitgeliefert werden.
3. Für Godot werden einzelne Grafiken als `.png` und Animationen bei Bedarf als PNG-Spritesheets exportiert.
4. Der Artist stellt Dateien zunächst im Repository-Ordner `art_assets/` bereit. Für das Spiel vorgesehene Exporte übernehme ich in `point-and-click-adventure/Assets/` und importiere sie in Godot.
5. Die Grafiken werden in den entsprechenden Szenen als Texturen oder Animationen eingebunden und im Spiel getestet.

### Vorgesehene Godot-Importregeln

| Bereich | Regel / Prüfpunkt |
|---|---|
| Pixel-Art-Filterung | Für scharfe Pixelkanten **Nearest** verwenden (am CanvasItem-/Projekteinstellungsort, der für das Asset gilt) |
| Textur-Komprimierung | Einstellungen für 2D-Grafiken prüfen; sichtbare Artefakte vermeiden |
| Spritesheets | Frame-Größe und Reihenfolge mit dem exportierten Spritesheet abgleichen |
| Skalierung | Möglichst ganzzahlige Skalierung zur Vermeidung ungleichmäßiger Pixel verwenden |
| Prüfung | Neue Assets in einer Godot-Szene visuell auf Transparenz, Zuschnitt und Animation testen |

**Status:** Diese Importregeln sind vorgeschlagene Konventionen. Die tatsächlich im Projekt verwendeten Godot-Import-Einstellungen müssen noch überprüft werden.

## 4. Versionsverwaltung und Git LFS

Die Versionsverwaltung erfolgt mit **GitHub Desktop**. Vor einem Commit werden geänderte Szenen und das Godot-Projekt gespeichert. Commits sollen einen konkreten und aussagekräftigen Zweck beschreiben.

Für große Binärformate wurden folgende Regeln in `.gitattributes` aufgenommen:

```gitattributes
* text=auto eol=lf
*.xlsx binary
*.png filter=lfs diff=lfs merge=lfs -text
*.aseprite filter=lfs diff=lfs merge=lfs -text
*.wav filter=lfs diff=lfs merge=lfs -text
*.ogg filter=lfs diff=lfs merge=lfs -text
```

Die `.xlsx`-Projektdatei wird ausdrücklich **nicht über Git LFS** verwaltet. Die vorhandene `.gitattributes` befindet sich innerhalb des Godot-Projektordners `point-and-click-adventure/`; ihre Regeln gelten für Dateien unterhalb dieses Verzeichnisses. Dateien im übergeordneten `art_assets/` werden durch diese Datei **nicht** automatisch erfasst. Falls dort große Binärdateien über LFS gespeichert werden sollen, muss zusätzlich eine entsprechende `.gitattributes` im Repository-Root eingerichtet werden. Git LFS wurde mit `git lfs install` initialisiert, und ein PNG-Test wurde mit `git lfs ls-files` nachgewiesen. Die alten, bereits zuvor committeten Binärdateien müssen laut Übungsblatt nicht rückwirkend migriert werden.

Nicht ins Repository gehören Godots temporäre `.godot/`-Daten, lokale Sperr- und temporäre Office-Dateien sowie exportierte Build-Verzeichnisse. Da `.gitignore` sowohl im Repository-Root als auch innerhalb des Godot-Projekts vorkommt, sind beide Dateien vor Gate G2 zu überprüfen.

**Arbeitsablauf:** Änderungen prüfen → lokal testen → Commit mit klarer Nachricht → Push über GitHub Desktop. Bei Meilensteinen wird ein Tag angelegt (für Gate G2: `g2-greenlight`).

## 5. Drittanbieter-Assets und Lizenzen

| Asset / Herkunft | Quelle | Lizenz / Nutzungsstatus | Pflichten / Maßnahme |
|---|---|---|---|
| Tutorial-Platzhalter | YouTube-Kanal **kilogalaxia2035**, [Tutorial](https://youtu.be/4QSbr9MfJRY), [Playlist](https://www.youtube.com/playlist?list=PLUO8yoWlZ_ayjV1XioVXt47q6b5nKpKPi); bereitgestellte Dateien auf Google Drive (Eigentümer angezeigt als **flygamesstudio2017**) | **Ungeklärt:** keine ausdrücklichen Lizenzbedingungen gefunden | Vor Weitergabe ohne geklärte Nutzungsrechte entfernen oder Erlaubnis einholen; vor finalem Release durch eigene Assets ersetzen |
| Eigene ältere Platzhalter | Eigene frühere Spielprojekte | Eigenes Werk, soweit keine Drittbestandteile vorhanden sind | Herkunft intern nachvollziehbar halten |
| Zukünftige Grafiken des Teams | Aseprite-Dateien / exportierte PNGs, Urheber je Lieferung ergänzen | Noch festzulegen | Urheber, Erlaubnis zur Projektnutzung und ggf. Lizenz dokumentieren |

Neue Fremdassets dürfen erst nach Prüfung der Herkunft und Lizenzbedingungen in eine weitergegebene Version aufgenommen werden. Eine Quellenangabe allein ersetzt keine Nutzungserlaubnis.

## 6. Übergabe von Assets aus anderen Modulen / Teamarbeit

Die Ablageorte für Teambeiträge sind bereits festgelegt:

- **Game Designer:** Design-Dokumente werden in `design_docs/` im Repository-Root hinterlegt.
- **Artist:** Grafiken und bearbeitbare Quelldateien werden in `art_assets/` im Repository-Root bereitgestellt.
- **Technische Integration:** Die für Godot benötigten PNG-Dateien und Spritesheets werden unter `point-and-click-adventure/Assets/` in das Spielprojekt übernommen.

**Festgelegte bzw. vorgeschlagene Übergaberegeln:**

| Bereich | Regel |
|---|---|
| Formate | Aseprite-Quelldateien (`.aseprite`) und Spielgrafiken als `.png` oder PNG-Spritesheet |
| Dateinamen | Aussagekräftige `snake_case`-Namen; bei Animationen nach Möglichkeit Zustand und Richtung nennen |
| Übergabeordner | `art_assets/` (Artist) beziehungsweise `design_docs/` (Game Designer) |
| Begleitangaben | Assetname, Urheber, Quelle, Lizenz/Nutzungsfreigabe sowie ggf. Frame-Größe/Animationsreihenfolge |
| Termine | Noch nicht konkret festgelegt; im Team abzustimmen |
| Integrationstest | Import in Godot; Darstellung, Transparenz, Zuschnitt und Animation prüfen |

Die vorhandene Ordnerstruktur ist bereits Teil des Workflows. Dateibenennungsdetails, verbindliche Übergabefristen und ein einheitliches Begleitformat sind dagegen **noch zu vereinbarende Konventionen**.

## 7. Reproduzierbarer Build – Version 0.1.0

**Status:** Windows-Release-Build erstellt; erneuter Export aus einem frischen Klon erfolgreich durchgeführt.

### Voraussetzungen

- Godot-Version gemäß Projekt/TDD: **4.7.2** (Projektangabe)
- Passende Godot-Export-Templates installiert
- Git mit Git LFS eingerichtet; benötigte LFS-Objekte heruntergeladen
- Im Git-Repository liegt das Godot-Projekt unter `point-and-click-adventure/` mit `project.godot` und der Export-Konfiguration `export_presets.cfg`

### Vorgehen aus einem frischen Klon

1. Repository mit GitHub Desktop in einen neuen Ordner klonen und auf den gewünschten Projektstand wechseln.
2. Sicherstellen, dass die benötigten LFS-Dateien vorliegen (bei Bedarf im Repository-Root `git lfs pull`).
3. `point-and-click-adventure/project.godot` in der passenden Godot-Version öffnen und den Ressourcenimport abschließen lassen.
4. In Godot **Projekt → Exportieren** öffnen und das vorhandene Preset **Windows Desktop** auswählen. Falls nötig, passende Export-Templates installieren.
5. **Projekt exportieren** wählen, **„Export With Debug“ deaktivieren** und die ausführbare Datei mit Versionsangabe `0.1.0` außerhalb des Repositorys ablegen. Eventuell separat erzeugte `.pck`-Dateien mit bereitstellen.
6. Die exportierte `.exe` unabhängig vom Godot-Editor starten und die grundlegenden Spielfunktionen prüfen.

### Durchgeführte Prüfung

- Der erste Windows-Build wurde erstellt und auf Spielstart, Maussteuerung, Bewegung, Raumwechsel, Objektinteraktionen, Informationstexte, Itemaufnahme, Inventarfunktionen, Itemkombination und Umgebungsinteraktion getestet. **Alle acht Prüfpunkte waren erfolgreich.**
- Anschließend wurde der Debug-Modus beim Export deaktiviert und ein Release-Build für Version **0.1.0** erstellt.
- Der Export wurde anschließend aus einem **frisch geklonten Repository erfolgreich wiederholt**.

**Hinweis:** Die erfolgreiche Wiederholung des Exports belegt den dokumentierten Build-Ablauf. Eine bytegenaue Gleichheit der erzeugten Dateien wurde nicht geprüft. Der konkrete Ausgabeordner hängt vom jeweils gewählten Exportpfad ab; Builds werden außerhalb des Repositorys abgelegt und separat für die Abgabe bereitgestellt.

## 8. Definition of Done und Nachweise

Die projektspezifische Definition of Done wird auf Basis von Vorlage V7 in `docs/Definition_of_Done.md` dokumentiert (Aufgabe 7.4). Für abgeschlossene Aufgaben sollen Commit/Push, fehlerfreier Projektstart, manueller Feature-Test, eingehaltene Konventionen sowie aktualisierte Backlog- und Dev-Log-Einträge nachweisbar sein. Automatisierte Tests werden gemäß Vorlage ab Woche 10 berücksichtigt.
