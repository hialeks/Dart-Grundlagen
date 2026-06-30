# Пълен практически справочник за Dart

[Deutsch](dart-grundlagen-de.md) · [English](dart-basics-en.md) · [Изпълним пример на немски](../Dart-Grundlagen.dart)

Този справочник описва съвременния Dart 3 и обхваща езиковите възможности,
които най-често се използват в конзолни, сървърни и Flutter проекти.

## Съдържание

1. [Стартиране на Dart](#стартиране-на-dart)
2. [Клавишни комбинации](#клавишни-комбинации)
3. [Структура на програмата и коментари](#структура-на-програмата-и-коментари)
4. [Променливи, типове и null safety](#променливи-типове-и-null-safety)
5. [Оператори](#оператори)
6. [Низове и числа](#низове-и-числа)
7. [Колекции](#колекции)
8. [Управление на потока и цикли](#управление-на-потока-и-цикли)
9. [Функции](#функции)
10. [Records и patterns](#records-и-patterns)
11. [Грешки и assertions](#грешки-и-assertions)
12. [Класове и обектно-ориентирано програмиране](#класове-и-обектно-ориентирано-програмиране)
13. [Generics](#generics)
14. [Асинхронно програмиране и isolates](#асинхронно-програмиране-и-isolates)
15. [Библиотеки, пакети и JSON](#библиотеки-пакети-и-json)
16. [Документация, инструменти и тестове](#документация-инструменти-и-тестове)
17. [Чести грешки](#чести-грешки)

## Стартиране на Dart

Проверка на инсталацията и стартиране на изпълнимия справочник:

```sh
dart --version
dart format Dart-Grundlagen.dart
dart analyze Dart-Grundlagen.dart
dart run Dart-Grundlagen.dart
```

Създаване на конзолен проект и изтегляне на зависимостите:

```sh
dart create -t console my_app
cd my_app
dart pub get
dart run
```

## Клавишни комбинации

### Специални знаци на немска клавиатурна подредба

| Знак | macOS | Windows |
|---|---|---|
| `[` | `Option + 5` | `AltGr + 8` |
| `]` | `Option + 6` | `AltGr + 9` |
| `{` | `Option + 8` | `AltGr + 7` |
| `}` | `Option + 9` | `AltGr + 0` |
| `\` | `Shift + Option + 7` | `AltGr + ß` |
| `\|` | `Option + 7` | `AltGr + <` |
| `~` | `Option + N`, после Space | `AltGr + +` |
| `$` | `Shift + 4` | `Shift + 4` |
| `%` | `Shift + 5` | `Shift + 5` |
| `&` | `Shift + 6` | `Shift + 6` |
| `/` | `Shift + 7` | `Shift + 7` |

Комбинациите могат да се различават според клавиатурната подредба и
настройките на операционната система.

### Общи и VS Code комбинации

| Действие | macOS | Windows/Linux |
|---|---|---|
| Запазване | `Cmd + S` | `Ctrl + S` |
| Избиране на всичко | `Cmd + A` | `Ctrl + A` |
| Копиране / изрязване / поставяне | `Cmd + C/X/V` | `Ctrl + C/X/V` |
| Отмяна | `Cmd + Z` | `Ctrl + Z` |
| Повторение | `Cmd + Shift + Z` | `Ctrl + Y` |
| Търсене | `Cmd + F` | `Ctrl + F` |
| Коментар на ред | `Cmd + /` | `Ctrl + /` |
| Command Palette | `Cmd + Shift + P` | `Ctrl + Shift + P` |
| Бързо отваряне на файл | `Cmd + P` | `Ctrl + P` |
| Форматиране на документа | `Option + Shift + F` | `Shift + Alt + F` |
| Стартиране на debugging | `F5` | `F5` |
| Спиране на debugging | `Shift + F5` | `Shift + F5` |
| Показване/скриване на терминала | `` Ctrl + ` `` | `` Ctrl + ` `` |

При немска подредба комбинацията за коментар често е физически
`Cmd + Shift + 7` под macOS и `Ctrl + #` под Windows.

## Структура на програмата и коментари

Всяка директно изпълнима програма има top-level функция `main`:

```dart
void main(List<String> arguments) {
  print('Аргументи: $arguments');
}
```

Когато началната функция използва `await`, сигнатурата е
`Future<void> main() async`.

```dart
// Едноредов коментар

/* Многоредов
   коментар */

/// Документационен коментар към декларация.
int add(int a, int b) => a + b;
```

Инструкциите обикновено завършват с `;`, а блоковете използват `{}`.
`dart format` се грижи за форматирането.

## Променливи, типове и null safety

### Често използвани вградени типове

| Тип | Предназначение | Пример |
|---|---|---|
| `int` | Цяло число | `42` |
| `double` | Число с плаваща запетая | `3.14` |
| `num` | Общ тип на `int` и `double` | `num n = 1.5` |
| `String` | UTF-16 текст | `'Dart'` |
| `bool` | `true` или `false` | `bool ready = true` |
| `List<T>` | Подредена колекция | `<int>[1, 2]` |
| `Set<T>` | Уникални стойности | `<int>{1, 2}` |
| `Map<K, V>` | Двойки ключ-стойност | `{'a': 1}` |
| `Record` | Фиксирани разнородни стойности | `('Ada', 36)` |
| `Object` | Базов клас на обектите без null | `Object value = 1` |
| `Object?` | Всяка стойност, включително `null` | `Object? value` |
| `dynamic` | Динамичен достъп до членове | `dynamic value` |
| `Never` | Не завършва нормално | `Never fail()` |
| `void` | Няма полезна върната стойност | `void log()` |

### Начини за деклариране

```dart
int count = 0;                     // изрично зададен тип
var language = 'Dart';             // типът е изведен като String
final year = DateTime.now().year;  // задава се веднъж при изпълнение
const seconds = 60;                // константа при компилация
late final String token;           // ще бъде инициализиран по-късно

dynamic flexible = 'текст';
flexible = 42;                     // позволено, но с по-малко проверки
```

`var` не означава `dynamic`. След като `language` е изведена като `String`,
задаването на `int` е грешка при компилация.

### Null safety

Типовете по подразбиране не допускат `null`. Добавяйте `?` само когато липсата
на стойност има смисъл.

```dart
String name = 'Ada';
String? nickname;

final displayed = nickname ?? name; // резервна стойност
nickname ??= 'Гост';                // задава само ако е null
final length = nickname.length;      // вече е non-null
final upper = maybeName?.toUpperCase();
final forced = maybeName!;            // хвърля грешка при null
```

Предпочитайте `?.` и `??` пред `!`. Използвайте `!` само когато сигурно условие
действително гарантира, че стойността не е `null`.

### Проверка и преобразуване на тип

```dart
Object value = 'Dart';

if (value is String) {
  print(value.length); // автоматична type promotion
}

final text = value as String; // хвърля грешка при неправилен тип
print(value is! int);
```

## Оператори

| Група | Оператори |
|---|---|
| Аритметични | `+  -  *  /  ~/  %  ++  --` |
| Сравнителни | `==  !=  <  <=  >  >=` |
| Логически | `!  &&  \|\|` |
| Присвояване | `=  +=  -=  *=  /=  ~/=  ??=` |
| Побитови | `&  \|  ^  ~  <<  >>  >>>` |
| Типове | `is  is!  as` |
| Null-aware | `??  ?.  ?[]  !` |
| Условен | `condition ? a : b` |
| Cascade | `..  ?..` |
| Spread | `...  ...?` |

```dart
print(8 / 5);  // 1.6
print(8 ~/ 5); // 1
print(8 % 5);  // 3

final label = age >= 18 ? 'пълнолетен' : 'непълнолетен';

final buffer = StringBuffer()
  ..write('Здравей')
  ..write(' Dart');
```

`==` проверява равенство според имплементацията на класа. `identical(a, b)`
проверява дали две референции сочат към един и същ обект.

## Низове и числа

```dart
const language = 'Dart';
final version = 3;
final text = '$language $version';
final expression = 'Следваща: ${version + 1}';

final multiLine = '''
Първи ред
Втори ред
''';

final raw = r'Без интерполация и escape последователности';
```

Полезни операции:

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

При много слепвания използвайте `StringBuffer`. Unicode code points са
достъпни чрез `string.runes`.

## Колекции

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
  'ябълка': 0.99,
  'банан': 0.49,
};

prices['банан'] = 0.59;
prices.putIfAbsent('портокал', () => 0.79);
final applePrice = prices['ябълка']; // double?, ключът може да липсва

for (final MapEntry(:key, :value) in prices.entries) {
  print('$key: $value');
}
```

### Spread и условия в колекции

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

Използвайте `List.unmodifiable`, `Set.unmodifiable` или `Map.unmodifiable`, когато
извикващият код не трябва да променя колекцията.

## Управление на потока и цикли

```dart
if (temperature > 25) {
  print('топло');
} else if (temperature > 10) {
  print('умерено');
} else {
  print('студено');
}
```

Switch инструкциите и изчерпателните switch изрази поддържат patterns:

```dart
final description = switch (score) {
  >= 90 && <= 100 => 'отличен',
  >= 60 && < 90 => 'издържал',
  >= 0 && < 60 => 'неиздържал',
  _ => 'невалиден',
};

switch (command) {
  case ['премести', final x, final y]:
    print('Премести до $x, $y');
  case ['край']:
    break;
  default:
    print('Непозната команда');
}
```

Цикли:

```dart
for (var i = 0; i < 3; i++) {
  print(i);
}

for (final item in items) {
  if (item == 'пропусни') continue;
  if (item == 'спри') break;
  print(item);
}

while (condition) {
  updateCondition();
}

do {
  runAtLeastOnce();
} while (condition);
```

## Функции

Функциите са обекти и могат да бъдат съхранявани, подавани и връщани.

```dart
int add(int a, int b) => a + b;

String greet(String name, [String punctuation = '!']) {
  return 'Здравей, $name$punctuation';
}

Uri endpoint({required String host, int port = 443}) {
  return Uri(scheme: 'https', host: host, port: port);
}
```

- `name` е задължителен позиционен параметър.
- `[punctuation]` е незадължителен позиционен параметър.
- `{host, port}` са именувани параметри.
- `required` прави именувания параметър задължителен.
- Стойностите по подразбиране трябва да са константи при компилация.

Анонимни функции, closures и типове функции:

```dart
final square = (int n) => n * n;
final values = [1, 2, 3].map(square).toList();

typedef IntOperation = int Function(int a, int b);

int calculate(int a, int b, IntOperation operation) {
  return operation(a, b);
}
```

Синхронни и асинхронни generators:

```dart
Iterable<int> countTo(int max) sync* {
  for (var i = 1; i <= max; i++) yield i;
}

Stream<int> countLater(int max) async* {
  for (var i = 1; i <= max; i++) yield i;
}
```

## Records и patterns

Records са неизменяеми, типизирани групи от стойности с фиксиран размер.

```dart
(String, int) createUser() => ('Ada', 36);
({double x, double y}) point() => (x: 2, y: 3);

final user = createUser();
print(user.$1);
print(user.$2);

final (name, age) = user;
final (:x, :y) = point();
```

Patterns могат да разглобяват и валидират списъци, maps, records и обекти:

```dart
if (json case {'name': String name, 'age': int age}) {
  print('$name е на $age години');
}

final result = switch (point()) {
  (x: 0, y: 0) => 'координатно начало',
  (x: final x, y: final y) when x == y => 'диагонал',
  _ => 'друга точка',
};
```

Полезните форми включват constant, variable и wildcard patterns (`_`),
логически (`&&`, `||`) и релационни patterns (`>= 0`), list/map/record/object
patterns, casts, null проверки и `when` guards.

## Грешки и assertions

```dart
try {
  final number = int.parse(input);
  print(number);
} on FormatException catch (error, stackTrace) {
  print('Невалидно число: $error');
  print(stackTrace);
} finally {
  closeResource();
}
```

Може да бъде хвърлен всеки non-null обект, но имплементирането на `Exception`
показва намерението по-ясно:

```dart
class InvalidAge implements Exception {
  InvalidAge(this.value);
  final int value;
}

Never fail(String message) => throw StateError(message);
```

Assertions са проверки за разработка и обикновено са изключени в production:

```dart
assert(age >= 0, 'Възрастта не може да е отрицателна');
```

Не използвайте `assert` за валидация, която трябва винаги да се изпълнява.

## Класове и обектно-ориентирано програмиране

### Полета, конструктори, методи, getters и factories

```dart
class Person {
  Person({required this.name, required this.age});

  Person.guest()
      : name = 'Гост',
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

Използвайте `const` конструктори за напълно неизменяеми обекти, известни при
компилация. Инициализиращите списъци се изпълняват преди тялото на конструктора.
`factory` може да върне кеширана инстанция или подтип.

### Наследяване, интерфейси и mixins

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

- `extends` наследява имплементация от един родителски клас.
- `implements` приема интерфейси без имплементацията им.
- `with` добавя преизползваема имплементация от mixin.
- `super` дава достъп до членове на родителския клас.
- `@override` позволява проверка на предефинирането.

### Class modifiers

| Модификатор | Основно предназначение |
|---|---|
| `abstract` | Позволява неимплементирани членове; няма директна инстанция |
| `base` | Изисква наследяване на имплементацията |
| `interface` | Позволява имплементиране, но спира външното наследяване |
| `final` | Спира създаването на външни подтипове |
| `sealed` | Задава известно и изчерпателно семейство от подтипове |
| `mixin` | Декларира преизползваемо поведение за `with` |

Ограниченията имат значение между библиотеки. Модификаторите могат да се
съчетават, например `abstract interface class`.

### Sealed класове и изчерпателни switches

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
  Success(value: final value) => 'Успех: $value',
  Failure(message: final text) => 'Грешка: $text',
};
```

### Enums, extensions и extension types

```dart
enum Status {
  pending('Изчакване'),
  done('Готово');

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

Extension добавя статично разрешавани членове към съществуващ тип. Extension
type обвива представяне при компилация и излага само декларирания си API; той
не е обикновен wrapper клас.

Класовете могат да дефинират оператори и метод `call()`, така че инстанциите им
да се извикват като функции.

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

Generics дават преизползваем код без загуба на статична типова безопасност.
Информацията за generic типовете в Dart се запазва и при изпълнение.

## Асинхронно програмиране и isolates

### Future, async и await

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

Извикването на `async` функция веднага връща `Future`. `await` поставя на пауза
само тази асинхронна функция, а не целия процес.

### Stream

```dart
Stream<int> ticks(int max) async* {
  for (var i = 1; i <= max; i++) yield i;
}

await for (final tick in ticks(3)) {
  print(tick);
}

final subscription = stream.listen(
  print,
  onError: print,
  onDone: () => print('готово'),
);
await subscription.cancel();
```

`Future<T>` дава нула или един бъдещ резултат. `Stream<T>` дава поредица от
асинхронни събития. Streams могат да бъдат single-subscription или broadcast.

### Isolates

Dart isolates не споделят променяема памет. Използвайте ги за тежки изчисления,
които иначе биха блокирали event loop:

```dart
import 'dart:isolate';

int calculate() => List.generate(1000, (i) => i).fold(0, (a, b) => a + b);

final result = await Isolate.run(calculate);
```

За изчакване на файлове, бази данни или мрежа използвайте асинхронно I/O;
isolate е подходящ за значителна изчислителна работа.

## Библиотеки, пакети и JSON

Всеки Dart файл е библиотека. Имената, започващи с `_`, са частни в рамките на
своята библиотека.

```dart
import 'dart:math' as math;
import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:my_package/service.dart' hide InternalHelper;

part 'generated_model.dart';
```

Предпочитайте нормални imports и малки библиотеки. Използвайте `part` главно
когато code generation или framework го изисква.

Примерен `pubspec.yaml`:

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

Добавяйте зависимости чрез инструмента, когато е възможно:

```sh
dart pub add http
dart pub add --dev test
dart pub get
dart pub outdated
dart pub upgrade
```

Преобразуване на JSON:

```dart
import 'dart:convert';

final encoded = jsonEncode({'name': 'Ada', 'age': 36});
final decoded = jsonDecode(encoded) as Map<String, dynamic>;
print(decoded['name']);
```

`dart:convert` превръща JSON в maps, lists, strings, numbers, booleans и `null`.
Моделните класове все още се нуждаят от `fromJson`/`toJson`, написани ръчно или
генерирани от пакет.

## Документация, инструменти и тестове

Документационните коментари започват с `///` и могат да съдържат Markdown:

```dart
/// Връща сбора на [a] и [b].
///
/// Хвърля [ArgumentError], ако някой аргумент е отрицателен.
int checkedAdd(int a, int b) {
  if (a < 0 || b < 0) throw ArgumentError('отрицателна стойност');
  return a + b;
}
```

Metadata прикрепя annotations към декларации:

```dart
@Deprecated('Използвайте newMethod')
void oldMethod() {}

class Todo {
  const Todo(this.message);
  final String message;
}

@Todo('Добави валидация')
void save() {}
```

Основни команди:

```sh
dart format .
dart analyze
dart test
dart run
dart compile exe bin/main.dart
dart doc
```

Основен тест с `package:test`:

```dart
import 'package:test/test.dart';

void main() {
  test('събира две числа', () {
    expect(add(2, 3), equals(5));
  });
}
```

Lint правила се включват чрез `analysis_options.yaml`:

```yaml
include: package:lints/recommended.yaml
```

## Чести грешки

- `var` извежда един статичен тип; не е синоним на `dynamic`.
- `/` връща `double`; използвайте `~/` за целочислено деление.
- Индексите на списъците започват от `0`; невалиден индекс хвърля `RangeError`.
- `map[key]` е nullable, защото ключът може да липсва.
- Не използвайте `!` само за да заглушите грешка от null safety.
- Не пропускайте `await`, когато завършването или грешката на Future са важни.
- Не използвайте `forEach` с `async` callback, когато е нужен последователен
  `await`; използвайте `for` цикъл.
- За класове, представляващи стойности, предефинирайте и `==`, и `hashCode`.
- Избягвайте `dynamic` по границите на API; парсвайте и валидирайте външните
  данни.
- Предпочитайте `final` за локални променливи, които не се преназначават.
- Не оставяйте тежки изчисления в главния isolate.
- Преди commit форматирайте и анализирайте:
  `dart format . && dart analyze`.

За прецизни гранични случаи използвайте актуалната
[официална документация на Dart](https://dart.dev/language).
