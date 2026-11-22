# V5 · Prototyp-Protokoll

**Projekt:** Der Einsame Astronaut  
**Übung:** 5 · Core-Loop-Prototyp und Keep/Pivot/Kill

> Macht den Zweck und das Ergebnis eines Prototyps explizit.

## Frage

Funktionieren die grundlegenden Point-and-Click-Mechaniken (Raumwechsel, Objektinteraktion, Informationstexte, Inventarsystem sowie das Sammeln, Kombinieren und Anwenden von Gegenständen) zusammen, sodass der Core Loop vom Entdecken eines Problems bis zu dessen Lösung vollständig durchspielbar ist?

## Hypothese

Die grundlegenden Point-and-Click-Mechaniken lassen sich in einem funktionsfähigen Prototyp umsetzen und ermöglichen es dem Spieler, durch Erkundung, das Sammeln und Kombinieren von Gegenständen sowie die Interaktion mit der Umgebung ein technisches Rätsel zu lösen und dadurch den nächsten Abschnitt freizuschalten.

## Timebox

**Geplant:** 8 h  
**Tatsächlich:** 12 h

## Umfang

**Enthalten:** Inventar, Raumwechsel sowie Interaktionen, die Informationstexte anzeigen, Gegenstände ins Inventar aufnehmen, Gegenstände mit der Umgebung verwenden oder Gegenstände miteinander kombinieren.  
**Bewusst nicht enthalten:** Startmenü, Speicherfunktion, Dialogsystem.

## Beobachtungen Test 1–3

*Nur beobachtbares Verhalten dokumentieren, keine Interpretation.*

**Test 1:** Die Testperson meldete, dass das nächste Ziel nicht immer klar war. Sie empfand die Raumwechsel als schwer erkennbar, da beide Räume denselben Hintergrund verwendeten. Die Inventarbedienung bereitete Schwierigkeiten; als Ursache wurde die Abweichung zwischen der sichtbaren Cursorgröße und dessen Trefferbereich genannt.

**Test 2:** Die Testperson reagierte irritiert auf ein Objekt, dessen Interaktion lediglich eine Animation auslöste. Die übrigen Abläufe wurden von ihr als verständlich beschrieben.

**Test 3:** Bei der Inventarinteraktion traten Schwierigkeiten auf. Die Testperson gab an, dass nicht ausreichend erkennbar war, welche Gegenstände miteinander kombiniert werden können.

## Auswertung

Die Hypothese wurde teilweise bestätigt. Die grundlegenden Point-and-Click-Mechaniken konnten technisch umgesetzt und in einem Prototyp miteinander verbunden werden. Allerdings zeigten die Hallway-Tests, dass einige Mechaniken für die Spielenden noch nicht ausreichend intuitiv sind.

Insbesondere die Inventarbedienung bereitete mehreren Testpersonen Schwierigkeiten. Zudem waren Raumwechsel und mögliche Itemkombinationen nicht immer eindeutig erkennbar. Auch fehlende Rückmeldungen bei Interaktionen führten zu Verwirrung.

Die technische Grundlage ist somit vorhanden, die Benutzerfreundlichkeit muss jedoch verbessert werden.
## Entscheidung

**Keep – Grundlegende Mechaniken beibehalten und verbessern.**

Ich entscheide mich dafür, die bestehenden Point-and-Click-Mechaniken beizubehalten, da ihre technische Umsetzung grundsätzlich funktioniert und die Tests keine grundlegenden Probleme mit dem Spielkonzept aufgezeigt haben.

Die beobachteten Schwierigkeiten betreffen hauptsächlich die Bedienbarkeit und das visuelle Feedback. Diese Probleme lassen sich voraussichtlich durch gezielte Anpassungen beheben, ohne die bestehenden Systeme vollständig neu entwickeln zu müssen.

Der Prototyp bildet daher weiterhin die technische Grundlage für die weitere Entwicklung.

## Übernahme

**Übernommene Systeme:**
- Point-and-Click-Navigation und Raumwechsel
- Objektinteraktionen und Informationstexte
- Inventarsystem mit Itemaufnahme und Itemkombination
- Anwendung von Inventargegenständen auf Umgebungsobjekte

**Erkenntnisse und geplante Anpassungen:**
- Den Trefferbereich des Mauszeigers an dessen sichtbare Größe anpassen.
- Raumwechsel durch unterschiedliche Hintergründe deutlicher erkennbar machen.
- Die Inventarbedienung vereinfachen und mögliche Itemkombinationen verständlicher kommunizieren.
- Bei Objektinteraktionen eindeutigeres Feedback ergänzen.

**Codeübernahme:**

Die bestehenden Gameplay-Systeme werden zunächst weiterverwendet und gezielt überarbeitet. Ein vollständiges Verwerfen einzelner Systeme ist aufgrund der bisherigen Testergebnisse nicht vorgesehen.
