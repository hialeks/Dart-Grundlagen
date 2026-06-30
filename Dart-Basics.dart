import 'dart:convert';
import 'dart:isolate';
import 'dart:math' as math;

/*
  DART BASICS – EXECUTABLE REFERENCE

  Special characters on a German macOS keyboard
  ------------------------------------------------
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
  Option + N, then Space -> ~

  Special characters on a German Windows keyboard
  --------------------------------------------------
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

  General macOS shortcuts
  ------------------------
  Cmd + S             Save document
  Cmd + A             Select all
  Cmd + C / X / V     Copy / cut / paste
  Cmd + Z             Undo
  Cmd + Shift + Z     Redo
  Cmd + F             Find in document
  Cmd + /             Toggle line comment
                      (Cmd + Shift + 7 on a German layout)

  Useful VS Code shortcuts on macOS
  ---------------------------------
  Cmd + Shift + P     Open Command Palette
  Cmd + P             Quick Open
  Option + Shift + F  Format document
  F5                  Start debugging
  Shift + F5          Stop debugging
  Ctrl + `            Toggle terminal

  General Windows/Linux shortcuts
  ---------------------------------
  Ctrl + S            Save document
  Ctrl + A            Select all
  Ctrl + C / X / V    Copy / cut / paste
  Ctrl + Z            Undo
  Ctrl + Y            Redo
  Ctrl + F            Find in document
  Ctrl + /            Toggle line comment
                      (often Ctrl + # on a German layout)

  Useful VS Code shortcuts on Windows/Linux
  -----------------------------------------
  Ctrl + Shift + P    Open Command Palette
  Ctrl + P            Quick Open
  Shift + Alt + F     Format document
  F5                  Start debugging
  Shift + F5          Stop debugging
  Ctrl + `            Toggle terminal

  Comments
  --------
  // Single-line comment
  /* Multi-line comment */
  /// Documentation comment
*/

Future<void> main() async {
  print('Dart basics – complete overview');

  _basicTypesAndVariables();
  _operatorsAndControlFlow();
  _stringsAndConversions();
  _collectionsAndLoops();
  _functionsRecordsAndPatterns();
  _errorHandling();
  _objectOrientedProgramming();
  await _asynchronyAndParallelism();

  _section('Finished');
  print('All examples were executed successfully.');
}

void _basicTypesAndVariables() {
  _section('Variables, types, and null safety');

  int integer = 42;
  double decimal = 3.14;
  num anyNumber = 7;
  String language = 'Dart';
  bool isReady = true;

  // var infers the type once. The variable remains a String afterwards.
  var inferredText = 'Hello';
  inferredText = 'Good day';

  // dynamic permits changing types but bypasses many static checks.
  dynamic flexibleValue = 'Text';
  flexibleValue = 10;

  // final is assigned once at runtime; const is a compile-time constant.
  final currentYear = DateTime.now().year;
  const secondsPerMinute = 60;

  // Types are non-nullable by default. ? explicitly permits null.
  String? nickname;
  final displayName = nickname ?? 'Guest';
  nickname ??= 'Dart learner';

  // late promises that initialization happens before the first read.
  late final String course;
  course = 'Dart Basics';

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
  _section('Operators and control flow');

  const a = 8;
  const b = 5;
  print('Addition: ${a + b}, subtraction: ${a - b}');
  print('Multiplication: ${a * b}, division: ${a / b}');
  print('Integer division: ${a ~/ b}, remainder: ${a % b}');
  print('Comparison: ${a == b}, ${a != b}, ${a > b}, ${a <= b}');
  print('Logic: ${a > 0 && b > 0}, ${a == 0 || b > 0}, ${!(a == b)}');

  var counter = 10;
  print('Post-increment: ${counter++}, afterwards: $counter');
  print('Pre-increment: ${++counter}');
  counter += 5;
  print('After += 5: $counter');

  print(_weatherAdvice(24));
  print(_grade(92));

  const day = 'Saturday';
  final dayType = switch (day) {
    'Saturday' || 'Sunday' => 'weekend',
    _ => 'weekday',
  };
  print('$day is a $dayType.');

  const age = 20;
  print(age >= 18 ? 'Adult' : 'Minor');
}

String _weatherAdvice(int temperature) {
  if (temperature > 20) {
    return 'T-shirt weather';
  } else if (temperature > 10) {
    return 'A light jacket is enough';
  }
  return 'Take a warm jacket';
}

String _grade(int score) => switch (score) {
  >= 90 && <= 100 => 'Excellent',
  >= 80 && < 90 => 'Good',
  >= 70 && < 80 => 'Satisfactory',
  >= 60 && < 70 => 'Pass',
  >= 0 && < 60 => 'Failed',
  _ => 'Invalid score',
};

void _stringsAndConversions() {
  _section('Strings, numbers, and conversion');

  const firstName = 'Ada';
  const lastName = 'Lovelace';
  final fullName = '$firstName $lastName';
  final multiline = '''
Multi-line strings
use three quotation marks.
''';

  print('$fullName (${fullName.length} characters)');
  print(fullName.toUpperCase());
  print('Dart'.contains('art'));
  print(multiline.trim());
  print(int.parse('42'));
  print(int.tryParse('not a number')); // null instead of an exception
  print(math.pi.toStringAsFixed(3));

  final buffer = StringBuffer()
    ..write('Dart ')
    ..write('is ')
    ..write('productive.');
  print(buffer);
}

void _collectionsAndLoops() {
  _section('Collections and loops');

  final numbers = <int>[1, 2, 3, 4, 5];
  numbers
    ..add(6)
    ..remove(1);

  final evenSquares = numbers
      .where((number) => number.isEven)
      .map((number) => number * number)
      .toList();
  final uniqueNumbers = <int>[1, 1, 2, 3].toSet();
  final prices = <String, double>{'apple': 0.99, 'banana': 0.49};
  prices['banana'] = 0.59;

  final extended = <int>[
    0,
    ...numbers,
    if (numbers.isNotEmpty) 7,
    for (final number in numbers.take(2)) number * 10,
  ];

  print('List: $numbers');
  print('Set: $uniqueNumbers');
  print('Map: $prices');
  print('Filtered and transformed: $evenSquares');
  print('Spread, collection-if, and collection-for: $extended');

  for (var index = 0; index < numbers.length; index++) {
    print('Index $index: ${numbers[index]}');
  }

  for (final number in numbers) {
    if (number.isOdd) continue;
    if (number > 4) break;
    print('Even number up to 4: $number');
  }

  var countdown = 3;
  while (countdown > 0) {
    print('Starting in ${countdown--}');
  }

  var attempts = 0;
  do {
    attempts++;
  } while (attempts < 1);
  print('do-while ran $attempts time(s).');

  print('Generator: ${_countTo(4).toList()}');
}

void _functionsRecordsAndPatterns() {
  _section('Functions, records, and patterns');

  print('3 + 5 = ${add(3, 5)}');
  print(greet('Anna'));
  print(greet('Sam', salutation: 'Good morning'));
  print('Gross price: ${grossPrice(100, taxRate: 0.19)}');

  final square = (int number) => number * number;
  print('Square of 4: ${square(4)}');
  print('Generic function: ${firstElement<String>(['Dart', 'Flutter'])}');

  final (name, age) = createUser();
  print('Record: $name, $age');
  print(_describePoint((x: 3, y: 3)));

  final command = <String>['move', '10', '20'];
  switch (command) {
    case ['move', final x, final y]:
      print('Move to x=$x, y=$y.');
    default:
      print('Unknown command');
  }

  assert(add(2, 3) == 5);
}

int add(int left, int right) => left + right;

String greet(String name, {String salutation = 'Hello'}) {
  return '$salutation, $name!';
}

double grossPrice(double netPrice, {required double taxRate}) {
  return netPrice * (1 + taxRate);
}

T firstElement<T>(List<T> values) => values.first;

(String, int) createUser() => ('Ada', 36);

String _describePoint(({int x, int y}) point) => switch (point) {
  (x: 0, y: 0) => 'Origin',
  (x: final x, y: final y) when x == y => 'Point on the diagonal',
  _ => 'Other point',
};

Iterable<int> _countTo(int maximum) sync* {
  for (var value = 1; value <= maximum; value++) {
    yield value;
  }
}

void _errorHandling() {
  _section('Error handling');

  try {
    print(int.parse('12x'));
  } on FormatException catch (error, stackTrace) {
    print('Invalid number: ${error.source}');
    print('Stack trace available: ${stackTrace.toString().isNotEmpty}');
  } finally {
    print('The parsing attempt has finished.');
  }

  try {
    print(_safeDivide(10, 0));
  } on ArgumentError catch (error) {
    print('Error: ${error.message}');
  }
}

double _safeDivide(num dividend, num divisor) {
  if (divisor == 0) {
    throw ArgumentError('Division by zero');
  }
  return dividend / divisor;
}

void _objectOrientedProgramming() {
  _section('Object-oriented programming');

  final person = Person(name: 'Anna', age: 25)
    ..birthday()
    ..birthday();
  final guest = Person.guest();
  final Shape circle = Circle(2);
  final box = Box<String>('Dart');
  final userId = UserId(7);

  print(person.introduction);
  print(guest.introduction);
  print('Circle area: ${circle.area.toStringAsFixed(2)}');
  print('Generic box: ${box.value}');
  print('Traffic light: ${TrafficLight.green.instruction}');
  print('Extension: ${'dart'.capitalized}');
  print('Extension type: ${userId.value}');

  final results = <OperationResult<int>>[
    Success(42),
    const Failure('Not available'),
  ];
  for (final result in results) {
    print(_resultText(result));
  }

  final json = person.toJson();
  print('JSON: ${jsonEncode(json)}');
  print('From JSON: ${Person.fromJson(json).introduction}');
}

class Person with CreatedAt {
  Person({required this.name, required this.age});

  Person.guest() : name = 'Guest', age = 0;

  factory Person.fromJson(Map<String, Object?> json) {
    return Person(name: json['name'] as String, age: json['age'] as int);
  }

  final String name;
  int age;

  void birthday() => age++;

  String get introduction => 'I am $name and I am $age years old.';

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
    TrafficLight.red => 'Stop',
    TrafficLight.yellow => 'Wait',
    TrafficLight.green => 'Go',
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
  Success(value: final value) => 'Success: $value',
  Failure(message: final message) => 'Error: $message',
};

Future<void> _asynchronyAndParallelism() async {
  _section('Asynchrony, streams, and isolates');

  print(await _loadMessage());

  await for (final value in _countAsynchronously(3)) {
    print('Stream value: $value');
  }

  final sum = await Isolate.run(_expensiveCalculation);
  print('Sum calculated in an isolate: $sum');
}

Future<String> _loadMessage() async {
  await Future<void>.delayed(Duration.zero);
  return 'Data was loaded.';
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
