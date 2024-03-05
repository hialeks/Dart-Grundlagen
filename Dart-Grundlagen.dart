/* Kurzbeschreibung nach:
YouTube Video - Einstieg in Dart
https://youtu.be/dKFPDf7QDGs?si=WJDCR4GPBoDqmLoU
Der Link wurde von Thomas M. im Slack-Kanal geteilt.
*/

// Version 0.04

void main() {
  print("Dart - Grundlagen / Version 0.03");
  print(""); //Visuelle Trennung

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
  // Deklaration: int(Datentyp) zahl1(Bezeihner)
  // Initialisierung:  =(Zuweisungsoperator) 42(Wert)

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

  /* Es sollte kein Datentyp angegeben werden, der zu deklarieren ist,
  wenn dies bereits oben geschehen ist. */

  zahl1 = 43;
  kommazahl = 3.55;
  name = "Python";
  isLampOn = false;

// Geanderte Variablen ausgeben
  print("---"); //Visuelle Trennung
  print("Geanderte Variablen ausgeben");
  print("Die Zahl ist: ${zahl1}");
  print("Die Programmiersprache ist: ${name}");
  print("Die Kommazahl ist: ${kommazahl}");
  print("Die Lampe ist an? ${isLampOn}");

// Beispiel für Operationen mit Variablen
  int z;
  int x = 20;
  int y = 30;
  z = x + y;

  print(z);
  print("x + y = ${z}"); // z.B.
  print("Operationen mit Variablen");
  print(z.runtimeType); //Bonus Kommand
  print("Der Datentyp von z ist: ${z.runtimeType}"); //Bonus Kommand

// Aritmetische Operatoren:
  int a = 8;
  int b = 5;
  print("---"); //Visuelle Trennung
  print("Aritmetische Operatoren");
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b); // Division - Wie oft b in a angewendet wird
  print(a % b); // Modulo - Rest nach der Teilung

  /* 
    print(a/b); In diesem Fall wandelt der Dart-Compiler 
    die int-Variable automatisch in eine double-Variable um.
    */

  // Inkrement

  /* 
    Das Inkrement ist ein Operator, der eine Variable um eins erhöht
    Es wird mit ++ gekennzeichnet
    */

  int alter = 10;

  // Post Inkrement
  print("---"); //Visuelle Trennung
  print("Inkrement");
  print(alter++); // =10
  //Plus eins wird nach dem Alter addiert,
  //so dass das Programm nur das Alter berechnet

  // Pre Inkrement

  print(++alter); // =12 weil es rechnet auch alter++ von oben 11+1
  // Plus eins wird vor dem Alter addiert,
  //so dass das Programm das Alter berechnet

  // Beispiel
  int a1 = 2;
  int a2 = a1++;
  int a3 = ++a1;

  print("---"); //Visuelle Trennung
  print(a1); // = 4
  print(a2); // = 2
  print(a3); // = 4
  print(++a3); // = 5
  print(a2++); // = 2

// Vergleichsoperatoren

  int gewicht1 = 7;
  int gewicht2 = 9;

  print("---"); //Visuelle Trennung
  print("Vergleichsoperatoren");
  print(gewicht1 == gewicht2); // false
  print(gewicht1 != gewicht2); // true
  print(gewicht1 > gewicht2); // false
  print(gewicht1 < gewicht2); // true
  print(gewicht1 >= gewicht2); // false
  print(gewicht1 <= gewicht2); // true

// Logische Operatoren

  bool tag = true;
  bool nacht = false;

  print("---"); //Visuelle Trennung
  print("Logische Operatoren");
  print(tag && nacht); // Logisches UND &&
  print(tag || nacht); // Logisches ODER ||
  print(!(tag || nacht)); // Logisches Negationsoperator

// Komplexe Datentypen

  // Listen
  print("-- Listen --");

  List list = [1, true, 2, 3.14, "vier", "Apfel"];

  print("Listen");
  print(list); // Zeigt die gesamte Liste an
  print(list[5]); // Zeigt einen ausgewählten Element an

  // Listen Manipulation

  print("---"); //Visuelle Trennung
  print("Listen Manipulation");
  list[5] = "Banane"; // Änderung des Elementnamens von "Apfel"
  print(list[5]); // Überprüfung des neuen Elementnamens
  list.add("Kiwi"); //Ein Element hinzufügen
  print(list); // Überprüfung der Änderung
  print(list[3].runtimeType); // Überprüfung Datentyp
  list.remove("vier"); // Löschen eines Elements
  print(list); // Überprüfung der Änderung
  print(list.length); // Zeigt die Anzahl der Elemente in der Liste an
  var fest = list[1];
  /* Neue Variable mit Verbot, den Wert der Variable zu ändern, 
  indem eine Variable vom Typ var erstellt wird
  */
  List listA = ["sieben", !false]; // Neue Liste
  List listB = list + listA;

  print(listB); // Überprüfung

  /* Standardmäßig können Listen alle Arten von Variablen enthalten (dynamic).
  Wenn die Liste Variablen eines bestimmten Typs enthalten soll, 
  gehen wir wie folgt vor.
  */

  // Beispiel

  List<int> listC = [1, 2, 3, 4, 5, 11, 1717];
  List<String> listD = ["Hallo", "Dart"];
  List<bool> listE = [true, false, !false, !true];

  // Maps
  print("-- Maps --");

  Map preiseA = {"Orange": 0.59, "Tomate": 0.29, "Kartoffeln": 1.79};

  print(preiseA);

  // Hint

  /*
  Wenn Sie ein Komma vor die zweite geschweifte Klammer setzen, 
  ändert sich die Kartenansicht nach dem Speichern mit cmd+s 
  von horizontal zu vertikal. Dies ist nur eine optische Veränderung.
  */

  // Beispiel

  Map preise = {
    "Apfel": 0.99,
    "Banane": 0.49,
    "Orange": 0.79,
    "Avocado": 1.99,
  };

  print(preise); // Überprüfung

  // Aktionen mit Maps

  print("---"); //Visuelle Trennung
  print(preise["Apfel"]);
  // oder
  double apfelPreis = preise["Apfel"];
  print(apfelPreis);

  // Änderung des Wertes der Elemente
  preise["Banane"] = 2.49; // Änderung des Wertes der Elemente
  double bananePreis = preise["Banane"];
  print("---"); //Visuelle Trennung
  print("Die neue Preise von Banane ist $bananePreis Euro."); // Überprüfung

// If-Else
  print("-- If-Else --");

  // Die Grundstruktur sieht wie folgt aus:
  String wetter = "sonnig"; // Wenn wir "sonnig" ändern, wird }else{ aktiviert

  if (wetter == "sonnig") {
    print("Es ist sonnig!");
  } else {
    print("Fernsehr gucken.");
  }

  print("---"); //Visuelle Trennung

  // Variant 2 - Prüfungen in der Schule
  int note = 97; // Hier kann man noten ändfern

  if (note >= 90) {
    print("Sehr gut!");
  } else if (note >= 80) {
    print("Gut");
  } else if (note >= 70) {
    print("Befriedigenf");
  } else if (note >= 60) {
    print("Ausreichend");
  } else {
    print("Mangelhaft");
  }

  // Variant 3 - Prüfungen in der Schule mit Logische Operatopren

  if (note >= 90 && note <= 100) {
    print("Sehr gut!");
  } else if (note >= 80 && note < 90) {
    print("Gut");
  } else if (note >= 70 && note < 80) {
    print("Befriedigend");
  } else if (note >= 60 && note < 70) {
    print("Ausreichend");
  } else {
    print("Mangelchaft");
  }

  // Variant 4 - Wetter
  bool kaltesWetter = true;
  bool guteVerkehrslage = false;

  if (guteVerkehrslage == true && kaltesWetter == false) {
    print("Ich fahre zur Arbeit");
  } else {
    print("Homeoffice!");
  }

// Schleife

  // For-Schleife

  // For-in-Schleife

  // While-Schleife

// Funktionen

// Klassen
// Objekorientierte Programmierung
}
