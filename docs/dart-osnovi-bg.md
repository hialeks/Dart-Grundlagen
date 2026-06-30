# Кратък справочник за Dart

[Deutsch](dart-grundlagen-de.md) · [English](dart-basics-en.md) · [Изпълним пример](../Dart-Grundlagen.dart)

## Променливи и типове

```dart
int chislo = 42;
double pi = 3.14;
String text = 'Здравей';
bool gotovo = false;
var name = 'Ada';       // типът е изведен като String
final year = DateTime.now().year;
const minutes = 60;
String? nickname;       // може да бъде null
print(nickname ?? 'Гост');
```

`var` не е `dynamic`: изведеният тип се запазва. `final` може да се зададе само
веднъж, а `const` трябва да бъде известна още при компилация.

## Оператори и управление на потока

```dart
a + b;  a - b;  a * b;  a / b;  a ~/ b;  a % b;
a == b; a != b; a > b;  a <= b;
ready && online; ready || online; !ready;

if (age >= 18) {
  print('пълнолетен');
} else {
  print('непълнолетен');
}

final type = switch (day) {
  'сб' || 'нд' => 'почивен ден',
  _ => 'работен ден',
};
```

`/` връща `double`, `~/` извършва целочислено деление, а `%` връща остатъка.

## Колекции и цикли

```dart
final list = <int>[1, 2, 3];
final set = <int>{1, 2, 2};
final prices = <String, double>{'ябълка': 0.99};

for (final value in list) {
  print(value);
}

final squares = [for (final n in list) n * n];
final copy = [0, ...list, if (list.isNotEmpty) 4];
```

`List` е подреден, `Set` не съдържа повторения, а `Map` свързва ключове със
стойности.

## Функции

```dart
int add(int a, int b) => a + b;

String greet(String name, {String salutation = 'Здравей'}) {
  return '$salutation, $name!';
}

double gross(double net, {required double tax}) {
  return net * (1 + tax);
}
```

Фигурните скоби задават именувани параметри. `required` прави именувания
параметър задължителен.

## Records и patterns (Dart 3)

```dart
(String, int) user() => ('Ada', 36);

final (name, age) = user();
final point = (x: 3, y: 3);

final description = switch (point) {
  (x: 0, y: 0) => 'координатно начало',
  (x: final x, y: final y) when x == y => 'диагонал',
  _ => 'друга точка',
};
```

Records обединяват няколко стойности. Patterns проверяват структурата им и ги
разглобяват на части.

## Класове и generics

```dart
class Box<T> {
  Box(this.value);
  final T value;
}

enum TrafficLight { red, yellow, green }

final box = Box<String>('Dart');
```

Абстрактните класове задават договори, `extends` наследява имплементация, а
`implements` изисква имплементиране на интерфейс.

## Грешки и асинхронност

```dart
try {
  final number = int.parse('42');
} on FormatException catch (error) {
  print(error);
}

Future<String> load() async {
  return 'готово';
}

final result = await load();
```

`Future<T>` дава една стойност по-късно. `Stream<T>` може да дава поредица от
стойности във времето.

## Полезни команди

```sh
dart format Dart-Grundlagen.dart
dart analyze Dart-Grundlagen.dart
dart run Dart-Grundlagen.dart
```
