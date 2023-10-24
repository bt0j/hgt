// main.dart
import 'dart:ui';
import 'pages/voice.dart';
import 'pages/text.dart';
import '/pages/settings.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final _defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.brown, brightness: Brightness.light);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.brown, brightness: Brightness.dark);



  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'hongtang',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const HomePage());
    });
  }
}

//voice - rerouted to voice.dart

//text - rerouted to text.dar
// settings - rerouted to settings.dart

//main page

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;

  // This is used to animate the icon of the main FAB
  late Animation<double> _buttonAnimatedIcon;

  // This is used for the child FABs
  late Animation<double> _translateButton;

  // This variable determnies whether the child FABs are visible or not
  bool _isExpanded = false;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      });

    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * 4,
              0.0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.brown.shade500,
              onPressed: () {

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const VoicePage()));

              },
              child: const Icon(
                Icons.mic,
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 3,
              0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.brown.shade500,
              onPressed: () {

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TextPage()));

              },
              child: const Icon(
                Icons.sms_rounded,
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 2,
              0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.brown.shade500,
              onPressed: () {

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SettingsP()));


              },
              child: const Icon(Icons.settings),
            ),
          ),
          // This is the primary FAB
          FloatingActionButton(
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _buttonAnimatedIcon,
            ),
          ),
        ],
      ),
    );
  }
}