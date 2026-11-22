# ADR-0001: Wahl der Game Engine

**Status:** Akzeptiert

## Kontext

Für die Entwicklung des 2D-Point-and-Click-Adventures *Der Einsame Astronaut* benötige ich eine Engine, die eine einfache Bedienbarkeit mit einem umfangreichen und flexiblen Funktionsumfang verbindet. Aufgrund des begrenzten Zeitbudgets möchte ich vorhandene Programmierkenntnisse nutzen und die Einarbeitungszeit möglichst gering halten. Als Alternativen betrachte ich Godot und Unity.

## Entscheidung

Ich verwende **Godot 4 mit GDScript**. Ausschlaggebend sind meine bereits vorhandenen Vorkenntnisse mit Godot sowie die aus meiner Sicht einfachere und zugänglichere Bedienung im Vergleich zu Unity. Gleichzeitig bietet Godot einen für die Anforderungen meines Projekts vergleichbar umfangreichen Funktionsumfang.

## Konsequenzen

**Positiv:** Ich kann auf vorhandene Kenntnisse zurückgreifen, die Einarbeitungszeit reduzieren und Prototypen schnell entwickeln. Godot bietet mir zudem viel Flexibilität bei der Implementierung eigener Systeme.

**Negativ:** Einige Funktionen muss ich selbst implementieren, für die bei Unity bereits etablierte Lösungen oder Erweiterungen verfügbar sein können.

**Neue Risiken:** Die Eigenentwicklung und Integration mehrerer Gameplay-Systeme kann zusätzlichen Entwicklungs- und Wartungsaufwand verursachen.
