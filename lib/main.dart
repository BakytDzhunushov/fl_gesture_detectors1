import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'behavior_hit.dart';

/// Flutter code sample for [GestureDetector].

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const NestedGestureDetectorsApp());
}

class NestedGestureDetectorsApp extends StatelessWidget {
  const NestedGestureDetectorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true, title: const Text('Nested Gesture Detectors \n Вложенные детекторы жестов')),
        body: const NestedGestureDetectorsExample(),
      ),
    );
  }
}

