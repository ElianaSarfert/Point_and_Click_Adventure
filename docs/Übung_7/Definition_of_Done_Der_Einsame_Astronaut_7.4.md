# Definition of Done – Der Einsame Astronaut

Eine Aufgabe gilt erst als abgeschlossen, wenn alle **zutreffenden** Kriterien erfüllt sind. Nicht zutreffende Kriterien werden bei der jeweiligen Aufgabe ausdrücklich als *nicht zutreffend* markiert.

## 1. Versionskontrolle und Build

- [ ] Code und zugehörige Dateien wurden mit einer aussagekräftigen Commit-Nachricht committet und auf GitHub gepusht.
- [ ] Das Godot-Projekt startet ohne Fehler und ohne neu verursachte Warnungen.
- [ ] Das implementierte Feature funktioniert im exportierten Build.
- [ ] Neue Dateien wurden entsprechend der bestehenden Projektstruktur abgelegt und gegebenenfalls über Git LFS verwaltet.

## 2. Funktionalität und Tests

- [ ] Das Feature erfüllt die definierten Akzeptanzkriterien des zugehörigen Backlog-Eintrags.
- [ ] Das Feature wurde manuell getestet und funktioniert wie vorgesehen.
- [ ] Bereits bestehende Funktionen wurden durch die Änderungen nicht beeinträchtigt.
- [ ] Fehlerhafte oder ungültige Spieleraktionen werden korrekt behandelt, beispielsweise die Verwendung eines falschen Items auf einem Objekt.
- [ ] Ab Woche 10 sind relevante automatisierte Tests vorhanden und erfolgreich durchgelaufen.

## 3. Codequalität und Architektur

- [ ] Die Coding-Konventionen aus `PIPELINE.md` wurden eingehalten.
- [ ] Neue Funktionen und Skripte besitzen klar definierte Verantwortlichkeiten.
- [ ] Bestehende Funktionen werden nach Möglichkeit wiederverwendet, statt unnötig dupliziert zu werden.
- [ ] Gameplay-relevante Werte werden möglichst zentral oder über exportierte Variablen verwaltet, statt mehrfach fest codiert zu werden.

## 4. Gameplay und Benutzeroberfläche

- [ ] Interaktionen geben dem Spieler eine erkennbare Rückmeldung, beispielsweise durch Animationen, Cursoränderungen oder Informationstexte.
- [ ] Neue Interaktionsobjekte sind erreichbar und können mit der vorgesehenen Eingabe verwendet werden.
- [ ] Änderungen an Rätseln und Inventargegenständen wurden auf ihre Auswirkungen auf bestehende Rätsel überprüft.

## 5. Assets und Dokumentation

- [ ] Neue Assets entsprechen den festgelegten Format-, Benennungs- und Importkonventionen.
- [ ] Bei externen Assets wurden Herkunft und Lizenzbedingungen dokumentiert beziehungsweise ungeklärte Nutzungsrechte gekennzeichnet.
- [ ] Der Backlog-Eintrag wurde mit dem tatsächlichen Arbeitsaufwand aktualisiert.
- [ ] Ein Dev-Log-Eintrag wurde erstellt.
- [ ] Relevante technische Änderungen wurden bei Bedarf im TDD, in der `PIPELINE.md` oder in einem ADR dokumentiert.

---

*Grundlage: Vorlage V7 – Definition of Done (Startvorschlag), angepasst an das Projekt „Der Einsame Astronaut“.*
