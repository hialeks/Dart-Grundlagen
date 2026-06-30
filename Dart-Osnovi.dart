import 'dart:convert';
import 'dart:isolate';
import 'dart:math' as math;

/*
  ОСНОВИ НА DART – ИЗПЪЛНИМ СПРАВОЧНИК

  Специални знаци на немска macOS клавиатура
  ------------------------------------------
  Option + 5             -> [
  Option + 6             -> ]
  Option + 7             -> |
  Option + 8             -> {
  Option + 9             -> }
  Shift + 4              -> $
  Shift + 5              -> %
  Shift + 6              -> &
  Shift + 7              -> /
  Shift + Option + 7     -> \
  Option + N, после Space -> ~

  Специални знаци на немска Windows клавиатура
  --------------------------------------------
  AltGr + 7          -> {
  AltGr + 8          -> [
  AltGr + 9          -> ]
  AltGr + 0          -> }
  AltGr + <          -> |
  AltGr + ß          -> \
  AltGr + +          -> ~
  Shift + 4          -> $
  Shift + 5          -> %
  Shift + 6          -> &
  Shift + 7          -> /

  Общи клавишни комбинации за macOS
  ---------------------------------
  Cmd + S             Запазване на документа
  Cmd + A             Избиране на всичко
  Cmd + C / X / V     Копиране / изрязване / поставяне
  Cmd + Z             Отмяна
  Cmd + Shift + Z     Повторение
  Cmd + F             Търсене в документа
  Cmd + /             Коментар на ред
                      (Cmd + Shift + 7 при немска подредба)

  Полезни VS Code комбинации за macOS
  -----------------------------------
  Cmd + Shift + P     Отваряне на Command Palette
  Cmd + P             Бързо отваряне на файл
  Option + Shift + F  Форматиране на документа
  F5                  Стартиране на debugging
  Shift + F5          Спиране на debugging
  Ctrl + `            Показване/скриване на терминала

  Общи комбинации за Windows/Linux
  --------------------------------
  Ctrl + S            Запазване на документа
  Ctrl + A            Избиране на всичко
  Ctrl + C / X / V    Копиране / изрязване / поставяне
  Ctrl + Z            Отмяна
  Ctrl + Y            Повторение
  Ctrl + F            Търсене в документа
  Ctrl + /            Коментар на ред
                      (често Ctrl + # при немска подредба)

  Полезни VS Code комбинации за Windows/Linux
  -------------------------------------------
  Ctrl + Shift + P    Отваряне на Command Palette
  Ctrl + P            Бързо отваряне на файл
  Shift + Alt + F     Форматиране на документа
  F5                  Стартиране на debugging
  Shift + F5          Спиране на debugging
  Ctrl + `            Показване/скриване на терминала

  Коментари
  ---------
  // Едноредов коментар
  /* Многоредов коментар */
  /// Документационен коментар
*/

Future<void> main() async {
  print('Основи на Dart – пълен преглед');

  _basicTypesAndVariables();
  _operatorsAndControlFlow();
  _stringsAndConversions();
  _collectionsAndLoops();
  _functionsRecordsAndPatterns();
  _errorHandling();
  _objectOrientedProgramming();
  await _asynchronyAndParallelism();

  _section('Готово');
  print('Всички примери бяха изпълнени успешно.');
}

void _basicTypesAndVariables() {
  _section('Променливи, типове и null safety');

  int integer = 42;
  double decimal = 3.14;
  num anyNumber = 7;
  String language = 'Dart';
  bool isReady = true;

  // var извежда типа еднократно. След това променливата остава String.
  var inferredText = 'Здравей';
  inferredText = 'Добър ден';

  // dynamic позволява смяна на типа, но заобикаля много статични проверки.
  dynamic flexibleValue = 'Текст';
  flexibleValue = 10;

  // final се задава веднъж при изпълнение; const е константа при компилация.
  final currentYear = DateTime.now().year;
  const secondsPerMinute = 60;

  // Типовете по подразбиране не допускат null. ? изрично го разрешава.
  String? nickname;
  final displayName = nickname ?? 'Гост';
  nickname ??= 'Учащ Dart';

  // late обещава инициализация преди първото прочитане.
  late final String course;
  course = 'Основи на Dart';

  print('$integer, $decimal, $anyNumber, $language, $isReady');
  print('$inferredText, $flexibleValue, $currentYear');
  print('$secondsPerMinute, $displayName, $nickname, $course');

  integer = 43;
  decimal = math.pi;
  anyNumber = 2.5;
  language = 'Dart 3';
  isReady = false;
  print('$integer, $decimal, $anyNumber, $language, $isReady');
}

void _operatorsAndControlFlow() {
  _section('Оператори и управление на потока');

  const a = 8;
  const b = 5;
  print('Събиране: ${a + b}, изваждане: ${a - b}');
  print('Умножение: ${a * b}, деление: ${a / b}');
  print('Целочислено деление: ${a ~/ b}, остатък: ${a % b}');
  print('Сравнение: ${a == b}, ${a != b}, ${a > b}, ${a <= b}');
  print('Логика: ${a > 0 && b > 0}, ${a == 0 || b > 0}, ${!(a == b)}');

  var counter = 10;
  print('Постинкремент: ${counter++}, след това: $counter');
  print('Преинкремент: ${++counter}');
  counter += 5;
  print('След += 5: $counter');

  print(_weatherAdvice(24));
  print(_grade(92));

  const day = 'събота';
  final dayType = switch (day) {
    'събота' || 'неделя' => 'почивен ден',
    _ => 'работен ден',
  };
  print('$day е $dayType.');

  const age = 20;
  print(age >= 18 ? 'Пълнолетен' : 'Непълнолетен');
}

String _weatherAdvice(int temperature) {
  if (temperature > 20) {
    return 'Време за тениска';
  } else if (temperature > 10) {
    return 'Достатъчно е леко яке';
  }
  return 'Вземи топло яке';
}

String _grade(int score) => switch (score) {
  >= 90 && <= 100 => 'Отличен',
  >= 80 && < 90 => 'Много добър',
  >= 70 && < 80 => 'Добър',
  >= 60 && < 70 => 'Среден',
  >= 0 && < 60 => 'Неиздържал',
  _ => 'Невалиден брой точки',
};

void _stringsAndConversions() {
  _section('Низове, числа и преобразуване');

  const firstName = 'Ada';
  const lastName = 'Lovelace';
  final fullName = '$firstName $lastName';
  final multiline = '''
Многоредовите низове
използват три кавички.
''';

  print('$fullName (${fullName.length} знака)');
  print(fullName.toUpperCase());
  print('Dart'.contains('art'));
  print(multiline.trim());
  print(int.parse('42'));
  print(int.tryParse('не е число')); // null вместо exception
  print(math.pi.toStringAsFixed(3));

  final buffer = StringBuffer()
    ..write('Dart ')
    ..write('е ')
    ..write('продуктивен.');
  print(buffer);
}

void _collectionsAndLoops() {
  _section('Колекции и цикли');

  final numbers = <int>[1, 2, 3, 4, 5];
  numbers
    ..add(6)
    ..remove(1);

  final evenSquares = numbers
      .where((number) => number.isEven)
      .map((number) => number * number)
      .toList();
  final uniqueNumbers = <int>[1, 1, 2, 3].toSet();
  final prices = <String, double>{'ябълка': 0.99, 'банан': 0.49};
  prices['банан'] = 0.59;

  final extended = <int>[
    0,
    ...numbers,
    if (numbers.isNotEmpty) 7,
    for (final number in numbers.take(2)) number * 10,
  ];

  print('List: $numbers');
  print('Set: $uniqueNumbers');
  print('Map: $prices');
  print('Филтрирано и преобразувано: $evenSquares');
  print('Spread, collection-if и collection-for: $extended');

  for (var index = 0; index < numbers.length; index++) {
    print('Индекс $index: ${numbers[index]}');
  }

  for (final number in numbers) {
    if (number.isOdd) continue;
    if (number > 4) break;
    print('Четно число до 4: $number');
  }

  var countdown = 3;
  while (countdown > 0) {
    print('Старт след ${countdown--}');
  }

  var attempts = 0;
  do {
    attempts++;
  } while (attempts < 1);
  print('do-while се изпълни $attempts път(и).');

  print('Generator: ${_countTo(4).toList()}');
}

void _functionsRecordsAndPatterns() {
  _section('Функции, records и patterns');

  print('3 + 5 = ${add(3, 5)}');
  print(greet('Anna'));
  print(greet('Sam', salutation: 'Добро утро'));
  print('Цена с данък: ${grossPrice(100, taxRate: 0.19)}');

  final square = (int number) => number * number;
  print('Квадрат на 4: ${square(4)}');
  print('Generic функция: ${firstElement<String>(['Dart', 'Flutter'])}');

  final (name, age) = createUser();
  print('Record: $name, $age');
  print(_describePoint((x: 3, y: 3)));

  final command = <String>['премести', '10', '20'];
  switch (command) {
    case ['премести', final x, final y]:
      print('Премести до x=$x, y=$y.');
    default:
      print('Непозната команда');
  }

  assert(add(2, 3) == 5);
}

int add(int left, int right) => left + right;

String greet(String name, {String salutation = 'Здравей'}) {
  return '$salutation, $name!';
}

double grossPrice(double netPrice, {required double taxRate}) {
  return netPrice * (1 + taxRate);
}

T firstElement<T>(List<T> values) => values.first;

(String, int) createUser() => ('Ada', 36);

String _describePoint(({int x, int y}) point) => switch (point) {
  (x: 0, y: 0) => 'Координатно начало',
  (x: final x, y: final y) when x == y => 'Точка върху диагонала',
  _ => 'Друга точка',
};

Iterable<int> _countTo(int maximum) sync* {
  for (var value = 1; value <= maximum; value++) {
    yield value;
  }
}

void _errorHandling() {
  _section('Обработка на грешки');

  try {
    print(int.parse('12x'));
  } on FormatException catch (error, stackTrace) {
    print('Невалидно число: ${error.source}');
    print('Има stack trace: ${stackTrace.toString().isNotEmpty}');
  } finally {
    print('Опитът за преобразуване приключи.');
  }

  try {
    print(_safeDivide(10, 0));
  } on ArgumentError catch (error) {
    print('Грешка: ${error.message}');
  }
}

double _safeDivide(num dividend, num divisor) {
  if (divisor == 0) {
    throw ArgumentError('Деление на нула');
  }
  return dividend / divisor;
}

void _objectOrientedProgramming() {
  _section('Обектно-ориентирано програмиране');

  final person = Person(name: 'Anna', age: 25)
    ..birthday()
    ..birthday();
  final guest = Person.guest();
  final Shape circle = Circle(2);
  final box = Box<String>('Dart');
  final userId = UserId(7);

  print(person.introduction);
  print(guest.introduction);
  print('Лице на кръга: ${circle.area.toStringAsFixed(2)}');
  print('Generic кутия: ${box.value}');
  print('Светофар: ${TrafficLight.green.instruction}');
  print('Extension: ${'dart'.capitalized}');
  print('Extension type: ${userId.value}');

  final results = <OperationResult<int>>[
    Success(42),
    const Failure('Не е налично'),
  ];
  for (final result in results) {
    print(_resultText(result));
  }

  final json = person.toJson();
  print('JSON: ${jsonEncode(json)}');
  print('От JSON: ${Person.fromJson(json).introduction}');
}

class Person with CreatedAt {
  Person({required this.name, required this.age});

  Person.guest() : name = 'Гост', age = 0;

  factory Person.fromJson(Map<String, Object?> json) {
    return Person(name: json['name'] as String, age: json['age'] as int);
  }

  final String name;
  int age;

  void birthday() => age++;

  String get introduction => 'Аз съм $name и съм на $age години.';

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
    TrafficLight.red => 'Спри',
    TrafficLight.yellow => 'Изчакай',
    TrafficLight.green => 'Тръгни',
  };
}

extension StringFormatting on String {
  String get capitalized {
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

String _resultText<T>(OperationResult<T> result) => switch (result) {
  Success(value: final value) => 'Успех: $value',
  Failure(message: final message) => 'Грешка: $message',
};

Future<void> _asynchronyAndParallelism() async {
  _section('Асинхронност, streams и isolates');

  print(await _loadMessage());

  await for (final value in _countAsynchronously(3)) {
    print('Стойност от stream: $value');
  }

  final sum = await Isolate.run(_expensiveCalculation);
  print('Сума, изчислена в isolate: $sum');
}

Future<String> _loadMessage() async {
  await Future<void>.delayed(Duration.zero);
  return 'Данните бяха заредени.';
}

Stream<int> _countAsynchronously(int maximum) async* {
  for (var value = 1; value <= maximum; value++) {
    await Future<void>.delayed(Duration.zero);
    yield value;
  }
}

int _expensiveCalculation() {
  return List<int>.generate(1000, (index) => index).fold(0, (a, b) => a + b);
}

void _section(String title) {
  print('\n=== $title ===');
}
