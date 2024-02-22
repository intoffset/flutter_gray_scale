import 'package:flutter/material.dart';
import 'package:grayscale/grayscale.dart';
import 'package:provider/provider.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const GrayscaleSwitch(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
