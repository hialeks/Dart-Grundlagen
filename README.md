# Dart language reference

## Choose a language

| Language | Complete reference | Executable example |
|---|---|---|
| Deutsch | [Dart-Sprachreferenz](docs/dart-grundlagen-de.md) | [Dart-Grundlagen.dart](Dart-Grundlagen.dart) |
| English | [Dart language reference](docs/dart-basics-en.md) | [Dart-Basics.dart](Dart-Basics.dart) |
| Български | [Пълен практически справочник](docs/dart-osnovi-bg.md) | [Dart-Osnovi.dart](Dart-Osnovi.dart) |

Every language has its own documentation and standalone executable Dart file.
Each version contains:

- macOS and Windows keyboard shortcuts;
- syntax, types, null safety, operators, strings, and collections;
- control flow, functions, records, and patterns;
- errors, classes, class modifiers, mixins, extensions, and generics;
- futures, streams, isolates, libraries, packages, JSON, tooling, and tests.

## Format, analyze, and run

```sh
dart format Dart-Grundlagen.dart Dart-Basics.dart Dart-Osnovi.dart

dart analyze Dart-Grundlagen.dart
dart analyze Dart-Basics.dart
dart analyze Dart-Osnovi.dart

dart run Dart-Grundlagen.dart
dart run Dart-Basics.dart
dart run Dart-Osnovi.dart
```

The reference targets modern Dart 3. All executable examples are verified with
the Dart SDK installed in this workspace.
