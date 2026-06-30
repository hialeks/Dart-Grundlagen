# Dart-Kurzreferenz

[English](dart-basics-en.md) · [Български](dart-osnovi-bg.md) · [Ausführbares Beispiel](../Dart-Grundlagen.dart)

## Variablen und Typen

```dart
int zahl = 42;
double pi = 3.14;
String text = 'Hallo';
bool fertig = false;
var name = 'Ada';       // als String abgeleitet
final jahr = DateTime.now().year;
const minuten = 60;
String? spitzname;      // darf null sein
print(spitzname ?? 'Gast');
```

`var` ist nicht `dynamic`: Der abgeleitete Typ bleibt erhalten. `final` wird nur
einmal gesetzt, `const` muss bereits zur Compilezeit bekannt sein.

## Operatoren und Kontrollfluss

```dart
a + b;  a - b;  a * b;  a / b;  a ~/ b;  a % b;
a == b; a != b; a > b;  a <= b;
bereit && online; bereit || online; !bereit;

if (alter >= 18) {
  print('volljährig');
} else {
  print('minderjährig');
}

final typ = switch (tag) {
  'Sa' || 'So' => 'Wochenende',
  _ => 'Werktag',
};
```

`/` liefert ein `double`, `~/` führt eine Ganzzahldivision aus und `%` liefert
den Rest.

## Collections und Schleifen

```dart
final liste = <int>[1, 2, 3];
final menge = <int>{1, 2, 2};
final preise = <String, double>{'Apfel': 0.99};

for (final wert in liste) {
  print(wert);
}

final quadrate = [for (final n in liste) n * n];
final kopie = [0, ...liste, if (liste.isNotEmpty) 4];
```

`List` ist geordnet, `Set` enthält keine Duplikate und `Map` ordnet Schlüsseln
Werte zu.

## Funktionen

```dart
int addiere(int a, int b) => a + b;

String grüße(String name, {String anrede = 'Hallo'}) {
  return '$anrede, $name!';
}

double brutto(double netto, {required double steuer}) {
  return netto * (1 + steuer);
}
```

Geschweifte Klammern definieren benannte Parameter. `required` macht einen
benannten Parameter verpflichtend.

## Records und Patterns (Dart 3)

```dart
(String, int) benutzer() => ('Ada', 36);

final (name, alter) = benutzer();
final punkt = (x: 3, y: 3);

final beschreibung = switch (punkt) {
  (x: 0, y: 0) => 'Ursprung',
  (x: final x, y: final y) when x == y => 'Diagonale',
  _ => 'anderer Punkt',
};
```

Records bündeln mehrere Werte. Patterns prüfen ihre Form und zerlegen sie.

## Klassen und Generics

```dart
class Box<T> {
  Box(this.wert);
  final T wert;
}

enum Ampel { rot, gelb, grün }

final box = Box<String>('Dart');
```

Abstrakte Klassen definieren Verträge, `extends` vererbt Implementierung und
`implements` verpflichtet zur Implementierung einer Schnittstelle.

## Fehler und Asynchronität

```dart
try {
  final zahl = int.parse('42');
} on FormatException catch (fehler) {
  print(fehler);
}

Future<String> laden() async {
  return 'fertig';
}

final ergebnis = await laden();
```

Ein `Future<T>` liefert später einen Wert. Ein `Stream<T>` kann mehrere Werte
über die Zeit liefern.

## Nützliche Befehle

```sh
dart format Dart-Grundlagen.dart
dart analyze Dart-Grundlagen.dart
dart run Dart-Grundlagen.dart
```
