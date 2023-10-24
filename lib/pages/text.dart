import 'dart:ui';
import 'package:fanyizhege/main.dart';
import 'package:fanyizhege/pages/text.dart';
import 'package:fanyizhege/pages/settings.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';


class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Override the default Back button
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
        title: const Text('Text Translate'),
      ),
    );
  }
}