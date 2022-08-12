import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    required this.child,
    this.escapeTrigger,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final void Function()? escapeTrigger;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool _isEscapePressed = true;
  late Timer _timer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _isEscapePressed = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: (event) {
        if (_focusNode.hasFocus &&
            event is RawKeyDownEvent &&
            event.isKeyPressed(LogicalKeyboardKey.escape)) {
          if (!_isEscapePressed) {
            setState(() {
              _isEscapePressed = true;
            });
            widget.escapeTrigger?.call();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: widget.child,
        ),
      ),
    );
  }
}
