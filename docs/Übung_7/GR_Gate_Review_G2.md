# GR · Gate-Review

*Projekt: Der Einsame Astronaut · Kurs: Software Engineering and Game Technical Direction*

| Feld | Eintrag |
|---|---|
| **Gate, Datum** | **G2 · Greenlight**, 22.11.2026 (Dokumentationsstand; tatsächliches Review-Datum bei Durchführung eintragen) |
| **Build / Git-Tag** | **Build:** 0.1.0, Windows-Export aus frischem Klon nach bisherigen Angaben erfolgreich. **Git-Tag:** `g2-greenlight` – gesetzt. |
| **Kriterien-Check** | **Standard- und eigene Kriterien aus V2:** siehe unmittelbar folgenden Check; ✓ = nachgewiesen erfüllt, ✗ = noch nicht vollständig nachgewiesen bzw. offen. |

### Kriterien-Check (V2, G2)

| Kriterium | ✓/✗ | Begründung / Beleg |
|---|:---:|---|
| Funktionsfähiger Core-Loop-Prototyp | ✓ | Raumwechsel, Interaktionen, Textanzeige, Inventar, Itemkombination und Gegenstandsanwendung im Prototyp umgesetzt. `V5_Prototyp-Protokoll_Abgeschlossen.md` |
| Mindestens ein spielbarer Raum mit Hotspots, Itemaufnahme, Itemverwendung und Raumwechsel/Fortschritt | ✓ | Funktionen im vorhandenen Prototyp vorhanden und getestet; siehe V5-Protokoll. |
| Validierung in mindestens drei Testdurchläufen **ohne blockierenden Fehler** | ✓ | Der Core Loop wurde in den drei Hallway-Tests erfolgreich durchlaufen. Dabei wurden Verbesserungsmöglichkeiten bei Inventar, Cursor, Raumwechsel und Interaktionsfeedback festgestellt. `V5_Prototyp-Protokoll_Abgeschlossen.md` |
| Technical Design Document mit Systemen und Schnittstellen | ✓ | Architektur, UML, Datenmodell, Signale, technische Entscheidungen und Schnittstellen dokumentiert. `TDD_Der_Einsame_Astronaut_V6a.md`, ADR-0001/0002 |
| Vertical-Slice-Plan vorhanden | ✓ | Rätselkette zur Nahrungsversorgung (Kartoffeln / Zeitdilatationsrechner) und Qualitätsziele dokumentiert. `Vertical_Slice_Plan_Der_Einsame_Astronaut.md` |
| Vertical-Slice-Plan mit Produktionsplanung abgestimmt | ✗ | Plan nennt „Stagegate 2“, der tatsächliche Produktionskurs **GPM2 Game Direction & Storytelling** verlangt Fertigstellung erst zu **Stagegate G5**. Terminabgleich offen. |
| Backlog und Risikoregister aktualisiert; Abgleich mit aktuellem GDD | ✗ | Backlog und Risiken wurden erweitert (`Projekt-Tracker_Uebungen_5_6_7_Aktualisiert.xlsx`); vollständige Übernahme des neuen Zeitdilatationsrätsels in Stories und Abgleich mit dem GDD noch zu prüfen. |
| Git LFS, `.gitattributes` und Asset-Pipeline | ✗ | LFS-Test erfolgreich, `PIPELINE_Der_Einsame_Astronaut.md` vorhanden; vollständige Regeln für alle Asset-Ordner und Fremd-Asset-Rechte nicht abschließend verifiziert. |
| Reproduzierbarer Build 0.1.0 | ✓ | Windows-Build und erneuter Export nach frischem Klon laut bisherigem Arbeitsnachweis erfolgreich; tatsächlichen Abgabedateipfad ergänzen. |
| Definition of Done abgelegt | ✓ | `Definition_of_Done_Der_Einsame_Astronaut.md` erstellt; Ablage/Commit im Repository bitte prüfen. |
| G3–G5 im Semesterplan geschärft | ✓ | `ÜB2_Semesterplan_G3-G5_Aktualisiert.md`, einschließlich Hinweis zu abweichenden Stagegates im Produktionskurs. |
| Git-Tag `g2-greenlight` gesetzt | ✓ | Der Projektstand wurde mit `g2-greenlight` markiert (laut aktuellem Projektstand). |

| Hut | Prüffrage | ✓/✗ | Begründung / Beleg |
|---|---|:---:|---|
| **Game Designer** | Erzeugt der Stand das Erlebnis der Design Pillars? | ✗ | Die Core-Mechaniken unterstützen „Überleben durch Erkundung“, aber Kommunikation, Zeitdruck und Zeitdilatation sind im Prototyp noch nicht als Spielerlebnis validiert. |
| **Technical Director** | Tragen Architektur, Build und Budgets den nächsten Abschnitt? | ✓ | Architektur (TDD/ADRs) und Windows-Export 0.1.0 sind vorhanden; die Performance-Ziele von 30 FPS, maximal 512 MB RAM und maximal 200 MB Build-Größe werden im aktuellen Build eingehalten. |
| **QA** | Sind die Qualitätskriterien belegt erfüllt? | ✓ | Der Core Loop wurde in drei Hallway-Tests erfolgreich durchlaufen. Die festgestellten Verständlichkeits- und Bedienungsprobleme wurden dokumentiert und als Verbesserungsaufgaben übernommen; sie verhinderten den Abschluss nicht. |

| Feld | Eintrag |
|---|---|
| **GDD-Abgleich** | **Teilweise erfolgt.** Backlog und Risikoregister wurden anhand der Übungen 5–7 aktualisiert. Das neue Kartoffel-/Zeitdilatationsrätsel soll als eigene Story bzw. technische Aufgabe übernommen werden. Die Cut List ist zu präzisieren: F11 (umfassende Zeit-Gameplay-Mechaniken) bleibt gestrichen; ein **begrenztes, datenbasiertes Zeitdilatationsrätsel** ist neu vorgesehen. Diese Abgrenzung und der G5-Termin aus *GPM2 Game Direction & Storytelling* müssen an das GDD-Modul gemeldet bzw. dort abgestimmt werden. |
| **Producer-Entscheidung** | **Vorläufiger Vorschlag: anpassen**. **Begründung:** Grundsysteme und Build rechtfertigen die Weiterentwicklung, jedoch bestehen weiterhin Bedienungsprobleme und offene Punkte beim GDD-/Gate-Abgleich. Ein unbedingtes „weiter“ ist derzeit nicht hinreichend nachgewiesen. **Formelle Entscheidung, Name/Datum:** ausstehend. |
| **Maßnahmen** | **Backlog:** Cursor-Trefferbereich, Inventarbedienung, deutliche Raumwechsel, Itemkombinationshinweise und eindeutiges Interaktionsfeedback priorisieren; Kartoffel-/Zeitdilatationsrätsel mit Akzeptanzkriterien aufnehmen. **Cut List/GDD:** F11-Abgrenzung und Termin Stagegate G5 des Produktionskurses abstimmen. **Risikoregister:** Usability-, Scope-, Berechnungs- und Asset-Lizenzrisiken überprüfen; für Zeitdilatationsrechner kleinen Spike vorsehen. **Nachweise:** Testergebnisse und eingehaltene Performance-Budgets als Belege archivieren und abschließende Producer-Entscheidung dokumentieren. |


