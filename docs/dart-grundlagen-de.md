# Dart-Sprachreferenz

[English](dart-basics-en.md) · [Български](dart-osnovi-bg.md) · [Ausführbares deutsches Beispiel](../Dart-Grundlagen.dart)

Diese praktische Referenz beschreibt modernes Dart 3. Sie deckt die
Sprachmerkmale ab, die in Kommandozeilen-, Server- und Flutter-Projekten am
häufigsten gebraucht werden.

## Inhalt

1. [Dart ausführen](#dart-ausführen)
2. [Tastenkombinationen](#tastenkombinationen)
3. [Programmstruktur und Kommentare](#programmstruktur-und-kommentare)
4. [Variablen, Typen und Null-Sicherheit](#variablen-typen-und-null-sicherheit)
5. [Operatoren](#operatoren)
6. [Strings und Zahlen](#strings-und-zahlen)
7. [Collections](#collections)
8. [Kontrollfluss und Schleifen](#kontrollfluss-und-schleifen)
9. [Funktionen](#funktionen)
10. [Records und Patterns](#records-und-patterns)
11. [Fehler und Assertions](#fehler-und-assertions)
12. [Klassen und objektorientierte Programmierung](#klassen-und-objektorientierte-programmierung)
13. [Generics](#generics)
14. [Asynchrone Programmierung und Isolates](#asynchrone-programmierung-und-isolates)
15. [Bibliotheken, Pakete und JSON](#bibliotheken-pakete-und-json)
16. [Dokumentation, Werkzeuge und Tests](#dokumentation-werkzeuge-und-tests)
17. [Häufige Fehler](#häufige-fehler)

## Dart ausführen

Installation prüfen und die ausführbare Referenz starten:

```sh
dart --version
dart format Dart-Grundlagen.dart
dart analyze Dart-Grundlagen.dart
dart run Dart-Grundlagen.dart
```

Konsolenprojekt erstellen und Abhängigkeiten laden:

```sh
dart create -t console meine_app
cd meine_app
dart pub get
dart run
```

## Tastenkombinationen

### Sonderzeichen auf einer deutschen Tastatur

| Zeichen | macOS | Windows |
|---|---|---|
| `[` | `Option + 5` | `AltGr + 8` |
| `]` | `Option + 6` | `AltGr + 9` |
| `{` | `Option + 8` | `AltGr + 7` |
| `}` | `Option + 9` | `AltGr + 0` |
| `\` | `Umschalt + Option + 7` | `AltGr + ß` |
| `\|` | `Option + 7` | `AltGr + <` |
| `~` | `Option + N`, dann Leertaste | `AltGr + +` |
| `$` | `Umschalt + 4` | `Umschalt + 4` |
| `%` | `Umschalt + 5` | `Umschalt + 5` |
| `&` | `Umschalt + 6` | `Umschalt + 6` |
| `/` | `Umschalt + 7` | `Umschalt + 7` |

Tastaturlayout und Betriebssystemeinstellungen können einzelne Kombinationen
verändern.

### Allgemeine und VS-Code-Tastenkombinationen

| Aktion | macOS | Windows/Linux |
|---|---|---|
| Speichern | `Cmd + S` | `Strg + S` |
| Alles auswählen | `Cmd + A` | `Strg + A` |
| Kopieren / Ausschneiden / Einfügen | `Cmd + C/X/V` | `Strg + C/X/V` |
| Rückgängig | `Cmd + Z` | `Strg + Z` |
| Wiederholen | `Cmd + Umschalt + Z` | `Strg + Y` |
| Suchen | `Cmd + F` | `Strg + F` |
| Zeilenkommentar umschalten | `Cmd + /` | `Strg + /` |
| Befehlspalette | `Cmd + Umschalt + P` | `Strg + Umschalt + P` |
| Datei schnell öffnen | `Cmd + P` | `Strg + P` |
| Dokument formatieren | `Option + Umschalt + F` | `Umschalt + Alt + F` |
| Debugging starten | `F5` | `F5` |
| Debugging beenden | `Umschalt + F5` | `Umschalt + F5` |
| Terminal ein-/ausblenden | `` Ctrl + ` `` | `` Strg + ` `` |

Auf einem deutschen Layout entspricht der Kommentar-Befehl physisch oft
`Cmd + Umschalt + 7` unter macOS und `Strg + #` unter Windows.

## Programmstruktur und Kommentare

Jedes direkt ausführbare Programm besitzt eine Top-Level-Funktion `main`:

```dart
void main(List<String> argumente) {
  print('Argumente: $argumente');
}
```

Wenn der Einstiegspunkt `await` benötigt, lautet die Signatur
`Future<void> main() async`.

```dart
// Einzeiliger Kommentar

/* Mehrzeiliger
   Kommentar */

/// Dokumentationskommentar für eine Deklaration.
int addieren(int a, int b) => a + b;
```

Anweisungen enden normalerweise mit `;`, Blöcke verwenden `{}`. Die
Formatierung übernimmt `dart format`; manuelle Ausrichtung ist unnötig.

## Variablen, Typen und Null-Sicherheit

### Häufige eingebaute Typen

| Typ | Aufgabe | Beispiel |
|---|---|---|
| `int` | Ganze Zahl | `42` |
| `double` | Gleitkommazahl | `3.14` |
| `num` | Obertyp von `int` und `double` | `num n = 1.5` |
| `String` | UTF-16-Text | `'Dart'` |
| `bool` | `true` oder `false` | `bool bereit = true` |
| `List<T>` | Geordnete Sammlung | `<int>[1, 2]` |
| `Set<T>` | Eindeutige Werte | `<int>{1, 2}` |
| `Map<K, V>` | Schlüssel-Wert-Paare | `{'a': 1}` |
| `Record` | Feste heterogene Werte | `('Ada', 36)` |
| `Object` | Basisklasse nicht-nullbarer Objekte | `Object wert = 1` |
| `Object?` | Beliebiger Wert einschließlich `null` | `Object? wert` |
| `dynamic` | Dynamischer Memberzugriff | `dynamic wert` |
| `Never` | Beendet niemals normal | `Never fehler()` |
| `void` | Kein nutzbarer Rückgabewert | `void log()` |

### Deklarationsformen

```dart
int anzahl = 0;                    // expliziter Typ
var sprache = 'Dart';              // als String abgeleitet
final jahr = DateTime.now().year;  // einmal zur Laufzeit
const sekunden = 60;               // Compilezeitkonstante
late final String token;           // wird später initialisiert

dynamic flexibel = 'Text';
flexibel = 42;                     // erlaubt, aber weniger Typprüfungen
```

`var` bedeutet nicht `dynamic`. Nachdem `sprache` als `String` abgeleitet wurde,
ist die Zuweisung eines `int` ein Compilezeitfehler.

### Null-Sicherheit

Typen sind standardmäßig nicht-nullbar. `?` wird nur verwendet, wenn das Fehlen
eines Wertes fachlich sinnvoll ist.

```dart
String name = 'Ada';
String? spitzname;

final anzeige = spitzname ?? name; // Ersatzwert
spitzname ??= 'Gast';              // nur bei null zuweisen
final laenge = spitzname.length;   // hier zu nicht-nullbar hochgestuft
final gross = vielleichtName?.toUpperCase();
final erzwungen = vielleichtName!; // wirft bei null eine Ausnahme
```

`?.` und `??` sind meist sicherer als `!`. `!` sollte nur eingesetzt werden,
wenn eine Invariante den nicht-nullbaren Wert wirklich garantiert.

### Typprüfung und Cast

```dart
Object wert = 'Dart';

if (wert is String) {
  print(wert.length); // automatische Typ-Promotion
}

final text = wert as String; // wirft bei falschem Typ
print(wert is! int);
```

## Operatoren

| Gruppe | Operatoren |
|---|---|
| Arithmetik | `+  -  *  /  ~/  %  ++  --` |
| Vergleich | `==  !=  <  <=  >  >=` |
| Logik | `!  &&  \|\|` |
| Zuweisung | `=  +=  -=  *=  /=  ~/=  ??=` |
| Bitweise | `&  \|  ^  ~  <<  >>  >>>` |
| Typ | `is  is!  as` |
| Null-aware | `??  ?.  ?[]  !` |
| Bedingung | `bedingung ? a : b` |
| Cascade | `..  ?..` |
| Spread | `...  ...?` |

```dart
print(8 / 5);  // 1.6
print(8 ~/ 5); // 1
print(8 % 5);  // 3

final bezeichnung = alter >= 18 ? 'volljährig' : 'minderjährig';

final puffer = StringBuffer()
  ..write('Hallo')
  ..write(' Dart');
```

`==` prüft die Gleichheit gemäß der Implementierung einer Klasse.
`identical(a, b)` prüft, ob beide Referenzen genau dasselbe Objekt bezeichnen.

## Strings und Zahlen

```dart
const sprache = 'Dart';
final version = 3;
final text = '$sprache $version';
final ausdruck = 'Danach: ${version + 1}';

final mehrzeilig = '''
Erste Zeile
Zweite Zeile
''';

final roh = r'Keine Interpolation: $sprache und kein \n-Escape';
```

Nützliche Operationen:

```dart
text.length;
text.isEmpty;
text.toUpperCase();
text.contains('Dart');
text.split(' ');
text.replaceAll('Dart', 'Flutter');

final ganzeZahl = int.parse('42');
final vielleichtZahl = int.tryParse('x'); // null
final kommazahl = double.parse('3.14');
final gerundet = 3.14159.toStringAsFixed(2);
```

Für viele Verkettungen eignet sich `StringBuffer`. Unicode-Codepoints sind über
`string.runes` verfügbar.

## Collections

### List

```dart
final zahlen = <int>[1, 2, 3];
zahlen.add(4);
zahlen.addAll([5, 6]);
zahlen.remove(2);
print(zahlen[0]);
print(zahlen.length);

final gerade = zahlen.where((n) => n.isEven).toList();
final quadrate = zahlen.map((n) => n * n).toList();
final summe = zahlen.fold(0, (gesamt, n) => gesamt + n);
```

### Set

```dart
final ids = <int>{1, 2, 2, 3}; // {1, 2, 3}
ids.add(4);
final gemeinsam = {1, 2, 3}.intersection({2, 3, 4});
final vereinigt = {1, 2}.union({2, 3});
```

### Map

```dart
final preise = <String, double>{
  'Apfel': 0.99,
  'Banane': 0.49,
};

preise['Banane'] = 0.59;
preise.putIfAbsent('Orange', () => 0.79);
final apfelpreis = preise['Apfel']; // double?, weil der Schlüssel fehlen kann

for (final MapEntry(:key, :value) in preise.entries) {
  print('$key: $value');
}
```

### Spread und Kontrollfluss in Collections

```dart
final basis = [1, 2, 3];
final vierAufnehmen = true;
final werte = <int>[
  0,
  ...basis,
  if (vierAufnehmen) 4,
  for (final n in basis) n * 10,
];

List<int>? optional;
final sichereKopie = [...?optional];
```

`List.unmodifiable`, `Set.unmodifiable` und `Map.unmodifiable` verhindern, dass
Aufrufer die Collection verändern.

## Kontrollfluss und Schleifen

```dart
if (temperatur > 25) {
  print('warm');
} else if (temperatur > 10) {
  print('mild');
} else {
  print('kalt');
}
```

Switch-Anweisungen und vollständige Switch-Ausdrücke unterstützen Patterns:

```dart
final beschreibung = switch (punkte) {
  >= 90 && <= 100 => 'sehr gut',
  >= 60 && < 90 => 'bestanden',
  >= 0 && < 60 => 'nicht bestanden',
  _ => 'ungültig',
};

switch (befehl) {
  case ['bewegen', final x, final y]:
    print('Bewege zu $x, $y');
  case ['beenden']:
    break;
  default:
    print('Unbekannter Befehl');
}
```

Schleifen:

```dart
for (var i = 0; i < 3; i++) {
  print(i);
}

for (final element in elemente) {
  if (element == 'überspringen') continue;
  if (element == 'stopp') break;
  print(element);
}

while (bedingung) {
  bedingungAktualisieren();
}

do {
  mindestensEinmalAusfuehren();
} while (bedingung);
```

## Funktionen

Funktionen sind Objekte und können gespeichert, übergeben und zurückgegeben
werden.

```dart
int addieren(int a, int b) => a + b;

String begruessen(String name, [String satzzeichen = '!']) {
  return 'Hallo, $name$satzzeichen';
}

Uri endpoint({required String host, int port = 443}) {
  return Uri(scheme: 'https', host: host, port: port);
}
```

- `name` ist ein erforderlicher Positionsparameter.
- `[satzzeichen]` ist ein optionaler Positionsparameter.
- `{host, port}` sind benannte Parameter.
- `required` macht einen benannten Parameter erforderlich.
- Standardwerte müssen Compilezeitkonstanten sein.

Anonyme Funktionen, Closures und Funktionstypen:

```dart
final quadrat = (int n) => n * n;
final werte = [1, 2, 3].map(quadrat).toList();

typedef IntOperation = int Function(int a, int b);

int berechnen(int a, int b, IntOperation operation) {
  return operation(a, b);
}
```

Synchrone und asynchrone Generatoren:

```dart
Iterable<int> zaehlenBis(int max) sync* {
  for (var i = 1; i <= max; i++) yield i;
}

Stream<int> spaeterZaehlen(int max) async* {
  for (var i = 1; i <= max; i++) yield i;
}
```

## Records und Patterns

Records sind unveränderliche, typisierte Gruppen mit fester Größe.

```dart
(String, int) benutzerErstellen() => ('Ada', 36);
({double x, double y}) punkt() => (x: 2, y: 3);

final benutzer = benutzerErstellen();
print(benutzer.$1);
print(benutzer.$2);

final (name, alter) = benutzer; // Destrukturierung
final (:x, :y) = punkt();
```

Patterns können Listen, Maps, Records und Objekte zerlegen und validieren:

```dart
if (json case {'name': String name, 'age': int alter}) {
  print('$name ist $alter');
}

final ergebnis = switch (punkt()) {
  (x: 0, y: 0) => 'Ursprung',
  (x: final x, y: final y) when x == y => 'Diagonale',
  _ => 'anderer Punkt',
};
```

Wichtige Formen sind Konstanten-, Variablen- und Wildcard-Patterns (`_`),
logische (`&&`, `||`) und relationale Patterns (`>= 0`), Listen-, Map-, Record-
und Objekt-Patterns, Casts, Null-Prüfungen sowie `when`-Guards.

## Fehler und Assertions

```dart
try {
  final zahl = int.parse(eingabe);
  print(zahl);
} on FormatException catch (fehler, stacktrace) {
  print('Ungültige Zahl: $fehler');
  print(stacktrace);
} finally {
  ressourceSchliessen();
}
```

Jedes nicht-nullbare Objekt kann geworfen werden. Eine Implementierung von
`Exception` macht die Absicht deutlicher:

```dart
class UngueltigesAlter implements Exception {
  UngueltigesAlter(this.wert);
  final int wert;
}

Never fehlschlagen(String text) => throw StateError(text);
```

Assertions sind Prüfungen für die Entwicklung und in Produktion normalerweise
deaktiviert:

```dart
assert(alter >= 0, 'Alter darf nicht negativ sein');
```

Eine Validierung, die immer laufen muss, gehört nicht in ein `assert`.

## Klassen und objektorientierte Programmierung

### Felder, Konstruktoren, Methoden, Getter und Factories

```dart
class Person {
  Person({required this.name, required this.alter});

  Person.gast()
      : name = 'Gast',
        alter = 0;

  factory Person.fromJson(Map<String, Object?> json) {
    return Person(
      name: json['name'] as String,
      alter: json['alter'] as int,
    );
  }

  final String name;
  int alter;
  static int mindestalter = 0;

  String get bezeichnung => '$name ($alter)';
  set sicheresAlter(int wert) => alter = wert < 0 ? 0 : wert;

  void geburtstag() => alter++;
}

final person = Person(name: 'Ada', alter: 36)..geburtstag();
```

`const`-Konstruktoren dienen vollständig unveränderlichen Compilezeitobjekten.
Initialisierungslisten laufen vor dem Konstruktorblock. Eine `factory` kann eine
gecachte Instanz oder einen Untertyp zurückgeben und erzeugt nicht direkt mit
`this` ein Objekt.

### Vererbung, Interfaces und Mixins

```dart
abstract interface class Form {
  double get flaeche;
}

final class Kreis implements Form {
  const Kreis(this.radius);
  final double radius;

  @override
  double get flaeche => math.pi * radius * radius;
}

mixin MitZeitstempel {
  final DateTime erstelltAm = DateTime.now();
}

class Nachricht with MitZeitstempel {}
```

- `extends` erbt die Implementierung einer Oberklasse.
- `implements` übernimmt Interfaces, aber keine Implementierung.
- `with` fügt wiederverwendbare Mixin-Implementierung ein.
- `super` greift auf Konstruktoren und Member der Oberklasse zu.
- `@override` lässt den Analyzer eine beabsichtigte Überschreibung prüfen.

### Klassenmodifikatoren

| Modifikator | Hauptzweck |
|---|---|
| `abstract` | Erlaubt nicht implementierte Member; nicht direkt instanziierbar |
| `base` | Erzwingt Implementierungsvererbung und schützt Basisverhalten |
| `interface` | Erlaubt Implementierung, verhindert externe Vererbung |
| `final` | Verhindert externe Untertypen |
| `sealed` | Definiert eine bekannte, vollständige Untertypfamilie |
| `mixin` | Deklariert wiederverwendbares Verhalten für `with` |

Die Einschränkungen wirken über Bibliotheksgrenzen. Gültige Modifikatoren lassen
sich beispielsweise als `abstract interface class` kombinieren.

### Sealed Classes und vollständige Switches

```dart
sealed class Ergebnis<T> {
  const Ergebnis();
}

final class Erfolg<T> extends Ergebnis<T> {
  const Erfolg(this.wert);
  final T wert;
}

final class Fehler<T> extends Ergebnis<T> {
  const Fehler(this.text);
  final String text;
}

String beschreiben<T>(Ergebnis<T> ergebnis) => switch (ergebnis) {
  Erfolg(wert: final wert) => 'Erfolg: $wert',
  Fehler(text: final text) => 'Fehler: $text',
};
```

### Enums, Extensions und Extension Types

```dart
enum Status {
  wartet('Wartet'),
  fertig('Fertig');

  const Status(this.bezeichnung);
  final String bezeichnung;
}

extension StringFormatierung on String {
  String get grossgeschrieben => isEmpty
      ? this
      : '${this[0].toUpperCase()}${substring(1)}';
}

extension type const BenutzerId(int wert) {
  bool get istGueltig => wert > 0;
}
```

Eine Extension ergänzt einen vorhandenen Typ um statisch aufgelöste Member. Ein
Extension Type umhüllt zur Compilezeit eine Repräsentation und veröffentlicht
nur seine deklarierte API; er ist keine normal allozierte Wrapper-Klasse.

Klassen können außerdem Operatoren und eine `call()`-Methode definieren, sodass
ihre Instanzen wie Funktionen aufgerufen werden können.

## Generics

```dart
class Box<T> {
  const Box(this.wert);
  final T wert;
}

T erstes<T>(List<T> werte) => werte.first;

class ZahlenBox<T extends num> {
  const ZahlenBox(this.wert);
  final T wert;
}

final textBox = Box<String>('Dart');
final ersteZahl = erstes<int>([1, 2, 3]);
```

Generics ermöglichen wiederverwendbaren Code mit statischer Typsicherheit. Die
generischen Typinformationen bleiben in Dart auch zur Laufzeit erhalten.

## Asynchrone Programmierung und Isolates

### Future, async und await

```dart
Future<String> nameLaden() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 'Ada';
}

Future<void> nameAnzeigen() async {
  try {
    final name = await nameLaden();
    print(name);
  } catch (fehler) {
    print(fehler);
  }
}

final ergebnisse = await Future.wait([aLaden(), bLaden()]);
```

Der Aufruf einer `async`-Funktion liefert sofort ein `Future`. `await` pausiert
nur diese asynchrone Funktion, nicht den gesamten Prozess.

### Stream

```dart
Stream<int> ticks(int max) async* {
  for (var i = 1; i <= max; i++) {
    yield i;
  }
}

await for (final tick in ticks(3)) {
  print(tick);
}

final abonnement = stream.listen(
  print,
  onError: print,
  onDone: () => print('fertig'),
);
await abonnement.cancel();
```

Ein `Future<T>` liefert später null oder ein Ergebnis. Ein `Stream<T>` liefert
eine Folge asynchroner Ereignisse. Streams können Single-Subscription- oder
Broadcast-Streams sein.

### Isolates

Dart-Isolates teilen keinen veränderbaren Speicher. Sie eignen sich für
rechenintensive Arbeit, die sonst den Event Loop blockieren würde:

```dart
import 'dart:isolate';

int berechnen() => List.generate(1000, (i) => i).fold(0, (a, b) => a + b);

final ergebnis = await Isolate.run(berechnen);
```

Für das Warten auf Dateien, Datenbanken oder Netzwerke wird normales
asynchrones I/O verwendet; ein Isolate ist für größere Berechnungen gedacht.

## Bibliotheken, Pakete und JSON

Jede Dart-Datei ist eine Bibliothek. Namen mit führendem `_` sind innerhalb
ihrer Bibliothek privat.

```dart
import 'dart:math' as math;
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:mein_paket/service.dart' hide InternerHelfer;

part 'generiertes_modell.dart';
```

Normale Imports und kleine Bibliotheken sind vorzuziehen. `part` wird vor allem
eingesetzt, wenn Codegenerierung oder ein Framework es verlangt.

Typische `pubspec.yaml`:

```yaml
name: meine_app
environment:
  sdk: ^3.12.0

dependencies:
  http: ^1.0.0

dev_dependencies:
  lints: ^6.0.0
  test: ^1.25.0
```

Abhängigkeiten möglichst mit dem Werkzeug hinzufügen:

```sh
dart pub add http
dart pub add --dev test
dart pub get
dart pub outdated
dart pub upgrade
```

JSON-Konvertierung:

```dart
import 'dart:convert';

final kodiert = jsonEncode({'name': 'Ada', 'alter': 36});
final dekodiert = jsonDecode(kodiert) as Map<String, dynamic>;
print(dekodiert['name']);
```

`dart:convert` wandelt JSON in Maps, Lists, Strings, Zahlen, boolesche Werte und
`null` um. Modellklassen benötigen weiterhin `fromJson`/`toJson`, manuell oder
von einem Paket generiert.

## Dokumentation, Werkzeuge und Tests

Dokumentationskommentare beginnen mit `///` und dürfen Markdown enthalten:

```dart
/// Liefert die Summe von [a] und [b].
///
/// Wirft [ArgumentError], wenn ein Argument negativ ist.
int geprueftAddieren(int a, int b) {
  if (a < 0 || b < 0) throw ArgumentError('negativer Wert');
  return a + b;
}
```

Metadaten hängen Annotationen an Deklarationen:

```dart
@Deprecated('Stattdessen neueMethode verwenden')
void alteMethode() {}

class Aufgabe {
  const Aufgabe(this.text);
  final String text;
}

@Aufgabe('Validierung ergänzen')
void speichern() {}
```

Zentrale Befehle:

```sh
dart format .
dart analyze
dart test
dart run
dart compile exe bin/main.dart
dart doc
```

Ein einfacher Test mit `package:test`:

```dart
import 'package:test/test.dart';

void main() {
  test('addiert zwei Zahlen', () {
    expect(addieren(2, 3), equals(5));
  });
}
```

Eine Lint-Sammlung wird in `analysis_options.yaml` aktiviert:

```yaml
include: package:lints/recommended.yaml
```

## Häufige Fehler

- `var` leitet einen statischen Typ ab und ist kein Synonym für `dynamic`.
- `/` liefert ein `double`; `~/` führt eine Ganzzahldivision aus.
- Listenindizes beginnen bei `0`; ein ungültiger Index wirft `RangeError`.
- `map[key]` ist nullbar, weil der Schlüssel fehlen könnte.
- `!` sollte Null-Sicherheitsfehler nicht einfach zum Schweigen bringen.
- Ein `Future`, dessen Abschluss oder Fehler wichtig ist, muss `await`et werden.
- `forEach` mit einem `async`-Callback ist für sequenzielles `await` ungeeignet;
  dafür wird eine `for`-Schleife verwendet.
- Für wertartige Klassen müssen sowohl `==` als auch `hashCode` überschrieben
  werden.
- An API-Grenzen ist `dynamic` möglichst zu vermeiden; externe Daten werden
  geparst und validiert.
- Für nicht erneut zugewiesene lokale Variablen ist `final` vorzuziehen.
- Rechenintensive Arbeit gehört nicht in das Haupt-Isolate.
- Vor einem Commit formatieren und analysieren:
  `dart format . && dart analyze`.

Für präzise Sonderfälle gilt die aktuelle
[offizielle Dart-Sprachdokumentation](https://dart.dev/language).
