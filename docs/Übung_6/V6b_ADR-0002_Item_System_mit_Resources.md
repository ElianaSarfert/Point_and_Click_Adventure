# ADR-0002: Verwendung von Resources für das Item-System

**Status:** Akzeptiert

## Kontext

Für das Point-and-Click-Adventure *Der Einsame Astronaut* benötige ich ein Item-System, mit dem Gegenstände eindeutig identifiziert, im Inventar angezeigt und bei Interaktionen mit der Spielumgebung verwendet werden können. Die Item-Eigenschaften könnte ich direkt in einzelnen Skripten hinterlegen oder unabhängig davon als Datenobjekte verwalten. Dabei ist mir wichtig, neue Gegenstände ohne zusätzliche Skripte anlegen und bestehende Daten an mehreren Stellen verwenden zu können.

## Entscheidung

Ich verwende **Godot-Resources** für die Definition der Gegenstände. Dafür habe ich die Klasse `Item` erstellt, die von `Resource` erbt und die Eigenschaften `item_id`, `item_name` und `item_texture` enthält. Über exportierte Variablen kann ich diese Eigenschaften im Godot-Inspector festlegen. Die Inventarverwaltung und die Logik für Item-Interaktionen bleiben in separaten Skripten.

## Konsequenzen

**Positiv:** Gegenstandsdaten sind einheitlich strukturiert, wiederverwendbar und lassen sich ohne ein eigenes Skript pro Item anlegen. Die Trennung zwischen Item-Daten und Interaktionslogik erleichtert spätere Erweiterungen.

**Negativ:** Resources bilden zunächst nur die Daten ab. Das Aufheben, Kombinieren und Anwenden von Gegenständen muss ich separat implementieren.

**Neue Risiken:** Werden dieselben Resources an mehreren Stellen referenziert und zur Laufzeit verändert, können unbeabsichtigte Änderungen an gemeinsam genutzten Daten entstehen. Deshalb sollte ich Item-Definitionen möglichst unverändert lassen und veränderliche Zustände getrennt verwalten.
