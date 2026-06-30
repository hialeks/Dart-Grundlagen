import 'dart:convert';
import 'dart:isolate';
import 'dart:math' as math;

/*
  DART-GRUNDLAGEN – AUSFÜHRBARES NACHSCHLAGEWERK

  Sonderzeichen auf einer deutschen macOS-Tastatur
  -------------------------------------------------
  ⌥ + 5             -> [
  ⌥ + 6             -> ]
  ⌥ + 7             -> |
  ⌥ + 8             -> {
  ⌥ + 9             -> }
  ⇧ + 4             -> $
  ⇧ + 5             -> %
  ⇧ + 6             -> &
  ⇧ + 7             -> /
  ⇧ + ⌥ + 7         -> \
  ⌥ + N, Leertaste  -> ~

  Sonderzeichen auf einer deutschen Windows-Tastatur
  --------------------------------------------------
  AltGr + 7          -> {
  AltGr + 8          -> [
  AltGr + 9          -> ]
  AltGr + 0          -> }
  AltGr + <          -> |
  AltGr + ß          -> \
  AltGr + +          -> ~
  ⇧ + 4              -> $
  ⇧ + 5              -> %
  ⇧ + 6              -> &
  ⇧ + 7              -> /

  Allgemeine Tastenkombinationen
  -------------------------------
  ⌘ + S             Dokument speichern
  ⌘ + A             Alles auswählen
  ⌘ + C / X / V     Kopieren / Ausschneiden / Einfügen
  ⌘ + Z              Rückgängig
  ⌘ + ⇧ + Z          Wiederholen
  ⌘ + F              Im Dokument suchen
  ⌘ + ⇧ + 7          Zeile(n) kommentieren (entspricht ⌘ + /)

  Nützliche VS-Code-Tastenkombinationen
  -------------------------------------
  ⌘ + ⇧ + P          Befehlspalette öffnen
  ⌘ + P              Datei schnell öffnen
  ⌥ + ⇧ + F          Dokument formatieren
  F5                 Debugging starten
  ⇧ + F5             Debugging beenden
  Ctrl + `           Terminal ein-/ausblenden

  Allgemeine Windows-/Linux-Tastenkombinationen
  ---------------------------------------------
  Ctrl + S           Dokument speichern
  Ctrl + A           Alles auswählen
  Ctrl + C / X / V   Kopieren / Ausschneiden / Einfügen
  Ctrl + Z            Rückgängig
  Ctrl + Y            Wiederholen
  Ctrl + F            Im Dokument suchen
  Ctrl + /            Zeile(n) kommentieren
                      (oft Ctrl + # auf deutscher Tastatur)

  Nützliche VS-Code-Tastenkombinationen unter Windows/Linux
  ---------------------------------------------------------
  Ctrl + ⇧ + P       Befehlspalette öffnen
  Ctrl + P           Datei schnell öffnen
  ⇧ + Alt + F        Dokument formatieren
  F5                 Debugging starten
  ⇧ + F5             Debugging beenden
  Ctrl + `           Terminal ein-/ausblenden

  Kommentare
  ----------
  // Einzeiliger Kommentar
  /* Mehrzeiliger Kommentar */
  /// Dokumentationskommentar
*/

Future<void> main() async {
  print('Dart-Grundlagen – vollständiger Überblick');

  _grundtypenUndVariablen();
  _operatorenUndKontrollfluss();
  _stringsUndKonvertierung();
  _collectionsUndSchleifen();
  _funktionenRecordsUndPatterns();
  _fehlerbehandlung();
  _objektorientierung();
  await _asynchronitaetUndParallelitaet();

  _abschnitt('Fertig');
  print('Alle Beispiele wurden erfolgreich ausgeführt.');
}

void _grundtypenUndVariablen() {
  _abschnitt('Variablen, Typen und Null-Sicherheit');

  int ganzeZahl = 42;
  double kommazahl = 3.14;
  num beliebigeZahl = 7;
  String sprache = 'Dart';
  bool istBereit = true;

  // var leitet den Typ einmalig ab. Danach bleibt die Variable ein String.
  var abgeleiteterText = 'Hallo';
  abgeleiteterText = 'Guten Tag';

  // dynamic erlaubt wechselnde Typen, umgeht aber viele statische Prüfungen.
  dynamic flexiblerWert = 'Text';
  flexiblerWert = 10;

  // final wird einmal zur Laufzeit gesetzt; const ist eine Compilezeitkonstante.
  final aktuellesJahr = DateTime.now().year;
  const sekundenProMinute = 60;

  // Typen sind standardmäßig nicht-nullbar. ? erlaubt ausdrücklich null.
  String? spitzname;
  final anzeigename = spitzname ?? 'Gast';
  spitzname ??= 'Dart-Lernender';

  // late verspricht eine Initialisierung vor dem ersten Lesen.
  late final String kurs;
  kurs = 'Dart-Grundlagen';

  print('$ganzeZahl, $kommazahl, $beliebigeZahl, $sprache, $istBereit');
  print('$abgeleiteterText, $flexiblerWert, $aktuellesJahr');
  print('$sekundenProMinute, $anzeigename, $spitzname, $kurs');

  ganzeZahl = 43;
  kommazahl = math.pi;
  beliebigeZahl = 2.5;
  sprache = 'Dart 3';
  istBereit = false;
  print('$ganzeZahl, $kommazahl, $beliebigeZahl, $sprache, $istBereit');
}

void _operatorenUndKontrollfluss() {
  _abschnitt('Operatoren und Kontrollfluss');

  const a = 8;
  const b = 5;
  print('Addition: ${a + b}, Subtraktion: ${a - b}');
  print('Multiplikation: ${a * b}, Division: ${a / b}');
  print('Ganzzahldivision: ${a ~/ b}, Rest: ${a % b}');
  print('Vergleich: ${a == b}, ${a != b}, ${a > b}, ${a <= b}');
  print('Logik: ${a > 0 && b > 0}, ${a == 0 || b > 0}, ${!(a == b)}');

  var zaehler = 10;
  print('Post-Inkrement: ${zaehler++}, danach: $zaehler');
  print('Pre-Inkrement: ${++zaehler}');
  zaehler += 5;
  print('Nach += 5: $zaehler');

  print(_wetterHinweis(24));
  print(_note(92));

  const tag = 'Samstag';
  final tagestyp = switch (tag) {
    'Samstag' || 'Sonntag' => 'Wochenende',
    _ => 'Werktag',
  };
  print('$tag ist ein $tagestyp.');

  const alter = 20;
  print(alter >= 18 ? 'Volljährig' : 'Minderjährig');
}

String _wetterHinweis(int temperatur) {
  if (temperatur > 20) {
    return 'T-Shirt-Wetter';
  } else if (temperatur > 10) {
    return 'Eine leichte Jacke reicht';
  }
  return 'Warme Jacke mitnehmen';
}

String _note(int punkte) => switch (punkte) {
  >= 90 && <= 100 => 'Sehr gut',
  >= 80 && < 90 => 'Gut',
  >= 70 && < 80 => 'Befriedigend',
  >= 60 && < 70 => 'Ausreichend',
  >= 0 && < 60 => 'Nicht bestanden',
  _ => 'Ungültige Punktzahl',
};

void _stringsUndKonvertierung() {
  _abschnitt('Strings, Zahlen und Konvertierung');

  const vorname = 'Ada';
  const nachname = 'Lovelace';
  final vollerName = '$vorname $nachname';
  final mehrzeilig = '''
Mehrzeilige Strings
sind mit drei Anführungszeichen möglich.
''';

  print('$vollerName (${vollerName.length} Zeichen)');
  print(vollerName.toUpperCase());
  print('Dart'.contains('art'));
  print(mehrzeilig.trim());
  print(int.parse('42'));
  print(int.tryParse('keine Zahl')); // null statt Ausnahme
  print(math.pi.toStringAsFixed(3));

  final puffer = StringBuffer()
    ..write('Dart ')
    ..write('ist ')
    ..write('produktiv.');
  print(puffer);
}

void _collectionsUndSchleifen() {
  _abschnitt('Collections und Schleifen');

  final zahlen = <int>[1, 2, 3, 4, 5];
  zahlen
    ..add(6)
    ..remove(1);

  final geradeQuadrate = zahlen
      .where((zahl) => zahl.isEven)
      .map((zahl) => zahl * zahl)
      .toList();
  final eindeutigeZahlen = <int>[1, 1, 2, 3].toSet();
  final preise = <String, double>{'Apfel': 0.99, 'Banane': 0.49};
  preise['Banane'] = 0.59;

  final erweitert = <int>[
    0,
    ...zahlen,
    if (zahlen.isNotEmpty) 7,
    for (final zahl in zahlen.take(2)) zahl * 10,
  ];

  print('List: $zahlen');
  print('Set: $eindeutigeZahlen');
  print('Map: $preise');
  print('Gefiltert und transformiert: $geradeQuadrate');
  print('Spread, collection-if und collection-for: $erweitert');

  for (var index = 0; index < zahlen.length; index++) {
    print('Index $index: ${zahlen[index]}');
  }

  for (final zahl in zahlen) {
    if (zahl.isOdd) continue;
    if (zahl > 4) break;
    print('Gerade Zahl bis 4: $zahl');
  }

  var countdown = 3;
  while (countdown > 0) {
    print('Start in ${countdown--}');
  }

  var versuche = 0;
  do {
    versuche++;
  } while (versuche < 1);
  print('do-while wurde $versuche-mal ausgeführt.');

  print('Generator: ${_zaehlenBis(4).toList()}');
}

void _funktionenRecordsUndPatterns() {
  _abschnitt('Funktionen, Records und Patterns');

  print('3 + 5 = ${addieren(3, 5)}');
  print(begruessen('Anna'));
  print(begruessen('Sam', anrede: 'Guten Morgen'));
  print('Bruttopreis: ${bruttopreis(100, steuersatz: 0.19)}');

  final quadrat = (int zahl) => zahl * zahl;
  print('Quadrat von 4: ${quadrat(4)}');
  print('Generische Funktion: ${erstesElement<String>(['Dart', 'Flutter'])}');

  final (name, alter) = benutzerErstellen();
  print('Record: $name, $alter');
  print(_punktBeschreiben((x: 3, y: 3)));

  final befehl = <String>['bewegen', '10', '20'];
  switch (befehl) {
    case ['bewegen', final x, final y]:
      print('Bewege zu x=$x, y=$y.');
    default:
      print('Unbekannter Befehl');
  }

  assert(addieren(2, 3) == 5);
}

int addieren(int links, int rechts) => links + rechts;

String begruessen(String name, {String anrede = 'Hallo'}) {
  return '$anrede, $name!';
}

double bruttopreis(double netto, {required double steuersatz}) {
  return netto * (1 + steuersatz);
}

T erstesElement<T>(List<T> werte) => werte.first;

(String, int) benutzerErstellen() => ('Ada', 36);

String _punktBeschreiben(({int x, int y}) punkt) => switch (punkt) {
  (x: 0, y: 0) => 'Koordinatenursprung',
  (x: final x, y: final y) when x == y => 'Punkt auf der Diagonale',
  _ => 'Anderer Punkt',
};

Iterable<int> _zaehlenBis(int maximum) sync* {
  for (var wert = 1; wert <= maximum; wert++) {
    yield wert;
  }
}

void _fehlerbehandlung() {
  _abschnitt('Fehlerbehandlung');

  try {
    print(int.parse('12x'));
  } on FormatException catch (fehler, stacktrace) {
    print('Ungültige Zahl: ${fehler.source}');
    print('Stacktrace vorhanden: ${stacktrace.toString().isNotEmpty}');
  } finally {
    print('Der Parse-Versuch ist beendet.');
  }

  try {
    print(_sicherTeilen(10, 0));
  } on ArgumentError catch (fehler) {
    print('Fehler: ${fehler.message}');
  }
}

double _sicherTeilen(num dividend, num divisor) {
  if (divisor == 0) {
    throw ArgumentError('Division durch null');
  }
  return dividend / divisor;
}

void _objektorientierung() {
  _abschnitt('Objektorientierte Programmierung');

  final person = Person(name: 'Anna', age: 25)
    ..birthday()
    ..birthday();
  final gast = Person.guest();
  final Shape kreis = Circle(2);
  final box = Box<String>('Dart');
  final benutzerId = UserId(7);

  print(person.introduction);
  print(gast.introduction);
  print('Kreisfläche: ${kreis.area.toStringAsFixed(2)}');
  print('Generische Box: ${box.value}');
  print('Ampel: ${TrafficLight.green.instruction}');
  print('Extension: ${'dart'.grossgeschrieben}');
  print('Extension Type: ${benutzerId.value}');

  final ergebnisse = <OperationResult<int>>[
    Success(42),
    const Failure('Nicht verfügbar'),
  ];
  for (final ergebnis in ergebnisse) {
    print(_ergebnisText(ergebnis));
  }

  final json = person.toJson();
  print('JSON: ${jsonEncode(json)}');
  print('Aus JSON: ${Person.fromJson(json).introduction}');
}

class Person with CreatedAt {
  Person({required this.name, required this.age});

  Person.guest() : name = 'Gast', age = 0;

  factory Person.fromJson(Map<String, Object?> json) {
    return Person(name: json['name'] as String, age: json['age'] as int);
  }

  final String name;
  int age;

  void birthday() => age++;

  String get introduction => 'Ich bin $name und $age Jahre alt.';

  Map<String, Object?> toJson() => {'name': name, 'age': age};
}

mixin CreatedAt {
  final DateTime createdAt = DateTime.now();
}

abstract interface class Shape {
  double get area;
}

final class Circle implements Shape {
  const Circle(this.radius);

  final double radius;

  @override
  double get area => math.pi * radius * radius;
}

class Box<T> {
  const Box(this.value);

  final T value;
}

enum TrafficLight { red, yellow, green }

extension TrafficLightInstruction on TrafficLight {
  String get instruction => switch (this) {
    TrafficLight.red => 'Stopp',
    TrafficLight.yellow => 'Warten',
    TrafficLight.green => 'Fahren',
  };
}

extension StringFormatting on String {
  String get grossgeschrieben {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension type const UserId(int value) {}

sealed class OperationResult<T> {
  const OperationResult();
}

final class Success<T> extends OperationResult<T> {
  const Success(this.value);

  final T value;
}

final class Failure<T> extends OperationResult<T> {
  const Failure(this.message);

  final String message;
}

String _ergebnisText<T>(OperationResult<T> ergebnis) => switch (ergebnis) {
  Success(value: final wert) => 'Erfolg: $wert',
  Failure(message: final text) => 'Fehler: $text',
};

Future<void> _asynchronitaetUndParallelitaet() async {
  _abschnitt('Asynchronität, Streams und Isolates');

  print(await _nachrichtLaden());

  await for (final wert in _asynchronZaehlen(3)) {
    print('Stream-Wert: $wert');
  }

  final summe = await Isolate.run(_aufwendigeBerechnung);
  print('Im Isolate berechnete Summe: $summe');
}

Future<String> _nachrichtLaden() async {
  await Future<void>.delayed(Duration.zero);
  return 'Daten wurden geladen.';
}

Stream<int> _asynchronZaehlen(int maximum) async* {
  for (var wert = 1; wert <= maximum; wert++) {
    await Future<void>.delayed(Duration.zero);
    yield wert;
  }
}

int _aufwendigeBerechnung() {
  return List<int>.generate(1000, (index) => index).fold(0, (a, b) => a + b);
}

void _abschnitt(String titel) {
  print('\n=== $titel ===');
}
