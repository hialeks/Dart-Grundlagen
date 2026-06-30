# Dart quick reference

[Deutsch](dart-grundlagen-de.md) · [Български](dart-osnovi-bg.md) · [Executable example](../Dart-Grundlagen.dart)

## Variables and types

```dart
int number = 42;
double pi = 3.14;
String text = 'Hello';
bool done = false;
var name = 'Ada';       // inferred as String
final year = DateTime.now().year;
const minutes = 60;
String? nickname;       // may be null
print(nickname ?? 'Guest');
```

`var` is not `dynamic`: the inferred type remains in effect. `final` can be set
only once, while `const` must be known at compile time.

## Operators and control flow

```dart
a + b;  a - b;  a * b;  a / b;  a ~/ b;  a % b;
a == b; a != b; a > b;  a <= b;
ready && online; ready || online; !ready;

if (age >= 18) {
  print('adult');
} else {
  print('minor');
}

final type = switch (day) {
  'Sat' || 'Sun' => 'weekend',
  _ => 'weekday',
};
```

`/` returns a `double`, `~/` performs integer division, and `%` returns the
remainder.

## Collections and loops

```dart
final list = <int>[1, 2, 3];
final set = <int>{1, 2, 2};
final prices = <String, double>{'apple': 0.99};

for (final value in list) {
  print(value);
}

final squares = [for (final n in list) n * n];
final copy = [0, ...list, if (list.isNotEmpty) 4];
```

A `List` is ordered, a `Set` contains no duplicates, and a `Map` associates
keys with values.

## Functions

```dart
int add(int a, int b) => a + b;

String greet(String name, {String salutation = 'Hello'}) {
  return '$salutation, $name!';
}

double gross(double net, {required double tax}) {
  return net * (1 + tax);
}
```

Curly braces define named parameters. `required` makes a named parameter
mandatory.

## Records and patterns (Dart 3)

```dart
(String, int) user() => ('Ada', 36);

final (name, age) = user();
final point = (x: 3, y: 3);

final description = switch (point) {
  (x: 0, y: 0) => 'origin',
  (x: final x, y: final y) when x == y => 'diagonal',
  _ => 'other point',
};
```

Records group multiple values. Patterns check their shape and destructure them.

## Classes and generics

```dart
class Box<T> {
  Box(this.value);
  final T value;
}

enum TrafficLight { red, yellow, green }

final box = Box<String>('Dart');
```

Abstract classes define contracts, `extends` inherits an implementation, and
`implements` requires the implementation of an interface.

## Errors and asynchrony

```dart
try {
  final number = int.parse('42');
} on FormatException catch (error) {
  print(error);
}

Future<String> load() async {
  return 'done';
}

final result = await load();
```

A `Future<T>` supplies one value later. A `Stream<T>` can supply multiple values
over time.

## Useful commands

```sh
dart format Dart-Grundlagen.dart
dart analyze Dart-Grundlagen.dart
dart run Dart-Grundlagen.dart
```
