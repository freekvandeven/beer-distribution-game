import 'package:beer_distribution_game/src/config/theme.dart';
import 'package:flutter/material.dart';

class BeerDistributionGame extends StatelessWidget {
  const BeerDistributionGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      routes: {
        '/': (context) => const Text('Flutter Demo Home Page'),
      },
      initialRoute: '/',
    );
  }
}
