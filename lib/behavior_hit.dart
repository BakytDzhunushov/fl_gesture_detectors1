import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

enum _OnTapWinner { none, green, yellow, cyan }

class NestedGestureDetectorsExample extends StatefulWidget {
  const NestedGestureDetectorsExample({super.key});

  @override
  State<NestedGestureDetectorsExample> createState() =>
      _NestedGestureDetectorsExampleState();
}

class _NestedGestureDetectorsExampleState
    extends State<NestedGestureDetectorsExample> {
  bool _isCyanTranslucent = false;
  bool _isColorTranslucent = false;
  _OnTapWinner _winner = _OnTapWinner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('Green onTap');
              setState(() {
                _winner = _OnTapWinner.green;
              });
            },
            onTapDown: (_) => debugPrint('Green onTapDown'),
            onTapCancel: () => debugPrint('Green onTapCancel'),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: _winner == _OnTapWinner.green ? highlightBorder : null,
                color: _isColorTranslucent ? Colors.greenAccent : Colors.green,
              ),
              child: GestureDetector(
                onTap: () {
                  debugPrint('Yellow onTap');
                  setState(() {
                    _winner = _OnTapWinner.yellow;
                  });
                },
                onTapDown: (_) => debugPrint('Yellow onTapDown'),
                onTapCancel: () => debugPrint('Yellow onTapCancel'),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        _winner == _OnTapWinner.yellow ? highlightBorder : null,
                    color: _isColorTranslucent
                        ? Colors.yellowAccent.shade100
                        : Colors.amberAccent,
                  ),
                  width: 360,
                  height: 360,
                  child: GestureDetector(
                    behavior: _isCyanTranslucent
                        ? HitTestBehavior.translucent
                        : HitTestBehavior.opaque,
                    onTap: () {
                      debugPrint('Cyan onTap');
                      setState(() {
                        _winner = _OnTapWinner.cyan;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: _winner == _OnTapWinner.cyan
                            ? highlightBorder
                            : null,
                        color: _isColorTranslucent
                            ? Colors.cyan.shade100
                            : Colors.cyan,
                      ),
                      width: 200,
                      height: 200,
                      child: Text(
                        'Hit Text Behavior.${_isCyanTranslucent ? 'translucent' : 'opaque'} \n'
                        'Поведение текста при попадании.${_isCyanTranslucent ? 'полупрозрачный' : 'непрозрачный'}',
                        textAlign: TextAlign.center,
                        // softWrap: true
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Max'),
                onPressed: () {
                  setState(() {
                    //_isCyanTranslucent = true;
                    _winner = _OnTapWinner.yellow;
                    _winner = _OnTapWinner.cyan;
                    _winner = _OnTapWinner.green;
                  });
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () {
                  setState(() {
                    _isCyanTranslucent = false;
                    _winner = _OnTapWinner.none;
                    _isColorTranslucent = false;
                  });
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: Text(
                  'Set Cyan behavior to ${_isCyanTranslucent ? 'opaque' : 'translucent'}',
                ),
                onPressed: () {
                  setState(() {
                    _isCyanTranslucent = !_isCyanTranslucent;
                    _isColorTranslucent = !_isColorTranslucent;
                    _winner = _OnTapWinner.none;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    debugPrintGestureArenaDiagnostics = false;
    super.dispose();
  }
}
