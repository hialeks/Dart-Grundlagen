void main() {
  print("Dart - Grundlagen / Version 0.05");
  print(""); // Visuelle Trennung

/*
Tastatur Sonderzeichen

opt + 5 -> [
opt + 6 -> ]
opt + 7 -> | 
opt + 8 -> {
opt + 9 -> }
Shift + 4 -> $
Shift + 5 -> %
Shift + 6 -> &
Shift + 7 -> / 
Shift + opt + 7 -> \
opt + n -> ~

Wichtige Tastenkombinationen

cmd + s => Dokument speichern
cmd + a => Alles wählen
cmd + c => Kopieren
cmd + v => Einfügen
cmd + Shift + 7 => Der mit dem Cursor markierte Text wird in einen Kommentar umgewandelt
*/

// Kommentar
/* Block Kommentar */

// Variablen und Datentypen
  print("-- Variablen und Datentypen --");

// Variablen deklarieren und initialisieren
  int zahl1 = 42;
  double kommazahl = 3.14;
  String name = "Dart";
  bool isLampOn = true;
  dynamic ups = "Ups";
  // Eine Variable vom Typ dynamic kann Werte verschiedener Datentypen enthalten
  print(ups);
  ups = 10;
  var hi = "10";

  /* var ist eine dynamic Variable mit Verbot, den Wert der Variable zu ändern,
  indem eine Variable vom Typ var erstellt wird */

// Variablen ausgeben
  print("Die Zahl ist ${zahl1}");
  print("Die Programmierschprache ist ${name}");
  print("Die Kommazahl ist ${kommazahl}");
  print("Die Lampe ist an? ${isLampOn}");
  print(ups);

// Variable ändern
  zahl1 = 43;
  kommazahl = 3.55;
  name = "Python";
  isLampOn = false;

// Geänderte Variablen ausgeben
  print("---"); // Visuelle Trennung
  print("Geänderte Variablen ausgeben");
  print("Die Zahl ist: ${zahl1}");
  print("Die Programmiersprache ist: ${name}");
  print("Die Kommazahl ist: ${kommazahl}");
  print("Die Lampe ist an? ${isLampOn}");

// Beispiel für Operationen mit Variablen
  int z;
  int x = 20;
  int y = 30;
  z = x + y;

  print("x + y = ${z}"); // z.B.
  print("Der Datentyp von z ist: ${z.runtimeType}"); // Bonus Kommand

// Arithmetische Operatoren:
  int a = 8;
  int b = 5;
  print("---"); // Visuelle Trennung
  print("Arithmetische Operatoren");
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("a / b = ${a / b}");
  print("a ~/ b = ${a ~/ b}"); // Division - Wie oft b in a angewendet wird
  print("a % b = ${a % b}"); // Modulo - Rest nach der Teilung

// Inkrement
  int alter = 10;

  // Post-Inkrement
  print("---"); // Visuelle Trennung
  print("Inkrement");
  print("Post-Inkrement: ${alter++}"); // =10
  print("Nach Post-Inkrement: ${alter}"); // =11

  // Pre-Inkrement
  print("Pre-Inkrement: ${++alter}"); // =12

  // Beispiel
  int a1 = 2;
  int a2 = a1++;
  int a3 = ++a1;

  print("---"); // Visuelle Trennung
  print("a1: ${a1}"); // = 4
  print("a2: ${a2}"); // = 2
  print("a3: ${a3}"); // = 4
  print("++a3: ${++a3}"); // = 5
  print("a2++: ${a2++}"); // = 2

// Vergleichsoperatoren
  int gewicht1 = 7;
  int gewicht2 = 9;

  print("---"); // Visuelle Trennung
  print("Vergleichsoperatoren");
  print("gewicht1 == gewicht2: ${gewicht1 == gewicht2}"); // false
  print("gewicht1 != gewicht2: ${gewicht1 != gewicht2}"); // true
  print("gewicht1 > gewicht2: ${gewicht1 > gewicht2}"); // false
  print("gewicht1 < gewicht2: ${gewicht1 < gewicht2}"); // true
  print("gewicht1 >= gewicht2: ${gewicht1 >= gewicht2}"); // false
  print("gewicht1 <= gewicht2: ${gewicht1 <= gewicht2}"); // true

// Logische Operatoren
  bool tag = true;
  bool nacht = false;

  print("---"); // Visuelle Trennung
  print("Logische Operatoren");
  print("tag && nacht: ${tag && nacht}"); // Logisches UND &&
  print("tag || nacht: ${tag || nacht}"); // Logisches ODER ||
  print("!(tag || nacht): ${!(tag || nacht)}"); // Logisches Negationsoperator

// Komplexe Datentypen
  // Listen
  print("-- Listen --");

  List list = [1, true, 2, 3.14, "vier", "Apfel"];

  print("Liste: ${list}"); // Zeigt die gesamte Liste an
  print("Element an Index 5: ${list[5]}"); // Zeigt ein ausgewähltes Element an

  // Listen-Manipulation
  print("---"); // Visuelle Trennung
  print("Listen-Manipulation");
  list[5] = "Banane"; // Änderung des Elementnamens von "Apfel"
  print("Geändertes Element an Index 5: ${list[5]}");
  list.add("Kiwi"); // Ein Element hinzufügen
  print("Liste nach Hinzufügen eines Elements: ${list}");
  list.remove("vier"); // Löschen eines Elements
  print("Liste nach Löschen eines Elements: ${list}");
  print("Länge der Liste: ${list.length}"); // Anzahl der Elemente in der Liste

  List listA = ["sieben", !false]; // Neue Liste
  List listB = list + listA;
  print("Verbundene Listen: ${listB}");

  // Listen mit bestimmten Typen
  List<int> listC = [1, 2, 3, 4, 5, 11, 1717];
  List<String> listD = ["Hallo", "Dart"];
  List<bool> listE = [true, false, !false, !true];

  print("Liste vom Typ int: ${listC}");
  print("Liste vom Typ String: ${listD}");
  print("Liste vom Typ bool: ${listE}");

  // Maps
  print("-- Maps --");

  Map preiseA = {"Orange": 0.59, "Tomate": 0.29, "Kartoffeln": 1.79};
  print("Map preiseA: ${preiseA}");

  Map preise = {
    "Apfel": 0.99,
    "Banane": 0.49,
    "Orange": 0.79,
    "Avocado": 1.99,
  };
  print("Map preise: ${preise}");

  // Aktionen mit Maps
  print("---"); // Visuelle Trennung
  print("Preis von Apfel: ${preise["Apfel"]}");
  double apfelPreis = preise["Apfel"];
  print("Apfelpreis: ${apfelPreis}");

  // Änderung des Wertes der Elemente
  preise["Banane"] = 2.49;
  double bananePreis = preise["Banane"];
  print("Die neue Preise von Banane ist $bananePreis Euro.");

  // If-Else
  print("-- If-Else --");

  // Die Grundstruktur sieht wie folgt aus:
  String wetter = "sonnig"; // Wenn wir "sonnig" ändern, wird }else{ aktiviert

  if (wetter == "sonnig") {
    print("Es ist sonnig!");
  } else {
    print("Fernsehr gucken.");
  }

  print("---"); // Visuelle Trennung

  // Variante 2 - Prüfungen in der Schule
  int note = 97; // Hier kann man Noten ändern

  if (note >= 90) {
    print("Sehr gut!");
  } else if (note >= 80) {
    print("Gut");
  } else if (note >= 70) {
    print("Befriedigend");
  } else if (note >= 60) {
    print("Ausreichend");
  } else {
    print("Mangelhaft");
  }

  // Variante 3 - Prüfungen in der Schule mit logischen Operatoren
  if (note >= 90 && note <= 100) {
    print("Sehr gut!");
  } else if (note >= 80 && note < 90) {
    print("Gut");
  } else if (note >= 70 && note < 80) {
    print("Befriedigend");
  } else if (note >= 60 && note < 70) {
    print("Ausreichend");
  } else {
    print("Mangelhaft");
  }

  // Variante 4 - Wetter
  bool kaltesWetter = true;
  bool guteVerkehrslage = false;

  if (guteVerkehrslage && !kaltesWetter) {
    print("Ich fahre zur Arbeit");
  } else {
    print("Homeoffice!");

// Schleifen

    // For-Schleife
    print("-- For-Schleife --");
    for (int i = 0; i < 5; i++) {
      print("Zähler: ${i}");
    }

    // For-in-Schleife
    print("-- For-in-Schleife --");
    List<int> zahlen = [1, 2, 3, 4, 5];
    for (int zahl in zahlen) {
      print("Zahl: ${zahl}");
    }

    // While-Schleife
    print("-- While-Schleife --");
    int counter = 0;
    while (counter < 5) {
      print("Counter: ${counter}");
      counter++;
    }

// Funktionen
    print("-- Funktionen --");
    int addiere(int a, int b) {
      return a + b;
    }

    print("3 + 5 = ${addiere(3, 5)}");

    // Anonyme Funktionen
    print("-- Anonyme Funktionen --");
    var quadrat = (int num) => num * num;
    print("Das Quadrat von 4 ist ${quadrat(4)}");

// Klassen

    print("-- Klassen --");

    /*

  class Person {
    String name;
    int alter;

    Person(this.name, this.alter);

    void vorstellen() {
      print("Hallo, ich heiße ${name} und bin ${alter} Jahre alt.");
    }
  }

  Person person = Person("Anna", 25);
  person.vorstellen();

 ///Objektorientierte Programmierung

  print("-- Objektorientierte Programmierung --");

  class Fahrzeug {
    String marke;
    int baujahr;

    Fahrzeug(this.marke, this.baujahr);

    void anzeigen() {
      print("Fahrzeug: Marke ${marke}, Baujahr ${baujahr}");
    }
  }

  Fahrzeug auto = Fahrzeug("BMW", 2019);
  auto.anzeigen();
}


*/
  }
}
