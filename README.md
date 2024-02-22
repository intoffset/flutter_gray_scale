# Grayscale Color Scheme for Flutter

## Features

- Generate a grayscale `ColorScheme`
- Convert `Color` and `ColorScheme` to grayscale

## Getting started

```bash
flutter pub add grayscale
```

## Usage

The mothod `GrayColorScheme.highContrastGray(Brightness)` returns a grayscale color sheme.

```dart
class GrayscaleApp extends StatelessWidget {
  const GrayscaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GrayscaleModel>(builder: (context, isGray, child) {
      return MaterialApp(
        title: 'Grayscale Example',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: GrayColorScheme.highContrastGray(Brightness.light),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: GrayColorScheme.highContrastGray(Brightness.dark),
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(title: 'Grayscale Counter'),
      );
    });
  }
}
const like = 'sample';
```

<!-- ## Additional information

N/A -->
