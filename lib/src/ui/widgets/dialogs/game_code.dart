import 'package:flutter/material.dart';

class GameCodeDialog extends StatelessWidget {
  GameCodeDialog({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // alert dialog with inputfield for game code
    return AlertDialog(
      title: Text('Game Code'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Enter a game code'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(''),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text('Join'),
        ),
      ],
    );
  }
}
