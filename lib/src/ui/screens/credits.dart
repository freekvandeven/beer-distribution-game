import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          children: [
            Text('Credits'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text('go back'),
            ),
          ],
        ),
      ),
    );
  }
}
