import 'package:flutter/material.dart';
import 'package:grayscale/grayscale.dart';
import 'package:provider/provider.dart';
import 'package:ui_example/ui_example.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GrayscaleModel(),
      child: const GrayscaleApp(),
    ),
  );
}

class GrayscaleApp extends StatelessWidget {
  const GrayscaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GrayscaleModel>(builder: (context, grayscale, child) {
      if (grayscale.isGray) {
        return MaterialApp(
          title: 'Flutter Demo',
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
      } else {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(brightness: Brightness.light),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.system,
          home: const HomePage(title: 'Grayscale Counter'),
        );
      }
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            GrayscaleSwitch(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: UiExamples(),
            ),
          ],
        ),
      ),
    );
  }
}

class GrayscaleSwitch extends StatelessWidget {
  const GrayscaleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GrayscaleModel>(builder: (context, grayscale, child) {
      return SwitchListTile(
        title: const Text('Grayscale'),
        value: grayscale.isGray,
        onChanged: (v) => grayscale.setValue(v),
      );
    });
  }
}

class GrayscaleModel extends ChangeNotifier {
  bool _isGray = true;
  bool get isGray => _isGray;

  void setValue(bool value) {
    _isGray = value;
    notifyListeners();
  }
}
