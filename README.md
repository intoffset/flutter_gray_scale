# Grayscale Color Scheme for Flutter

<p>
  <img src="https://github.com/intoffset/flutter_grayscale/blob/main/doc/light.png?raw=true"
    alt="Grayscale UI for light theme" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/intoffset/flutter_grayscale/blob/main/doc/dark.png?raw=true"
   alt="Grayscale UI for dark theme" height="400"/>
</p>


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
        title: 'Grayscale Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: GrayColorScheme.highContrastGray(Brightness.light),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: GrayColorScheme.highContrastGray(Brightness.dark),
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(title: 'Grayscale Demo'),
      );
    });
  }
}
const like = 'sample';
```

<!-- ## Additional information

N/A -->
