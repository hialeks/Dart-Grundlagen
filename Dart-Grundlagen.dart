import 'dart:math' as math;

/*
  Dart-Grundlagen / Dart Basics / Основи на Dart

  DE: Kurze, ausführbare Referenz. Mehr Erklärungen stehen in docs/.
  EN: Short, executable reference. More explanations are in docs/.
  BG: Кратък, изпълним справочник. Повече обяснения има в docs/.
*/

Future<void> main() async {
  _section('Variablen und Typen', 'Variables and types', 'Променливи и типове');

  int answer = 42;
  double pi = 3.14;
  String language = 'Dart';
  bool isReady = true;
  var inferred =
      'String'; // var ermittelt den Typ / infers the type / извежда типа
  dynamic flexible = 'Text';
  flexible =
      10; // dynamic kann den Typ wechseln / can change type / може да сменя типа
  final currentYear = DateTime.now().year; // einmal / once / веднъж
  const secondsPerMinute = 60; // Compilezeit / compile time / при компилация
  String? nickname; // null ist erlaubt / null is allowed / null е разрешен

  print('$answer, $pi, $language, $isReady, $inferred, $flexible');
  print('$currentYear, $secondsPerMinute, ${nickname ?? 'Guest'}');

  answer = 43;
  pi = 3.14159;
  language = 'Dart 3';
  isReady = false;
  inferred = 'still a String';
  print('$answer, $pi, $language, $isReady, $inferred');

  _section(
    'Operatoren und Kontrollfluss',
    'Operators and control flow',
    'Оператори и управление на потока',
  );

  const a = 8;
  const b = 5;
  print('+ ${a + b}, - ${a - b}, * ${a * b}, / ${a / b}');
  print('~/ ${a ~/ b}, % ${a % b}');
  print('== ${a == b}, != ${a != b}, > ${a > b}');
  print('&& ${a > 0 && b > 0}, || ${a == 0 || b > 0}, ! ${!(a == b)}');
  print(_weatherAdvice(24));
  print(_grade(92));

  _section(
    'Strings und Umwandlung',
    'Strings and conversion',
    'Низове и преобразуване',
  );

  const firstName = 'Ada';
  const lastName = 'Lovelace';
  final fullName = '$firstName $lastName';
  print('$fullName, ${fullName.length}, ${fullName.toUpperCase()}');
  print(
    '${int.parse('42')}, ${int.tryParse('x')}, ${math.pi.toStringAsFixed(2)}',
  );

  _section(
    'Collections und Schleifen',
    'Collections and loops',
    'Колекции и цикли',
  );

  final numbers = <int>[1, 2, 3, 4, 5];
  numbers.add(6);
  final evenSquares = numbers
      .where((number) => number.isEven)
      .map((number) => number * number)
      .toList();
  final uniqueNumbers = <int>[1, 1, 2, 3].toSet();
  final prices = <String, double>{'apple': 0.99, 'banana': 0.49};
  prices['banana'] = 0.59;
  final extended = <int>[0, ...numbers, if (numbers.isNotEmpty) 7];

  print('$numbers | $evenSquares | $uniqueNumbers | $prices | $extended');
  for (final number in numbers) {
    if (number.isOdd) continue;
    print(_tr('Gerade: $number', 'Even: $number', 'Четно: $number'));
  }

  var countdown = 3;
  while (countdown > 0) {
    print(countdown--);
  }

  _section('Funktionen', 'Functions', 'Функции');

  print('3 + 5 = ${add(3, 5)}');
  print(greet('Anna'));
  print(greet('Sam', salutation: 'Hello'));
  print('VAT: ${grossPrice(100, vatRate: 0.19)}');
  print('Generic: ${first<String>(['Dart', 'Flutter'])}');

  _section(
    'Records und Patterns',
    'Records and patterns',
    'Records и patterns',
  );

  final (userName, userAge) = createUser();
  print('$userName, $userAge');
  print(describePoint((x: 3, y: 3)));

  final command = <String>['move', '10', '20'];
  switch (command) {
    case ['move', final x, final y]:
      print('x=$x, y=$y');
    default:
      print(_tr('Unbekannter Befehl', 'Unknown command', 'Непозната команда'));
  }

  _section('Fehlerbehandlung', 'Error handling', 'Обработка на грешки');

  try {
    print(int.parse('12x'));
  } on FormatException catch (error) {
    print(
      _tr(
        'Ungültige Zahl: ${error.source}',
        'Invalid number: ${error.source}',
        'Невалидно число: ${error.source}',
      ),
    );
  } finally {
    print(_tr('Versuch beendet', 'Attempt finished', 'Опитът приключи'));
  }

  _section(
    'Objektorientierung',
    'Object-oriented programming',
    'Обектно-ориентирано програмиране',
  );

  final person = Person(name: 'Anna', age: 25)..birthday();
  final Shape circle = Circle(2);
  final box = Box<String>('Dart');
  print(person.introduction);
  print('${circle.area.toStringAsFixed(2)}, ${box.value}');
  print(TrafficLight.green.instruction);

  _section('Asynchronität', 'Asynchrony', 'Асинхронност');

  print(await loadMessage());
  await for (final value in countStream(3)) {
    print(_tr('Stream: $value', 'Stream: $value', 'Поток: $value'));
  }
}

// DE: Positionsparameter und Kurzsyntax
// EN: Positional parameters and arrow syntax
// BG: Позиционни параметри и кратък синтаксис
int add(int left, int right) => left + right;

// DE: Benannter optionaler Parameter
// EN: Named optional parameter
// BG: Именуван незадължителен параметър
String greet(String name, {String salutation = 'Hallo'}) {
  return '$salutation, $name!';
}

double grossPrice(double netPrice, {required double vatRate}) {
  return netPrice * (1 + vatRate);
}

T first<T>(List<T> values) => values.first;

(String, int) createUser() => ('Ada', 36);

String describePoint(({int x, int y}) point) => switch (point) {
  (x: 0, y: 0) => _tr('Ursprung', 'Origin', 'Координатно начало'),
  (x: final x, y: final y) when x == y => _tr(
    'Diagonale',
    'Diagonal',
    'Диагонал',
  ),
  _ => _tr('Anderer Punkt', 'Other point', 'Друга точка'),
};

String _weatherAdvice(int temperature) {
  if (temperature > 20) {
    return _tr('T-Shirt-Wetter', 'T-shirt weather', 'Време за тениска');
  }
  return _tr('Jacke mitnehmen', 'Take a jacket', 'Вземи яке');
}

String _grade(int score) => switch (score) {
  >= 90 && <= 100 => _tr('Sehr gut', 'Excellent', 'Отличен'),
  >= 60 && < 90 => _tr('Bestanden', 'Passed', 'Издържал'),
  >= 0 && < 60 => _tr('Nicht bestanden', 'Failed', 'Неиздържал'),
  _ => _tr('Ungültig', 'Invalid', 'Невалидно'),
};

class Person {
  Person({required this.name, required this.age});

  final String name;
  int age;

  void birthday() => age++;

  String get introduction => _tr(
    'Ich bin $name und $age Jahre alt.',
    'I am $name and I am $age years old.',
    'Аз съм $name и съм на $age години.',
  );
}

abstract class Shape {
  double get area;
}

class Circle extends Shape {
  Circle(this.radius);

  final double radius;

  @override
  double get area => math.pi * radius * radius;
}

class Box<T> {
  Box(this.value);

  final T value;
}

enum TrafficLight { red, yellow, green }

extension TrafficLightInstruction on TrafficLight {
  String get instruction => switch (this) {
    TrafficLight.red => _tr('Stopp', 'Stop', 'Спри'),
    TrafficLight.yellow => _tr('Warten', 'Wait', 'Изчакай'),
    TrafficLight.green => _tr('Fahren', 'Go', 'Тръгни'),
  };
}

Future<String> loadMessage() async {
  await Future<void>.delayed(Duration.zero);
  return _tr('Daten geladen', 'Data loaded', 'Данните са заредени');
}

Stream<int> countStream(int maximum) async* {
  for (var value = 1; value <= maximum; value++) {
    yield value;
  }
}

String _tr(String german, String english, String bulgarian) {
  return '$german | $english | $bulgarian';
}

void _section(String german, String english, String bulgarian) {
  print('\n=== ${_tr(german, english, bulgarian)} ===');
}
