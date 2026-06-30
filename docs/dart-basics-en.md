# Dart language reference

[Deutsch](dart-grundlagen-de.md) · [Български](dart-osnovi-bg.md) · [Executable English example](../Dart-Basics.dart)

This is a practical reference for modern Dart 3. It covers the language features
used most often in command-line, server, and Flutter projects.

## Contents

1. [Running Dart](#running-dart)
2. [Keyboard shortcuts](#keyboard-shortcuts)
3. [Program structure and comments](#program-structure-and-comments)
4. [Variables, types, and null safety](#variables-types-and-null-safety)
5. [Operators](#operators)
6. [Strings and numbers](#strings-and-numbers)
7. [Collections](#collections)
8. [Control flow and loops](#control-flow-and-loops)
9. [Functions](#functions)
10. [Records and patterns](#records-and-patterns)
11. [Errors and assertions](#errors-and-assertions)
12. [Classes and object-oriented programming](#classes-and-object-oriented-programming)
13. [Generics](#generics)
14. [Asynchronous programming and isolates](#asynchronous-programming-and-isolates)
15. [Libraries, packages, and JSON](#libraries-packages-and-json)
16. [Documentation, tooling, and tests](#documentation-tooling-and-tests)
17. [Frequent mistakes](#frequent-mistakes)

## Running Dart

Check the installation and run the executable reference:

```sh
dart --version
dart format Dart-Basics.dart
dart analyze Dart-Basics.dart
dart run Dart-Basics.dart
```

Create a console project and fetch its dependencies:

```sh
dart create -t console my_app
cd my_app
dart pub get
dart run
```

## Keyboard shortcuts

### Special characters on a German keyboard

| Character | macOS | Windows |
|---|---|---|
| `[` | `Option + 5` | `AltGr + 8` |
| `]` | `Option + 6` | `AltGr + 9` |
| `{` | `Option + 8` | `AltGr + 7` |
| `}` | `Option + 9` | `AltGr + 0` |
| `\` | `Shift + Option + 7` | `AltGr + ß` |
| `\|` | `Option + 7` | `AltGr + <` |
| `~` | `Option + N`, then Space | `AltGr + +` |
| `$` | `Shift + 4` | `Shift + 4` |
| `%` | `Shift + 5` | `Shift + 5` |
| `&` | `Shift + 6` | `Shift + 6` |
| `/` | `Shift + 7` | `Shift + 7` |

Keyboard layouts and operating-system settings can change some combinations.

### General and VS Code shortcuts

| Action | macOS | Windows/Linux |
|---|---|---|
| Save | `Cmd + S` | `Ctrl + S` |
| Select all | `Cmd + A` | `Ctrl + A` |
| Copy / cut / paste | `Cmd + C/X/V` | `Ctrl + C/X/V` |
| Undo | `Cmd + Z` | `Ctrl + Z` |
| Redo | `Cmd + Shift + Z` | `Ctrl + Y` |
| Find | `Cmd + F` | `Ctrl + F` |
| Toggle line comment | `Cmd + /` | `Ctrl + /` |
| Command Palette | `Cmd + Shift + P` | `Ctrl + Shift + P` |
| Quick Open | `Cmd + P` | `Ctrl + P` |
| Format document | `Option + Shift + F` | `Shift + Alt + F` |
| Start debugging | `F5` | `F5` |
| Stop debugging | `Shift + F5` | `Shift + F5` |
| Toggle terminal | `` Ctrl + ` `` | `` Ctrl + ` `` |

On a German layout, the comment shortcut is often physically
`Cmd + Shift + 7` on macOS and `Ctrl + #` on Windows.

## Program structure and comments

Every directly executable program has a top-level `main` function:

```dart
void main(List<String> arguments) {
  print('Arguments: $arguments');
}
```

Use `Future<void> main() async` when the entry point must use `await`.

```dart
// Single-line comment

/* Multi-line
   comment */

/// Documentation comment for a declaration.
int add(int a, int b) => a + b;
```

Statements normally end with `;`. Blocks use `{}`. Dart formatting is handled
by `dart format`, so manual alignment is unnecessary.

## Variables, types, and null safety

### Common built-in types

| Type | Purpose | Example |
|---|---|---|
| `int` | Integer | `42` |
| `double` | Floating-point number | `3.14` |
| `num` | Supertype of `int` and `double` | `num n = 1.5` |
| `String` | UTF-16 text | `'Dart'` |
| `bool` | `true` or `false` | `bool ready = true` |
| `List<T>` | Ordered collection | `<int>[1, 2]` |
| `Set<T>` | Unique values | `<int>{1, 2}` |
| `Map<K, V>` | Key-value pairs | `{'a': 1}` |
| `Record` | Fixed heterogeneous values | `('Ada', 36)` |
| `Object` | Base class of non-null objects | `Object value = 1` |
| `Object?` | Any value, including `null` | `Object? value` |
| `dynamic` | Dynamic member access | `dynamic value` |
| `Never` | A computation that never completes normally | `Never fail()` |
| `void` | No useful return value | `void log()` |

### Declaration forms

```dart
int count = 0;                 // explicit type
var language = 'Dart';        // inferred as String
final year = DateTime.now().year; // assigned once at runtime
const seconds = 60;            // compile-time constant
late final String token;       // initialized later, read only afterwards

dynamic flexible = 'text';
flexible = 42;                 // allowed, but fewer static checks
```

`var` does not mean dynamic. Once `language` is inferred as `String`, assigning
an `int` to it is a compile-time error.

### Null safety

Types are non-nullable by default. Add `?` only when absence is meaningful.

```dart
String name = 'Ada';
String? nickname;

final displayed = nickname ?? name; // fallback
nickname ??= 'guest';                // assign only if null
final length = nickname.length;      // promoted to non-null here
final upper = maybeName?.toUpperCase();
final forced = maybeName!;            // assertion; throws if null
```

Prefer `?.` and `??` to `!`. Use `!` only when an invariant really guarantees
that the value is not null.

### Type checks and casts

```dart
Object value = 'Dart';

if (value is String) {
  print(value.length); // promoted to String
}

final text = value as String; // throws if the cast is wrong
print(value is! int);
```

## Operators

| Group | Operators |
|---|---|
| Arithmetic | `+  -  *  /  ~/  %  ++  --` |
| Comparison | `==  !=  <  <=  >  >=` |
| Logical | `!  &&  \|\|` |
| Assignment | `=  +=  -=  *=  /=  ~/=  ??=` |
| Bitwise | `&  \|  ^  ~  <<  >>  >>>` |
| Type | `is  is!  as` |
| Null-aware | `??  ?.  ?[]  !` |
| Conditional | `condition ? a : b` |
| Cascade | `..  ?..` |
| Spread | `...  ...?` |

```dart
print(8 / 5);  // 1.6
print(8 ~/ 5); // 1
print(8 % 5);  // 3

final label = age >= 18 ? 'adult' : 'minor';

final buffer = StringBuffer()
  ..write('Hello')
  ..write(' Dart');
```

`==` checks equality as defined by the object's class. `identical(a, b)` checks
whether two references point to exactly the same object.

## Strings and numbers

```dart
const language = 'Dart';
final version = 3;
final text = '$language $version';
final expression = 'Next: ${version + 1}';

final multiLine = '''
First line
Second line
''';

final raw = r'No interpolation: $language and no \n escape';
```

Useful operations:

```dart
text.length;
text.isEmpty;
text.toUpperCase();
text.contains('Dart');
text.split(' ');
text.replaceAll('Dart', 'Flutter');

final integer = int.parse('42');
final maybeInteger = int.tryParse('x'); // null
final decimal = double.parse('3.14');
final rounded = 3.14159.toStringAsFixed(2);
```

For many concatenations, use `StringBuffer`. Unicode code points are available
through `string.runes`.

## Collections

### List

```dart
final numbers = <int>[1, 2, 3];
numbers.add(4);
numbers.addAll([5, 6]);
numbers.remove(2);
print(numbers[0]);
print(numbers.length);

final evens = numbers.where((n) => n.isEven).toList();
final squares = numbers.map((n) => n * n).toList();
final sum = numbers.fold(0, (total, n) => total + n);
```

### Set

```dart
final ids = <int>{1, 2, 2, 3}; // {1, 2, 3}
ids.add(4);
final common = {1, 2, 3}.intersection({2, 3, 4});
final all = {1, 2}.union({2, 3});
```

### Map

```dart
final prices = <String, double>{
  'apple': 0.99,
  'banana': 0.49,
};

prices['banana'] = 0.59;
prices.putIfAbsent('orange', () => 0.79);
final applePrice = prices['apple']; // double? because key might be absent

for (final MapEntry(:key, :value) in prices.entries) {
  print('$key: $value');
}
```

### Spread and collection control flow

```dart
final base = [1, 2, 3];
final includeFour = true;
final values = <int>[
  0,
  ...base,
  if (includeFour) 4,
  for (final n in base) n * 10,
];

List<int>? optional;
final safeCopy = [...?optional];
```

Use `List.unmodifiable`, `Set.unmodifiable`, or `Map.unmodifiable` when callers must
not mutate a collection.

## Control flow and loops

```dart
if (temperature > 25) {
  print('warm');
} else if (temperature > 10) {
  print('mild');
} else {
  print('cold');
}
```

Switch statements and exhaustive switch expressions support patterns:

```dart
final description = switch (score) {
  >= 90 && <= 100 => 'excellent',
  >= 60 && < 90 => 'passed',
  >= 0 && < 60 => 'failed',
  _ => 'invalid',
};

switch (command) {
  case ['move', final x, final y]:
    print('Move to $x, $y');
  case ['quit']:
    break;
  default:
    print('Unknown command');
}
```

Loops:

```dart
for (var i = 0; i < 3; i++) {
  print(i);
}

for (final item in items) {
  if (item == 'skip') continue;
  if (item == 'stop') break;
  print(item);
}

while (condition) {
  updateCondition();
}

do {
  runAtLeastOnce();
} while (condition);
```

## Functions

Functions are objects and can be stored, passed, and returned.

```dart
int add(int a, int b) => a + b;

String greet(String name, [String punctuation = '!']) {
  return 'Hello, $name$punctuation';
}

Uri endpoint({required String host, int port = 443}) {
  return Uri(scheme: 'https', host: host, port: port);
}
```

- `name` is required positional.
- `[punctuation]` is optional positional.
- `{host, port}` are named.
- `required` makes a named parameter mandatory.
- Default values must be compile-time constants.

Anonymous functions, closures, and function types:

```dart
final square = (int n) => n * n;
final values = [1, 2, 3].map(square).toList();

typedef IntOperation = int Function(int a, int b);

int calculate(int a, int b, IntOperation operation) {
  return operation(a, b);
}
```

Synchronous and asynchronous generators:

```dart
Iterable<int> countTo(int max) sync* {
  for (var i = 1; i <= max; i++) yield i;
}

Stream<int> countLater(int max) async* {
  for (var i = 1; i <= max; i++) yield i;
}
```

## Records and patterns

Records are immutable, fixed-size, typed groups of values.

```dart
(String, int) createUser() => ('Ada', 36);
({double x, double y}) point() => (x: 2, y: 3);

final user = createUser();
print(user.$1);
print(user.$2);

final (name, age) = user; // destructuring
final (:x, :y) = point();
```

Patterns can destructure and validate lists, maps, records, and objects:

```dart
if (json case {'name': String name, 'age': int age}) {
  print('$name is $age');
}

final result = switch (point()) {
  (x: 0, y: 0) => 'origin',
  (x: final x, y: final y) when x == y => 'diagonal',
  _ => 'other',
};
```

Useful pattern forms include constants, variables, wildcards (`_`), logical
patterns (`&&`, `||`), relational patterns (`>= 0`), list/map/record patterns,
object patterns, casts, null checks, and `when` guards.

## Errors and assertions

```dart
try {
  final number = int.parse(input);
  print(number);
} on FormatException catch (error, stackTrace) {
  print('Invalid number: $error');
  print(stackTrace);
} finally {
  closeResource();
}
```

Throw any non-null object, but implementing `Exception` gives clearer intent:

```dart
class InvalidAge implements Exception {
  InvalidAge(this.value);
  final int value;
}

Never fail(String message) => throw StateError(message);
```

Assertions are development checks and are usually disabled in production:

```dart
assert(age >= 0, 'Age cannot be negative');
```

Do not use `assert` for validation that must always run.

## Classes and object-oriented programming

### Fields, constructors, methods, getters, and factories

```dart
class Person {
  Person({required this.name, required this.age});

  Person.guest()
      : name = 'Guest',
        age = 0;

  factory Person.fromJson(Map<String, Object?> json) {
    return Person(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  final String name;
  int age;
  static int minimumAge = 0;

  String get label => '$name ($age)';
  set safeAge(int value) => age = value < 0 ? 0 : value;

  void birthday() => age++;
}

final person = Person(name: 'Ada', age: 36)..birthday();
```

Use `const` constructors for deeply immutable compile-time objects. Initializer
lists run before the constructor body. A `factory` can return a cached instance
or a subtype and does not create an object with `this` directly.

### Inheritance, interfaces, and mixins

```dart
abstract interface class Shape {
  double get area;
}

final class Circle implements Shape {
  const Circle(this.radius);
  final double radius;

  @override
  double get area => math.pi * radius * radius;
}

mixin Timestamped {
  final DateTime createdAt = DateTime.now();
}

class Message with Timestamped {}
```

- `extends` inherits implementation from one superclass.
- `implements` adopts one or more interfaces but inherits no implementation.
- `with` applies reusable mixin implementation.
- `super` accesses superclass constructors and members.
- `@override` lets the analyzer verify an intended override.

### Class modifiers

| Modifier | Main purpose |
|---|---|
| `abstract` | Allows unimplemented members; cannot be instantiated directly |
| `base` | Requires implementation inheritance and preserves base behavior |
| `interface` | Allows implementation but prevents external inheritance |
| `final` | Prevents external subtyping |
| `sealed` | Defines a known, exhaustive subtype family in one library |
| `mixin` | Declares reusable behavior for `with` |

These restrictions matter across library boundaries. Modifiers can be combined
in valid forms such as `abstract interface class`.

### Sealed classes and exhaustive switches

```dart
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.message);
  final String message;
}

String describe<T>(Result<T> result) => switch (result) {
  Success(value: final value) => 'Success: $value',
  Failure(message: final text) => 'Failure: $text',
};
```

### Enums, extensions, and extension types

```dart
enum Status {
  pending('Waiting'),
  done('Finished');

  const Status(this.label);
  final String label;
}

extension StringFormatting on String {
  String get capitalized => isEmpty
      ? this
      : '${this[0].toUpperCase()}${substring(1)}';
}

extension type const UserId(int value) {
  bool get isValid => value > 0;
}
```

An extension adds statically resolved members to an existing type. An extension
type wraps a representation at compile time and exposes only its declared API;
it is not the same as allocating a wrapper class.

Classes can also define operators and a `call()` method, making instances
callable like functions.

## Generics

```dart
class Box<T> {
  const Box(this.value);
  final T value;
}

T first<T>(List<T> values) => values.first;

class NumberBox<T extends num> {
  const NumberBox(this.value);
  final T value;
}

final textBox = Box<String>('Dart');
final firstNumber = first<int>([1, 2, 3]);
```

Generics provide reusable code without giving up static type safety. Dart's
generic type information is reified, so it is also available at runtime.

## Asynchronous programming and isolates

### Future, async, and await

```dart
Future<String> loadName() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  return 'Ada';
}

Future<void> showName() async {
  try {
    final name = await loadName();
    print(name);
  } catch (error) {
    print(error);
  }
}

final results = await Future.wait([loadA(), loadB()]);
```

Calling an `async` function returns immediately with a `Future`. `await` pauses
only that asynchronous function, not the whole process.

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

final subscription = stream.listen(
  print,
  onError: print,
  onDone: () => print('done'),
);
await subscription.cancel();
```

A `Future<T>` produces zero or one eventual result. A `Stream<T>` produces a
sequence of asynchronous events. Streams can be single-subscription or
broadcast.

### Isolates

Dart isolates do not share mutable memory. Use them for CPU-heavy work that
would otherwise block the event loop:

```dart
import 'dart:isolate';

int calculate() => List.generate(1000, (i) => i).fold(0, (a, b) => a + b);

final result = await Isolate.run(calculate);
```

Use normal asynchronous I/O for waiting on files, databases, or networks; use
an isolate for substantial computation.

## Libraries, packages, and JSON

Every Dart file is a library. Names beginning with `_` are private to their
library.

```dart
import 'dart:math' as math;
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:my_package/service.dart' hide InternalHelper;

part 'generated_model.dart';
```

Prefer normal imports and small libraries. Use `part` mainly where code
generation or a framework requires it.

Typical `pubspec.yaml`:

```yaml
name: my_app
environment:
  sdk: ^3.12.0

dependencies:
  http: ^1.0.0

dev_dependencies:
  lints: ^6.0.0
  test: ^1.25.0
```

Add dependencies through the tool when possible:

```sh
dart pub add http
dart pub add --dev test
dart pub get
dart pub outdated
dart pub upgrade
```

JSON conversion:

```dart
import 'dart:convert';

final encoded = jsonEncode({'name': 'Ada', 'age': 36});
final decoded = jsonDecode(encoded) as Map<String, dynamic>;
print(decoded['name']);
```

`dart:convert` turns JSON into maps, lists, strings, numbers, booleans, and
`null`. Model classes still need `fromJson`/`toJson` code, written manually or
generated by a package.

## Documentation, tooling, and tests

Documentation comments use `///` and can contain Markdown:

```dart
/// Returns the sum of [a] and [b].
///
/// Throws [ArgumentError] when either argument is negative.
int checkedAdd(int a, int b) {
  if (a < 0 || b < 0) throw ArgumentError('negative value');
  return a + b;
}
```

Metadata attaches annotations to declarations:

```dart
@Deprecated('Use newMethod instead')
void oldMethod() {}

class Todo {
  const Todo(this.message);
  final String message;
}

@Todo('Add validation')
void save() {}
```

Core commands:

```sh
dart format .
dart analyze
dart test
dart run
dart compile exe bin/main.dart
dart doc
```

A basic test with `package:test`:

```dart
import 'package:test/test.dart';

void main() {
  test('adds two numbers', () {
    expect(add(2, 3), equals(5));
  });
}
```

Use `analysis_options.yaml` to enable a lint set:

```yaml
include: package:lints/recommended.yaml
```

## Frequent mistakes

- `var` infers one static type; it is not a synonym for `dynamic`.
- `/` returns a `double`; use `~/` for integer division.
- List indices begin at `0`; an invalid index throws `RangeError`.
- `map[key]` is nullable because the key might not exist.
- Do not use `!` merely to silence null-safety errors.
- Do not forget to `await` a future whose completion or error matters.
- Do not use `forEach` with an `async` callback when sequential `await` is
  required; use a `for` loop.
- Override both `==` and `hashCode` for value-like classes.
- Avoid `dynamic` at API boundaries; parse and validate external data.
- Prefer `final` for local variables that are not reassigned.
- Keep heavy CPU work out of the main isolate.
- Format and analyze before committing: `dart format . && dart analyze`.

For precise edge cases, consult the current
[official Dart language documentation](https://dart.dev/language).
