# V4 · Anforderungsreview und Traceability (GDD → Backlog)

*Prüft das GDD aus dem GDD-Modul als Anforderungsquelle. Die Befunde dienen zugleich als Feedback an das GDD-Modul. Bewertet wird die Ableitung, nicht das GDD.*

| Feld | Eintrag |
|---|---|
| **Verwendeter GDD-Stand** | *Der Einsame Astronaut* – vorläufiger Stand: `Fabian_Schmidt-Lademann_Der Einsame_Astronaut_GDD (2).pdf` (im Dokument als **High Level Concept** bezeichnet); keine eindeutige Versionsnummer ausgewiesen. |
| **Befundarten** | **mehrdeutig · nicht prüfbar · widersprüchlich · fehlt** |

## Prüfliste zu möglichen fehlenden Anforderungen

- [x] Zielplattform(en) und Eingabegeräte – PC genannt; Eingabegeräte im GDD nicht vollständig spezifiziert.
- [x] Performance-Erwartung (Bildrate, Zielhardware) – **Befund A01**
- [x] Speichern/Laden, Pause, Beenden – **Befund A04** (Speichern/Zustände); Pause/Beenden gesondert offen.
- [ ] Screen-Flow (Menüs, Einstellungen) – noch nicht gesondert bewertet.
- [x] Umfang: Spielzeit, Anzahl Level/Gegner/Items – vorläufiger Umfang von ca. 10 Minuten aus dem Projektkonzept; Detailzahlen noch offen.
- [x] Barrierefreiheit (Untertitel, Steuerung, Farben) – **Befund A03** (Lesbarkeit, Dialoge, Maussteuerung).
- [ ] Sprachen/Lokalisierung – noch nicht gesondert bewertet.
- [ ] Audio (Musik, Effekte, Sprachausgabe) – noch nicht gesondert bewertet.
- [ ] Herkunft der Assets (selbst, andere Module, Asset Store) und Lizenzen – noch nicht gesondert bewertet.

*Hinweis: Die Häkchen bedeuten „im Review betrachtet“, nicht „Anforderung erfüllt“. Nicht markierte Punkte wurden in den acht gewählten Befunden nicht vertieft.*

## Anforderungsreview: Befunde und Traceability

| GDD-Abschnitt / Aussage | Befund | Klärung / Vorschlag | Story-ID(s) |
|---|---|---|---|
| **A01 – Performance (S. 5)** | **Fehlt (NFR):** Für die PC-Version sind keine messbaren Anforderungen an Bildrate, Stabilität und Zielhardware definiert. | Eine Zielbildrate von **60 FPS** auf einem festgelegten Referenz-PC definieren und entsprechende Performance-Tests vorsehen. | *US-13* |
| **A02 – Bildschirmauflösung (S. 17)** | **Fehlt (NFR):** Für die Pixel-Art-Darstellung sind weder eine interne Auflösung noch das Skalierungsverhalten festgelegt. | Eine interne Spielauflösung, unterstützte Fenstergrößen sowie eine geeignete Pixel-Skalierung festlegen. | *US-14* |
| **A03 – Bedienbarkeit und Barrierefreiheit (S. 13, 17)** | **Fehlt (NFR):** Es fehlen konkrete Anforderungen an Textlesbarkeit, Dialoggeschwindigkeit und die Zugänglichkeit der Maussteuerung. | Eine Mindestschriftgröße festlegen, manuell weiterschaltbare Dialoge vorsehen und eine ausreichende Lesbarkeit sicherstellen. | *US-01, US-05, US-12, US-15* |
| **A04 – Speichern und Zustandsverwaltung (S. 5, 15–16)** | **Fehlt (NFR):** Es ist nicht festgelegt, ob Spielstände gespeichert werden können und wie Rätselzustände bei Raumwechseln erhalten bleiben. | Für die **zehnminütige Spielversion** auf ein dauerhaftes Speichersystem verzichten. Rätsel- und Fortschrittszustände müssen jedoch während einer Spielsitzung erhalten bleiben. | *US-08, US-10, US-16* |
| **A05 – Ressourcenknappheit (S. 11–12)** | **Mehrdeutig:** Es ist unklar, wie die beschriebene Ressourcenknappheit spielmechanisch umgesetzt werden soll. Klassische Point-and-Click-Adventures verfügen üblicherweise nicht über ein Ressourcenmanagement wie Survival-Spiele. | Resssourcenknappheit hauptsächlich **narrativ vermitteln**, statt ein eigenständiges Ressourcenmanagementsystem zu implementieren. | *US-02, US-03, US-04* |
| **A06 – Überleben (S. 3, 11–12)** | **Mehrdeutig:** Es geht nicht eindeutig hervor, ob Spielende scheitern beziehungsweise sterben können und durch welche Mechaniken der Überlebensaspekt vermittelt werden soll. | Den Überlebensdruck vor allem **narrativ vermitteln**. Ein eigenständiges Überlebens- oder Game-Over-System wäre dadurch nicht erforderlich. | *US-06* |
| **A07 – Zeitdilatation (S. 3, 7, 9, 13)** | **Mehrdeutig:** Die konkrete Umsetzung der Zeitdilatation ist nicht eindeutig definiert. Offen bleibt, ob sie rein narrativ vermittelt, über interne Zeitverläufe simuliert oder als aktive Spielmechanik verwendet wird. | Zeitdilatation durch **festgelegte Rätsel mit Bezug zu den Zeitzonen** darstellen, statt mehrere unabhängige Zeitverläufe zu simulieren. So bleibt die lineare Struktur eines klassischen Point-and-Click-Adventures erhalten. | *US-11* |
| **A08 – Entscheidung zwischen Menschheit und Überleben (S. 4, 10)** | **Widersprüchlich:** Das GDD beschreibt eine Entscheidung zwischen dem eigenen Überleben und der Zukunft der Menschheit. Gleichzeitig deutet der bisherige Spielverlauf lediglich ein Ende an, bei dem sowohl die Dyson-Sphäre gerettet wird als auch der Astronaut entkommt. | **Mehrere mögliche Enden** vorsehen, um den Entscheidungskonflikt abzubilden. Beispielsweise könnte der Astronaut entkommen, ohne die Dyson-Sphäre retten zu können. | *US-07, US-09, US-10* |

## 4.4 · Eine „Feel“-Anforderung operationalisieren

**Gewählte Feel-Anforderung:** Selbstwirksamkeit – *Pillar 1: Überleben durch Erkundung* (GDD, Design Pillars, S. 11–12).

Die Spielenden sollen das Gefühl haben, technische Probleme durch Erkundung, logisches Denken und Improvisation **eigenständig lösen** zu können. Da dieses Erleben subjektiv ist, wird es durch eine Kombination aus beobachtbarem Verhalten und einer kurzen Befragung nach dem Playtest überprüft.

| ID | Überprüfbares Akzeptanzkriterium | Überprüfung |
|---|---|---|
| **F01** | Mindestens **3 von 4 Testpersonen** schließen ein vorgesehenes Reparaturrätsel **ohne externe Hilfestellung** ab. | Beobachtung während des Playtests. |
| **F02** | Mindestens **3 von 4 Testpersonen** können anschließend erklären, welche Hinweise und Gegenstände für die Lösung entscheidend waren. | Kurze Nachfrage nach dem Rätsel. |
| **F03** | Mindestens **3 von 4 Testpersonen** bewerten die Aussage „Ich hatte das Gefühl, das Problem durch meine eigenen Überlegungen gelöst zu haben“ mit **mindestens 4 von 5 Punkten**. | Fünfstufige Zustimmungsskala (1 = stimme überhaupt nicht zu; 5 = stimme vollständig zu). |
| **F04** | Bei **allen 4 Testpersonen** sind alle für die vorgesehene Lösung benötigten Hinweise und Gegenstände bereits vor Abschluss des Rätsels zugänglich. | Prüfung des Spielablaufs und Beobachtung. |

**Validierung:** Geplanter, beobachteter Playtest mit vier externen Testpersonen und anschließender Kurzbefragung. Die Akzeptanzkriterien sind vor dem Test festgelegt; Ergebnisse liegen noch nicht vor.

**Bezug zum Product Backlog:** US-02 (Objektinteraktion), US-03 (Gegenstände aufnehmen), US-05 (Item-Kombinationen), US-06 (Reparaturrätsel) und US-07 (Logikrätsel).

## Änderungsvorschläge an das GDD

| Bezug | Änderungsvorschlag / offener Klärungsbedarf | Begründung |
|---|---|---|
| **A01–A04** | Messbare Anforderungen zu Performance, Bildschirmauflösung, Bedienbarkeit und Zustandsverwaltung ergänzen. | Für Implementierung und Tests fehlen überprüfbare technische Rahmenbedingungen. |
| **A05** | Ressourcenknappheit als vorwiegend narratives Gestaltungsmittel konkretisieren. | Vermeidet ein zusätzliches Ressourcenmanagementsystem im knappen Projektumfang. |
| **A06** | Festlegen, ob Scheitern/Game Over vorgesehen ist oder Überlebensgefahr erzählerisch vermittelt wird. | Verhindert widersprüchliche Erwartungen an Spielregeln und Spielausgang. |
| **A07** | Verbindlich klären, ob Zeitzonen nur erzählerisch vorkommen oder in festen Rätseln eine Rolle spielen. | Der Vorschlag zu zeitzonenbezogenen Rätseln muss mit der bisherigen Festlegung „Zeitdilatation nur narrativ“ abgeglichen werden. Eine dynamische Zeitsimulation ist nicht vorgesehen. |
| **A08** | Mehrere Enden als Änderungsvorschlag prüfen und mit der Cut List aus G1 abgleichen. | Mehrere Enden wurden in Übung 3 gestrichen; eine Wiedereinführung würde den Scope verändern. |

*Alle Vorschläge stehen unter dem Vorbehalt der Abstimmung mit dem Game Designer. Die im GDD vorhandenen Aussagen werden nicht stillschweigend als geändert behandelt.*
