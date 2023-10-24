// main.dart
import 'dart:ui';
import 'package:fanyizhege/main.dart';
import 'package:fanyizhege/pages/text.dart';
import 'package:fanyizhege/pages/settings.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

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

class VoicePage extends StatelessWidget {
  const VoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: true,
        leadingWidth: 90,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_circle_left_outlined),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),

        // other stuff
        title: const Text('Voice Translate'),
      ),
    );
  }
}
