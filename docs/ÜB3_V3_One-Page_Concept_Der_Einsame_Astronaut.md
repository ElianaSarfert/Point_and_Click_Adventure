# V3 · One-Page Concept

**Spiel:** Der Einsame Astronaut  
**Gate:** G1 · Concept Gate  
**Genre:** 2D Science-Fiction-Point-and-Click-Adventure  
**Plattform / Steuerung:** PC / Maus  
**Engine:** Godot  
**Zielumfang:** ca. 10 Minuten  
**Status:** Arbeitsfassung – Design-Dokumente werden überarbeitet

## Elevator Pitch
**Der Einsame Astronaut** ist ein klassisches 2D-Science-Fiction-Point-and-Click-Adventure für Erwachsene, in dem Spielende eine beschädigte Dyson-Sphäre um ein Schwarzes Loch reparieren müssen, um ihr Überleben und ihre Rettung zu ermöglichen. Anders als in *The Dig* stehen neben der Erkundung und technischen Rätseln auch verzögerte Kommunikation mit einem Konzern und die erzählerischen Folgen der Zeitdilatation im Mittelpunkt.

## Design Pillars
**01 – Überleben durch Erkundung: „Improvisiere oder stirb.“**  
Erkunde die Umgebung, entdecke in Wrackteilen lebenswichtige Ressourcen und nutze technische Gerätschaften, um Probleme zu lösen.  
*Gameplay:* Erkunden → Verstehen → Improvisieren → Reparieren  
*Emotion:* Isolation, Erfindergeist, Selbstwirksamkeit

**02 – Kommunikation & Zeitdruck: „Jede Antwort kommt zu spät.“**  
Die enorme Entfernung macht Kommunikation langsam. Während der Konzern Rettung verspricht, läuft dem Spieler die Zeit davon.  
*Gameplay:* Kommunizieren → Unterstützung anfordern → Informationen prüfen → selbst handeln  
*Emotion:* Hoffnung, Ungewissheit, Zeitdruck

**03 – Souveränität durch Zeitdilatation: „Wem gehört die Zukunft?“**  
Zeit vergeht außerhalb der Anlage anders. Die Folgen für Menschen und Konzern werden narrativ vermittelt; eine aktiv steuerbare Zeitmanipulation ist **nicht** vorgesehen.  
*Gameplay (bisheriger Designansatz):* Hinterfragen → Entscheiden → Konsequenzen  
*Emotion:* Misstrauen, Verantwortung, moralischer Konflikt

## Zielgruppe
Erwachsene zwischen **16 und 45 Jahren** mit grundlegender Point-and-Click-Erfahrung; insbesondere PC- und Casual-Spielende mit Interesse an Science-Fiction wie *Interstellar*, *Alien* oder *2001: Odyssee im Weltraum*.

## Hook / Besonderheit
**Klassische Reparatur- und Kombinationsrätsel auf einer havarierten Dyson-Sphäre um ein Schwarzes Loch – mit verspäteter Hilfe und den erzählerischen Konsequenzen unterschiedlicher Zeitverläufe.**

## Ein Core Loop
```text
Problem / Defekt entdecken
          ↓
Umgebung erkunden und Hinweise finden
          ↓
Gegenstände sammeln / kombinieren
          ↓
Technisches Rätsel lösen / reparieren
          ↓
Nächster Abschnitt bzw. neues Problem
          └───────────────↺
```
*Konzeptvorschlag für den linearen 10-Minuten-Ausschnitt; Kommunikation kann innerhalb der Rätselkette stattfinden.*

## MDA-Kurzanalyse
- **Mechanics:** Mausbasierte Hotspots, Gegenstände und Inventar, Kombinationen, Dialoge sowie zustandsabhängige Reparaturrätsel.
- **Dynamics:** Spielende untersuchen die Anlage, verstehen Defekte, kombinieren Ressourcen und schalten durch Reparaturen den nächsten Abschnitt frei; Nachrichten liefern Kontext und Hinweise.
- **Aesthetics:** Isolation, Anspannung, Hoffnung, Erfindergeist und Selbstwirksamkeit.

## Referenzspiele
*The Dig* (LucasArts, 1995) · *The Invincible* (Starward Industries, 2023) · *Observation* (No Code, 2019) · *Star Trek: Resurgence* (Dramatic Labs, 2023)

---
**Offene Abstimmung mit Game Design:** Die bisher formulierte „Souveränität durch Zeitdilatation“ und ältere USPs (Zeitmanipulation/Dynastien; visuelle NPC-Alterung) sind nach Wegfall der aktiven Zeitmechanik noch nicht abschließend geklärt. Der Core Loop und der Vergleichssatz im Pitch sind Vorschläge für die aktualisierte, lineare Fassung.

---

# Anhang Technical Direction

*Dieser Anhang zählt nicht zur einen Seite des One-Page Concepts.*

## Technische Risiken (mindestens 3)

Die Risiken sind vor der Umsetzung als überprüfbare Fragen formuliert. Die Spikes werden als kleinste Tests in separaten Godot-Testszenen durchgeführt. Die Erfolgskriterien sind vor Beginn festzulegen und jeweils mit **Ja/Nein** zu bewerten.

### R1 – Point-and-Click-Navigation

| Feld | Inhalt |
|---|---|
| **Risiko (als Frage)** | Bekomme ich eine zuverlässige mausbasierte Charakterbewegung mit anschließender Objektinteraktion in Godot hin? |
| **Spike-Idee** | In einer leeren Testszene einen Charakter, ein Hindernis und einen interaktiven Hotspot platzieren; Bewegung zum Hotspot und anschließende Interaktion testen. |
| **Erfolgskriterium (Ja/Nein)** | Erreicht der Charakter den angeklickten Hotspot, ohne mit dem Hindernis zu kollidieren, und wird die Interaktion anschließend ausgelöst? |
| **Timebox** | 3 h |
| **Plan B (optional)** | Feste Laufwege oder direkte Szenenwechsel statt freier Navigation. |

### R2 – Inventar und Item-Kombinationen

| Feld | Inhalt |
|---|---|
| **Risiko (als Frage)** | Kann ich ein Inventarsystem implementieren, in dem Gegenstände aufgenommen, kombiniert und auf Objekte angewendet werden können? |
| **Spike-Idee** | In einer leeren Testszene zwei aufnehmbare Gegenstände und ein reparierbares Objekt anlegen. Aufnahme, Kombination und Anwendung testen. |
| **Erfolgskriterium (Ja/Nein)** | Lassen sich beide Gegenstände aufnehmen, korrekt kombinieren und das entstandene Item genau einmal zur Reparatur verwenden, wobei die Ausgangsgegenstände aus dem Inventar entfernt werden? |
| **Timebox** | 3 h |
| **Plan B (optional)** | Kombinationen im Inventar streichen; Gegenstände direkt auf Szenenobjekte anwenden. |

### R3 – Rätselabhängigkeiten und Spielzustände

| Feld | Inhalt |
|---|---|
| **Risiko (als Frage)** | Kann ich aufeinander aufbauende Rätsel so verwalten, dass Fortschritt nach Szenenwechseln erhalten bleibt und weitere Interaktionen nur bei erfüllten Bedingungen verfügbar werden? |
| **Spike-Idee** | Zwei kleine Testräume mit je einer Interaktion anlegen. Die zweite Interaktion wird erst nach erfolgreicher erster Reparatur verfügbar; anschließend zwischen den Räumen wechseln. |
| **Erfolgskriterium (Ja/Nein)** | Bleibt die zweite Interaktion vor Abschluss der ersten gesperrt, wird danach freigeschaltet und bleibt der Reparaturzustand nach Hin- und Rückwechsel korrekt erhalten? |
| **Timebox** | 3 h |
| **Plan B (optional)** | Rätselabhängigkeiten reduzieren und eine streng lineare Abfolge zentral gesteuerter Ereignisse nutzen. |

### R4 – Dialogsystem und Kommunikation

| Feld | Inhalt |
|---|---|
| **Risiko (als Frage)** | Kann ich ein Dialogsystem umsetzen, das abhängig vom aktuellen Spielzustand unterschiedliche Nachrichten anzeigt? |
| **Spike-Idee** | In einer leeren Testszene ein Kommunikationsgerät mit zwei Nachrichtentexten und einem umschaltbaren Reparaturzustand anlegen. |
| **Erfolgskriterium (Ja/Nein)** | Zeigt das Kommunikationsgerät vor und nach Änderung des Reparaturzustands jeweils ausschließlich die dafür vorgesehene Nachricht? |
| **Timebox** | 2 h |
| **Plan B (optional)** | Feste, lineare Nachrichtensequenzen ohne zustandsabhängige Dialogverzweigungen verwenden. |


---

## Scope-Check (Aufgabe 3.4)

**Ausgangsliste:** 20 Features · **1. Kürzung:** 10 Features gestrichen · **2. Kürzung:** 5 weitere gestrichen · **Verbleibender Kernumfang:** 5 Features.

| ID | Feature | Ergebnis | Grund |
|---|---|---|---|
| F01 | Point-and-Click-Steuerung | **Behalten**  |  |
| F02 | Item-Rätsel | **Behalten**  |  |
| F03 | Logikrätsel | **Behalten**  |  |
| F04 | Betrachten von Gegenständen | verschoben  | Zeit |
| F05 | Dialog | **Behalten**  |  |
| F06 | Spieleranimation | **Behalten**  |  |
| F07 | Extra Dialoganimation | gestrichen  | Zeit |
| F08 | Tagebuch | gestrichen  | Pillar |
| F09 | Hinweissystem | gestrichen  | Zeit |
| F10 | Hotspots | verschoben  | Zeit |
| F11 | Zeit-Gameplay-Mechaniken | gestrichen  | Risiko |
| F12 | Karte | gestrichen  | Pillar |
| F13 | Mehrere Enden | gestrichen  | Risiko |
| F14 | Speichern | gestrichen  | Risiko, Zeit |
| F15 | Mehrere Sprachen | gestrichen  | Zeit |
| F16 | Save Files | gestrichen  | Risiko, Zeit |
| F17 | Hintergrundnarration | gestrichen  | Pillar |
| F18 | Controllerunterstützung | gestrichen  | Risiko, Zeit |
| F19 | Touchpad-Unterstützung | gestrichen  | Risiko, Zeit |
| F20 | Nahrungsleiste | gestrichen  | Risiko |
